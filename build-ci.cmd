@echo off
setlocal EnableExtensions
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
if errorlevel 1 ( echo [FATAL] vcvars64 failed & exit /b 10 )

set "NINJA=C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja\ninja.exe"

cd /d F:\Github\LegionCore-Reforged

echo [STEP 1] CMake reconfigure with ELUNA
cmake -S . -B build -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_C_COMPILER=cl ^
  -DCMAKE_CXX_COMPILER=cl ^
  -DCMAKE_MAKE_PROGRAM="%NINJA%" ^
  -DBOOST_ROOT=C:\local\boost_1_78_0 ^
  -DMYSQL_INCLUDE_DIR="C:\Program Files\MySQL\MySQL Server 5.7\include" ^
  -DMYSQL_LIBRARY="C:\Program Files\MySQL\MySQL Server 5.7\lib\libmysql.lib" ^
  -DLUA_VERSION=5.2
if errorlevel 1 ( echo [FATAL] CMake configure failed & exit /b 11 )

echo [STEP 2] Build (ninja -j6)
"%NINJA%" -C build -j 6
if errorlevel 1 ( echo [FATAL] Build failed & exit /b 12 )

echo BUILD_OK
exit /b 0
