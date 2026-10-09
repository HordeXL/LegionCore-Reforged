#include "WorldState.h"
#include "WorldStatePackets.h"
#include "ObjectAccessor.h"

WorldStateTemplate::WorldStateTemplate(uint32 variableID, uint32 type, uint32 _condition, uint32 flags, uint32 defaultValue) : VariableID(variableID), VariableType(type), ConditionID(_condition), Flags(flags), DefaultValue(defaultValue)
{
}

bool WorldStateTemplate::IsGlobal() const
{
    return VariableType == WorldStatesData::Types::World || VariableType == WorldStatesData::Types::Weekly || VariableType == WorldStatesData::Types::Event;
}

bool WorldStateTemplate::HasFlag(WorldStatesData::Flags flag) const
{
    return Flags & 1 << flag;
}

WorldStateTemplate const* WorldState::GetTemplate() const
{
    return StateTemplate;
}

void WorldState::AddFlag(WorldStatesData::Flags flag)
{
    Flags |= 1 << flag;
}

void WorldState::RemoveFlag(WorldStatesData::Flags flag)
{
    Flags &= ~(1 << flag);
}

bool WorldState::HasFlag(WorldStatesData::Flags flag) const
{
    return bool(Flags & 1 << flag);
}

WorldState::WorldState(uint32 variableID, uint32 type, uint32 flags, uint32 value, WorldStateTemplate const* stateTemplate) : StateTemplate(stateTemplate), VariableID(variableID), Type(type), Flags(flags), Value(value), InstanceID(0), Hidden{false}
{
    Initialize();
}

bool WorldState::IsGlobal() const
{
    return Type == WorldStatesData::Types::World ||
    Type == WorldStatesData::Types::Weekly ||
    Type == WorldStatesData::Types::Event ||
    Type == WorldStatesData::Types::Custom && HasFlag(WorldStatesData::Flags::CustomX) && HasFlag(WorldStatesData::Flags::CustomGlobal);
}

void WorldState::Initialize()
{
    LinkedGuid.Clear();
    {
        std::lock_guard<std::mutex> lock(ClientGuidsLock);
        ClientGuids.clear();
    }

    if (StateTemplate)
    {
        ConditionID = StateTemplate->ConditionID;
        Flags = StateTemplate->Flags;
        Value = StateTemplate->DefaultValue;
    }
    else
    {
        ConditionID = 0;
        Flags = 0;
        Value = 0;
        AddFlag(WorldStatesData::Flags::CustomX);
    }

    AddFlag(WorldStatesData::Flags::Updated);
}

void WorldState::Reload()
{
    if (!StateTemplate)
    {
        AddFlag(WorldStatesData::Flags::CustomX);
        return;
    }

    ConditionID = StateTemplate->ConditionID;
    Flags = StateTemplate->Flags;
    Value = StateTemplate->DefaultValue;
}

void WorldState::Unload()
{
    std::lock_guard<std::mutex> lock(ClientGuidsLock);
    ClientGuids.clear();
}

void WorldState::AddClient(ObjectGuid const& guid)
{
    if (guid.IsPlayer())
    {
        std::lock_guard<std::mutex> lock(ClientGuidsLock);
        ClientGuids.insert(guid);
    }
}

bool WorldState::HasClient(ObjectGuid const& guid) const
{
    std::lock_guard<std::mutex> lock(ClientGuidsLock);
    return ClientGuids.contains(guid);
}

void WorldState::RemoveClient(ObjectGuid const& guid)
{
    if (guid.IsPlayer())
    {
        std::lock_guard<std::mutex> lock(ClientGuidsLock);
        ClientGuids.erase(guid);
    }
}

void WorldState::SetValue(uint32 value, bool hidden)
{
    if (Value == value && Hidden == hidden)
        return;

    Value = value;
    Hidden = hidden;

    RemoveFlag(WorldStatesData::Flags::Saved);
    AddFlag(WorldStatesData::Flags::Updated);

    WorldPackets::WorldState::UpdateWorldState packet;
    packet.VariableID = static_cast<WorldStates>(VariableID);
    packet.Value = value;
    packet.Hidden = hidden;

    std::vector<ObjectGuid> clients;
    {
        std::lock_guard<std::mutex> lock(ClientGuidsLock);
        clients.assign(ClientGuids.begin(), ClientGuids.end());
    }

    // each client lives in his own map thread: the instance check and the send run there, nothing captures this
    WorldPacket const data = *packet.Write();
    uint32 const instanceID = InstanceID;
    for (ObjectGuid const& guid : clients)
    {
        bool posted = ObjectAccessor::PostToPlayer(guid, [data, instanceID](Player* player)
        {
            // Send update only if in instance
            if (instanceID && instanceID != (player->InInstance() ? player->GetInstanceId() : 0))
                return;
            player->SendDirectMessage(&data);
        }, 0, ObjectAccessor::PlayerScope::InWorld);

        if (!posted)
        {
            std::lock_guard<std::mutex> lock(ClientGuidsLock);
            ClientGuids.erase(guid);
        }
    }
}
