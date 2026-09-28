/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
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

#ifndef _MMAP_MANAGER_H
#define _MMAP_MANAGER_H

#include "Define.h"
#include "DetourNavMesh.h"
#include "DetourNavMeshQuery.h"
#include <shared_mutex>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>

//  move map related classes
namespace MMAP
{
    typedef std::unordered_map<uint32, dtTileRef> MMapTileSet;
    typedef std::unordered_map<uint64, dtNavMeshQuery*> NavMeshQuerySet;

    // dummy struct to hold map's mmap data
    struct TC_COMMON_API MMapData
    {
        MMapData(dtNavMesh* mesh) : navMesh(mesh) { }
        ~MMapData()
        {
            for (NavMeshQuerySet::iterator i = navMeshQueries.begin(); i != navMeshQueries.end(); ++i)
                dtFreeNavMeshQuery(i->second);

            if (navMesh)
                dtFreeNavMesh(navMesh);
        }

        // A dtNavMeshQuery keeps its search state in itself, and the objects of one map are updated
        // by several workers: one query per instance and per thread, made on first use.
        NavMeshQuerySet navMeshQueries;     // (instanceId << 32 | thread slot) to query
        std::unordered_set<uint32> instances;

        dtNavMesh* navMesh;
        MMapTileSet loadedTileRefs;        // maps [map grid coords] to [dtTile]
    };


    typedef std::unordered_map<uint32, MMapData*> MMapDataSet;

    // singleton class
    // holds all all access to mmap loading unloading and meshes
    class TC_COMMON_API MMapManager
    {
        public:
            MMapManager() : loadedTiles(0), thread_safe_environment(true) {}
            ~MMapManager();

            void InitializeThreadUnsafe(std::unordered_map<uint32, std::vector<uint32>> const& mapData);
            bool loadMap(std::string const& basePath, uint32 mapId, int32 x, int32 y);
            bool loadMapInstance(std::string const& basePath, uint32 mapId, uint32 instanceId);
            bool unloadMap(uint32 mapId, int32 x, int32 y);
            bool unloadMap(uint32 mapId);
            bool unloadMapInstance(uint32 mapId, uint32 instanceId);
            bool loadGameObject(uint32 displayId, std::string patch);

            // the returned query belongs to the calling thread
            dtNavMeshQuery const* GetNavMeshQuery(uint32 mapId, uint32 instanceId);
            dtNavMesh const* GetNavMesh(uint32 mapId);

            uint32 getLoadedTilesCount() const { return loadedTiles; }
            uint32 getLoadedMapsCount() const { return uint32(loadedMMaps.size()); }
        private:
            bool loadMapData(std::string const& basePath, uint32 mapId);
            bool loadMapImpl(std::string const& basePath, uint32 mapId, int32 x, int32 y);
            bool loadMapInstanceImpl(std::string const& basePath, uint32 mapId, uint32 instanceId);
            bool unloadMapImpl(uint32 mapId, int32 x, int32 y);
            bool unloadMapImpl(uint32 mapId);
            uint32 packTileID(int32 x, int32 y);

            MMapDataSet::const_iterator GetMMapData(uint32 mapId) const;
            MMapDataSet loadedMMaps;
            uint32 loadedTiles;
            bool thread_safe_environment;
            MMapDataSet loadedModels;

            std::unordered_map<uint32, std::vector<uint32>> childMapData;
            std::unordered_map<uint32, uint32> parentMapData;
            std::shared_mutex _queryLock;       // navMeshQueries and instances of every MMapData
    };
}

#endif