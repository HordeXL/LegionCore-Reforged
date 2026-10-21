////////////////////////////////////////////
///                                      ///
///         LEGIONCORE REFORGED          ///
///    Copyright 2026 Titans-Project     ///
///         All Rights Reserved.         ///
///                                      ///
///      Based on TrinityCore code       ///
///   Copyright 2008-2012 TrinityCore    ///
///   <http://www.trinitycore.org/>      ///
///                                      ///
////////////////////////////////////////////

#include "RandomMovementGenerator.h"
#include "Creature.h"
#include "CreatureGroups.h"
#include "MapManager.h"
#include "MoveSpline.h"
#include "MoveSplineInit.h"
#include "ObjectAccessor.h"
#include "PathGenerator.h"
#include "Util.h"

template<class T>
void RandomMovementGenerator<T>::Pause(uint32) { }

template<>
void RandomMovementGenerator<Creature>::Pause(uint32 timer /* = 0*/)
{
    _stalled = timer ? false : true;
    _timer.Reset(timer ? timer : 1);
}

template<class T>
void RandomMovementGenerator<T>::Resume(uint32) { }

template<>
void RandomMovementGenerator<Creature>::Resume(uint32 overrideTimer /* = 0*/)
{
    _stalled = false;
    if (overrideTimer)
        _timer.Reset(overrideTimer);
}

template<class T>
void RandomMovementGenerator<T>::DoInitialize(T&) { }

template<>
void RandomMovementGenerator<Creature>::DoInitialize(Creature& owner)
{
    // Set before the early return: a unit freed later would otherwise wander towards the map origin
    _reference = owner.GetPosition();
    _wanderDistance = _requestedDistance > 0.0f ? _requestedDistance : std::max<float>(owner.GetRespawnRadius(), 0.1f);

    // Retail seems to let a creature walk 2 up to 10 splines before triggering a pause
    _wanderSteps = urand(2, 10);

    _timer.Reset(0);
    _path = nullptr;

    if (!owner.IsAlive() || owner.isDead(true) || !owner.CanFreeMove())
        return;

    owner.AddUnitState(UNIT_STATE_ROAMING);
    owner.StopMoving();
}

template<class T>
void RandomMovementGenerator<T>::DoFinalize(T&) { }

template<>
void RandomMovementGenerator<Creature>::DoFinalize(Creature& owner)
{
    owner.ClearUnitState(UNIT_STATE_ROAMING);
    owner.StopMoving();
    owner.SetWalk(false);
}

template<class T>
void RandomMovementGenerator<T>::DoReset(T&) { }

template<>
void RandomMovementGenerator<Creature>::DoReset(Creature& owner)
{
    DoInitialize(owner);
}

template<class T>
void RandomMovementGenerator<T>::SetRandomLocation(T &) { }

template<>
void RandomMovementGenerator<Creature>::SetRandomLocation(Creature& owner)
{
    if (owner.HasUnitState(UNIT_STATE_NOT_MOVE) || owner.IsMovementPreventedByCasting())
    {
        owner.StopMoving();
        _path = nullptr;
        return;
    }

    owner.AddUnitState(UNIT_STATE_ROAMING_MOVE);

    Position position(_reference);
    float distance = _wanderDistance > 0.1f ? frand(0.1f, _wanderDistance) : _wanderDistance;
    float angle = frand(0.f, static_cast<float>(M_PI * 2));
    owner.MovePositionToFirstCollision(position, distance, angle);
    if (owner.GetPosition().GetExactDist(&position) < 0.1f)
    {
        // the path is too short for the spline system to be accepted. Let's try again soon.
        _timer.Reset(500);
        return;
    }

    if (!_path)
    {
        _path = std::make_unique<PathGenerator>(&owner);
        _path->SetPathLengthLimit(30.0f);
    }

    bool result = _path->CalculatePath(position.GetPositionX(), position.GetPositionY(), position.GetPositionZ());
    if (!result || (_path->GetPathType() & PATHFIND_NOPATH)
        || (_path->GetPathType() & PATHFIND_SHORTCUT))
    {
        _timer.Reset(500);
        return;
    }

    bool walk = true;
    switch (owner.GetMovementTemplate().GetRandom())
    {
        case CreatureRandomMovementType::CanRun:
            walk = owner.IsWalking();
            break;
        case CreatureRandomMovementType::AlwaysRun:
            walk = false;
            break;
        default:
            break;
    }

    Movement::MoveSplineInit init(owner);
    init.MovebyPath(_path->GetPath());
    init.SetWalk(walk);
    int32 splineDuration = init.Launch();

    --_wanderSteps;
    if (_wanderSteps) // Creature has yet to do steps before pausing
        _timer.Reset(splineDuration);
    else
    {
        // Creature has made all its steps, time for a little break
        _timer.Reset(splineDuration + urand(4, 10) * IN_MILLISECONDS); // Retail seems to use rounded numbers so we do as well
        _wanderSteps = urand(2, 10);
    }

    // Call for creature group update
    if (owner.GetFormation() && owner.GetFormation()->getLeader() == &owner)
        owner.GetFormation()->LeaderMoveTo(position.m_positionX, position.m_positionY, position.m_positionZ);
}

template<class T>
bool RandomMovementGenerator<T>::DoUpdate(T&, const uint32)
{
    return false;
}

template<>
bool RandomMovementGenerator<Creature>::DoUpdate(Creature& owner, const uint32 diff)
{
    if (!owner.IsAlive())
        return false;

    if (owner.HasUnitState(UNIT_STATE_NOT_MOVE) || owner.IsMovementPreventedByCasting() || _stalled)
    {
        owner.StopMoving();
        _path = nullptr;
        return true;
    }

    _timer.Update(diff);
    if (_timer.Passed() && owner.movespline->Finalized())
        SetRandomLocation(owner);

    return true;
}
