/*
 * This file is part of the LegionCore-Reforged tools.
 *
 * Dumps a raw DB2 file from the client CASC storage so the server's
 * ClientData/dbc/<locale> overlays can be refreshed with complete data.
 *
 * Usage: db2dump <client data dir> <locale (enUS/zhCN/...)> <DB2 name> <output file>
 * Example: db2dump "E:\Program Files\WoW 7.35\Data" zhCN BroadcastText.db2 BroadcastText.db2
 */

#include "DB2CascFileSource.h"
#include "CascHandles.h"
#include <boost/filesystem.hpp>
#include <cstdio>
#include <string>

int main(int argc, char* argv[])
{
    if (argc < 5)
    {
        printf("Usage: %s <client data dir> <locale> <db2 name> <output file>\n", argv[0]);
        return 1;
    }

    char const* dataDir = argv[1];
    char const* locale = argv[2];
    std::string db2Name = "DBFilesClient\\" + std::string(argv[3]);
    char const* outFile = argv[4];

    DWORD localeFlags = 0;
    if (_stricmp(locale, "enUS") == 0) localeFlags = 0x002;
    else if (_stricmp(locale, "koKR") == 0) localeFlags = 0x004;
    else if (_stricmp(locale, "frFR") == 0) localeFlags = 0x010;
    else if (_stricmp(locale, "deDE") == 0) localeFlags = 0x020;
    else if (_stricmp(locale, "zhCN") == 0) localeFlags = 0x040;
    else if (_stricmp(locale, "zhTW") == 0) localeFlags = 0x100;
    else if (_stricmp(locale, "esMX") == 0) localeFlags = 0x800;
    else if (_stricmp(locale, "ruRU") == 0) localeFlags = 0x2000;
    else { printf("Unknown locale %s\n", locale); return 1; }

    CASC::StorageHandle storage = CASC::OpenStorage(boost::filesystem::path(dataDir), localeFlags);
    if (!storage)
    {
        printf("Failed to open CASC storage at %s\n", dataDir);
        return 1;
    }

    DB2CascFileSource source(storage, db2Name);
    if (!source.IsOpen())
    {
        printf("Failed to open %s from the storage\n", db2Name.c_str());
        return 1;
    }

    std::size_t size = source.GetFileSize();
    char* buffer = new char[size];
    if (!source.Read(buffer, size))
    {
        printf("Failed to read %s (%zu bytes)\n", db2Name.c_str(), size);
        delete[] buffer;
        return 1;
    }

    FILE* out = fopen(outFile, "wb");
    if (!out)
    {
        printf("Failed to open %s for writing\n", outFile);
        delete[] buffer;
        return 1;
    }

    fwrite(buffer, 1, size, out);
    fclose(out);
    delete[] buffer;

    printf("Dumped %s (%zu bytes, locale %s) to %s\n", db2Name.c_str(), size, locale, outFile);
    return 0;
}
