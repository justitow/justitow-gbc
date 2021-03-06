@echo off
REM SIMPLE COMMAND.COM SCRIPT TO ASSEMBLE GAMEBOY FILES
REM REQUIRES MAKELNK.BAT
REM JOHN HARRISON
REM UPDATED 2008-01-28

if exist %1.gb del %1.gb
REM IF THERE ARE SETTINGS WHICH NEED TO BE DONE ONLY ONCE, PUT THEM BELOW
rem if not %ASSEMBLE%1 == 1 goto begin
rem path=%path%;c:\gameboy\assembler\
rem doskey UNNECESSARY ON DESKTOP --- DOSKEY ALREADY INSTALLED
rem set dir=c:\gameboy\curren~1\
cmd /c makelnk %1 > %1.lnk

:begin
set assemble=1
echo assembling...
rgbasm95 -o%1.obj %1.asm
if errorlevel 1 goto end
echo linking...
xlink95 -mmap %1.lnk
if errorlevel 1 goto end
echo fixing...
rgbfix95 -v %1

:end
rem del *.obj