/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TRINITY_OBJECTACCESSOR_H
#define TRINITY_OBJECTACCESSOR_H

#include "GridDefines.h"
#include "UpdateData.h"
#include "Object.h"
#include "Player.h"
#include "Transport.h"
#include <safe_ptr.h>
#include <shared_mutex>
#include <type_traits>

class Creature;
class Corpse;
class Unit;
class GameObject;
class DynamicObject;
class WorldObject;
class Vehicle;
class Map;
class WorldRunnable;
class Transport;
class EventObject;

static uint32 const INCREMENT_COUNTER = 5000000;

template <class T>
class TC_GAME_API HashMapHolder
{
public:
    typedef std::unordered_map<ObjectGuid, T*> MapType;
    typedef std::unordered_map<std::string, T*> MapTypeStr;
    typedef std::vector<T*> MapTypeVector;

    // Players: i_lock (exclusive) is taken first and held while the slot and the maps change, so that a Visit never
    // sees an object that is being removed. Lock order: i_lock -> i_lockVector. Callers must not hold i_lock
    // (shared included: contention_free_shared_mutex forbids shared -> exclusive), e.g. never from inside Visit.
    static void Insert(T* o)
    {
        if (o->IsPlayer())
        {
            std::unique_lock<sf::contention_free_shared_mutex< >> lock(i_lock);
            SetSlot(o);
            _objectMap[o->GetGUID()] = o;
            _objectMapStr[LowerName(o)] = o;
            return;
        }

        SetSlot(o);
    }

    static void Remove(T* o)
    {
        if (o->IsPlayer())
        {
            std::unique_lock<sf::contention_free_shared_mutex< >> lock(i_lock);
            ClearSlot(o);

            // on a reconnect the new object may already be registered under the same guid and name
            auto itr = _objectMap.find(o->GetGUID());
            if (itr != _objectMap.end() && itr->second == o)
                _objectMap.erase(itr);

            auto itrStr = _objectMapStr.find(LowerName(o));
            if (itrStr != _objectMapStr.end() && itrStr->second == o)
                _objectMapStr.erase(itrStr);
            return;
        }

        ClearSlot(o);
    }

    // Players only (the guid map holds nothing else). fn(T*) -> bool runs under the shared i_lock: the object cannot
    // be removed, hence deleted, meanwhile. fn must stay short and never call Insert/Remove (login, logout, map removal)
    // nor take a lock that is held around a Visit (see ObjectAccessor lock order).
    template<class Fn>
    static bool Visit(ObjectGuid guid, Fn&& fn)
    {
        std::shared_lock<sf::contention_free_shared_mutex< >> lock(i_lock);
        auto itr = _objectMap.find(guid);
        if (itr == _objectMap.end() || !itr->second)
            return false;

        return fn(itr->second);
    }

    static T* Find(ObjectGuid guid)
    {
        T* object;
        {
            std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lockVector);
            uint64 guidlow = guid.GetGUIDLow();
            if (guidlow >= _size) // If guid buged don`t check it
                return nullptr;
            object = _objectVector[guidlow];
        }

        if (object && !IsSameKind(object, guid.GetHigh()))
            return nullptr;

        return object;
    }

    static T* FindLow(ObjectGuid::LowType guidLow)
    {
        std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lockVector);
        if (guidLow < _size)
            return _objectVector[guidLow];

        return nullptr;
    }

    static T* FindStr(std::string name)
    {
        std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lock);
        typename MapTypeStr::iterator itr = _objectMapStr.find(name);
        return (itr != _objectMapStr.end()) ? itr->second : nullptr;
    }

    static ObjectGuid FindGuidStr(std::string const& name)
    {
        std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lock);
        typename MapTypeStr::iterator itr = _objectMapStr.find(name);
        return (itr != _objectMapStr.end() && itr->second) ? itr->second->GetGUID() : ObjectGuid::Empty;
    }

    static void SetSize(uint64 size)
    {
        // called on every guid generation: the exclusive lock only for an actual resize
        {
            std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lockVector);
            if (_objectVector.size() >= (size + INCREMENT_COUNTER))
                return;
        }

        std::unique_lock<sf::contention_free_shared_mutex< >> guard(i_lockVector);
        if (_objectVector.size() < (size + INCREMENT_COUNTER))
        {
            _objectVector.resize(size + INCREMENT_COUNTER * 3);
            _size = _objectVector.size();
        }
    }

    static MapType& GetContainer() { return _objectMap; }

    static sf::contention_free_shared_mutex< >& GetLock();

    static uint32 _size;

private:

    //Non instanceable only static
    HashMapHolder() { _checkLock = false; _size = 0; }

    static std::string LowerName(T const* o)
    {
        std::string name = o->GetName();
        std::transform(name.begin(), name.end(), name.begin(), ::tolower);
        return name;
    }

    static void SetSlot(T* o)
    {
        // shared: slots are written in place, only SetSize reallocates the vector
        std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lockVector);
        uint64 guidlow = o->GetGUIDLow();
        if (guidlow < _size) // If guid buged don`t check it
            _objectVector[guidlow] = o;
    }

    static void ClearSlot(T* o)
    {
        std::shared_lock<sf::contention_free_shared_mutex< >> guard(i_lockVector);
        uint64 guidlow = o->GetGUIDLow();
        // transports and gameobjects have separate counters but share this table
        if (guidlow < _size && _objectVector[guidlow] == o)
            _objectVector[guidlow] = nullptr;
    }

    // several high types share one counter per table; anything else under another high type is a different object with the same low guid
    // (e.g. ship transports, numbered 1..n, against the first gameobject spawns)
    static bool IsSameKind(T const* object, HighGuid wanted)
    {
        HighGuid stored = object->GetGUID().GetHigh();
        if (stored == wanted)
            return true;

        if constexpr (std::is_same_v<T, Creature>)
            return (stored == HighGuid::Creature || stored == HighGuid::Vehicle) && (wanted == HighGuid::Creature || wanted == HighGuid::Vehicle);
        else if constexpr (std::is_same_v<T, GameObject>)
            return stored == HighGuid::Transport && wanted == HighGuid::GameObject && object->ToStaticTransport(); // elevators use gameobject spawn guids
        else
            return false;
    }

    static sf::contention_free_shared_mutex< > i_lock;
    static sf::contention_free_shared_mutex< > i_lockVector;
    static MapType _objectMap;
    static MapTypeStr _objectMapStr;
    static MapTypeVector _objectVector;
    static std::atomic<bool> _checkLock;
};

class TC_GAME_API ObjectAccessor
{
    ObjectAccessor();
    ~ObjectAccessor();
    ObjectAccessor(const ObjectAccessor&) = delete;
    ObjectAccessor& operator=(const ObjectAccessor&) = delete;

public:
    // TODO: override these template functions for each holder type and add assertions

    static ObjectAccessor* instance();

    template<class T> static T* GetObjectInOrOutOfWorld(ObjectGuid guid, T* /*typeSpecifier*/)
    {
        return HashMapHolder<T>::Find(guid);
    }

    static Unit* GetObjectInOrOutOfWorld(ObjectGuid guid, Unit* /*typeSpecifier*/)
    {
        if (guid.IsPlayer())
            return static_cast<Unit*>(GetObjectInOrOutOfWorld(guid, static_cast<Player*>(nullptr)));

        if (guid.IsPet())
            return static_cast<Unit*>(GetObjectInOrOutOfWorld(guid, static_cast<Pet*>(nullptr)));

        return static_cast<Unit*>(GetObjectInOrOutOfWorld(guid, static_cast<Creature*>(nullptr)));
    }

    // returns object if is in world
    template<class T> static T* GetObjectInWorld(ObjectGuid guid, T* /*typeSpecifier*/)
    {
        return HashMapHolder<T>::Find(guid);
    }

    // Player may be not in world while in ObjectAccessor. The test runs under the accessor lock, but the returned
    // pointer is only safe in the caller's own map thread (see PostToPlayer / WithPlayer)
    static Player* GetObjectInWorld(ObjectGuid guid, Player* /*typeSpecifier*/)
    {
        Player* found = nullptr;
        HashMapHolder<Player>::Visit(guid, [&found](Player* player)
        {
            if (player->IsInWorld() && !player->IsPreDelete())
                found = player;
            return true;
        });
        return found;
    }

    static Unit* GetObjectInWorld(ObjectGuid guid, Unit* /*typeSpecifier*/)
    {
        if (guid.IsPlayer())
            return static_cast<Unit*>(GetObjectInWorld(guid, static_cast<Player*>(nullptr)));

        if (guid.IsPet())
            return static_cast<Unit*>(GetObjectInWorld(guid, static_cast<Pet*>(nullptr)));

        return static_cast<Unit*>(GetObjectInWorld(guid, static_cast<Creature*>(nullptr)));
    }

    // the map is compared under the accessor lock: a player of another map may be deleted right after
    static Player* GetObjectInMap(ObjectGuid guid, Map* map, Player* /*typeSpecifier*/)
    {
        if (!map)
            return nullptr;

        Player* found = nullptr;
        HashMapHolder<Player>::Visit(guid, [&found, map](Player* player)
        {
            if (player->IsInWorld() && !player->IsPreDelete() && player->FindMap() == map)
                found = player;
            return true;
        });
        return found;
    }

    // returns object if is in map
    template<class T> static T* GetObjectInMap(ObjectGuid guid, Map* map, T* /*typeSpecifier*/)
    {
        // ASSERT(map);
        if (!map)
            return nullptr;

        if constexpr (std::is_base_of_v<T, Player>)
            if (guid.IsPlayer())
                return GetObjectInMap(guid, map, static_cast<Player*>(nullptr));

        if (T* obj = GetObjectInWorld(guid, static_cast<T*>(nullptr)))
            if (obj->GetMap() == map && !obj->IsPreDelete())
                return obj;

        return nullptr;
    }

    template<class T> static T* GetObjectInWorld(uint32 mapid, float x, float y, ObjectGuid guid, T* /*fake*/)
    {
        T* obj = HashMapHolder<T>::Find(guid);
        if (!obj || obj->GetMapId() != mapid || obj->IsPreDelete())
            return nullptr;

        CellCoord p = Trinity::ComputeCellCoord(x, y);
        if (!p.IsCoordValid())
        {
            TC_LOG_ERROR("misc", "ObjectAccessor::GetObjectInWorld: invalid coordinates supplied X:%f Y:%f grid cell [%u:%u]", x, y, p.x_coord, p.y_coord);
            return nullptr;
        }

        CellCoord q = Trinity::ComputeCellCoord(obj->GetPositionX(), obj->GetPositionY());
        if (!q.IsCoordValid())
        {
            TC_LOG_ERROR("misc", "ObjectAccessor::GetObjecInWorld: object (GUID: %u TypeId: %u) has invalid coordinates X:%f Y:%f grid cell [%u:%u]", obj->GetGUIDLow(), obj->GetTypeId(), obj->GetPositionX(), obj->GetPositionY(), q.x_coord, q.y_coord);
            return nullptr;
        }

        int32 dx = int32(p.x_coord) - int32(q.x_coord);
        int32 dy = int32(p.y_coord) - int32(q.y_coord);

        if (dx > -2 && dx < 2 && dy > -2 && dy < 2)
            return obj;
        return nullptr;
    }

    // these functions return objects only if in map of specified object
    static WorldObject* GetWorldObject(WorldObject const&, ObjectGuid);
    static Object* GetObjectByTypeMask(WorldObject const&, ObjectGuid, uint32 typemask);
    static Corpse* GetCorpse(WorldObject const& u, ObjectGuid guid);
    static GameObject* GetGameObject(WorldObject const& u, ObjectGuid guid);
    static DynamicObject* GetDynamicObject(WorldObject const& u, ObjectGuid guid);
    static AreaTrigger* GetAreaTrigger(WorldObject const& u, ObjectGuid guid);
    static Conversation* GetConversation(WorldObject const& u, ObjectGuid guid);
    static Unit* GetUnit(WorldObject const&, ObjectGuid guid);
    static Creature* GetCreature(WorldObject const& u, ObjectGuid guid);
    static Pet* GetPet(WorldObject const&, ObjectGuid guid);
    static Player* GetPlayer(WorldObject const&, ObjectGuid guid);
    static Player* FindPlayer(Map* map, ObjectGuid guid);
    static Creature* GetCreatureOrPetOrVehicle(WorldObject const&, ObjectGuid);
    static Transport* GetTransport(WorldObject const& u, ObjectGuid guid);
    static EventObject* GetEventObject(WorldObject const& u, ObjectGuid guid);
    static Object* GetObject(Map* map, ObjectGuid guid);

    // these functions return objects if found in whole world
    // ACCESS LIKE THAT IS NOT THREAD SAFE
    // A player found by guid lives in his own map thread and is deleted there right after leaving the accessor:
    // the pointer may only be used by code running in that player's map thread (his packet handlers included).
    // From any other thread use PostToPlayer, WithPlayer or SendToPlayer.
    static Pet* FindPet(ObjectGuid const& g);
    static Player* FindPlayer(ObjectGuid const& g, bool inWorld = true);
    static Unit* FindUnit(ObjectGuid const& g);
    static GameObject* FindGameObject(ObjectGuid const& guid);
    static Creature* FindCreature(ObjectGuid const& guid);

    static Player* FindPlayerByName(std::string name);
    // for another thread's player: then use WithPlayer / PostToPlayer with the guid
    static ObjectGuid FindPlayerGuidByName(std::string name);

    /* Cross-thread access to a player known by guid. The pointer never leaves the accessor lock.
     *
     * Lock order: domain locks (guild, group, LFG, LFG list, pet battle, battleground queue, auction...)
     *   -> HashMapHolder<Player> i_lock (shared) -> leaf locks only: FunctionProcessor queue, socket send queue,
     *   packet log, SocialMgr::m_social_lock, GuildMgr store lock, Guild::m_leafLock (nothing is taken under them).
     * Insert/Remove (login, map removal) take i_lock exclusively and call nothing out under it; they are never run
     * from inside a Visit (shared -> exclusive is forbidden by contention_free_shared_mutex). Code under i_lock must
     * not take a domain lock: a writer waiting for i_lock blocks new readers, so a reader waiting for a domain lock
     * whose holder wants i_lock would close a cycle.
     *
     * A posted action runs later in the player's own Update, only while he is in world, and is destroyed unrun if
     * he logs out first: post in-memory changes and packets only, never a database write that must happen. */
    enum class PlayerScope
    {
        InWorld,            // refused while the player is between maps (far teleport, loading)
        InOrOutOfWorld      // kept until he is back in a map
    };

    static bool PostToPlayer(ObjectGuid guid, std::function<void(Player*)>&& action, uint64 delay = 0, PlayerScope scope = PlayerScope::InOrOutOfWorld);

    // fn(Player*) runs now, in the caller's thread, under the accessor lock: short reads of fields that are stable or
    // atomic, and packet sends only. Never login/logout, map changes, or anything that may take a domain lock.
    template<class Fn>
    static bool WithPlayer(ObjectGuid guid, Fn&& fn, PlayerScope scope = PlayerScope::InWorld)
    {
        return HashMapHolder<Player>::Visit(guid, [&fn, scope](Player* player)
        {
            if (player->IsDelete() || player->IsPreDelete())
                return false;
            if (scope == PlayerScope::InWorld && !player->IsInWorld())
                return false;
            fn(player);
            return true;
        });
    }

    static bool SendToPlayer(ObjectGuid guid, WorldPacket const* packet);
    static bool IsPlayerOnline(ObjectGuid guid);

    // when using this, you must use the hashmapholder's lock
    static HashMapHolder<Player>::MapType const& GetPlayers()
    {
        return HashMapHolder<Player>::GetContainer();
    }

    template<class T> static void AddObject(T* object)
    {
        HashMapHolder<T>::Insert(object);
    }

    template<class T> static void RemoveObject(T* object)
    {
        HashMapHolder<T>::Remove(object);
    }

    // guids of the players online now: a snapshot, they may leave at any time
    static std::vector<ObjectGuid> GetOnlinePlayerGuids();
    // PostToPlayer for each of them, from any thread (see PostToPlayer for what an action may do);
    // returns the players it was actually posted to
    static std::vector<ObjectGuid> PostToAllPlayers(std::function<void(Player*)> const& action, uint64 delay = 0, PlayerScope scope = PlayerScope::InOrOutOfWorld);

    static void SaveAllPlayers();
    static void SetGuidSize(HighGuid type, uint64 size);

    //Thread safe
    Corpse* GetCorpseForPlayerGUID(ObjectGuid guid);
    void RemoveCorpse(Corpse* corpse);
    void AddCorpse(Corpse* corpse);
    void AddCorpsesToGrid(GridCoord const& gridpair, Grid& grid, Map* map);
    Corpse* ConvertCorpseForPlayer(ObjectGuid player_guid, bool insignia = false);

    //Thread unsafe
    void Update(uint32 diff);
    void RemoveOldCorpses();
    void UnloadAll();

private:
    typedef std::unordered_map<ObjectGuid, Corpse*> Player2CorpsesMapType;

    Player2CorpsesMapType i_player2corpse;
    std::recursive_mutex i_corpseLock;
};

#define sObjectAccessor ObjectAccessor::instance()

#endif
