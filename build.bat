@echo off
setlocal enabledelayedexpansion
REM Compiles the .asm files into .gb files using RGBDS tools.
REM RGBDS available at https://github.com/gbdev/rgbds
set "files=add_demo"
set "files=%files% sub_demo"

REM Clean up build files
echo Cleaning up build files.
for %%F in (%files%) do (
    if exist "%%~F.o" del "%%~F.o"
    if exist "%%~F.gb" del "%%~F.gb"
)
REM Compile and link the asm files
for %%F in (%files%) do (
    echo Compiling and linking: %%~F.asm
    rgbasm.exe -o %%~F.o %%~F.asm
    rgblink -o %%~F.gb %%~F.o
)

endlocal