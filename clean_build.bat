@echo off
REM Remove build directory if it exists
if exist build (
    echo Deleting build directory...
    rmdir /s /q build
)

REM Remove dist directory if it exists
if exist dist (
    echo Deleting dist directory...
    rmdir /s /q dist
)

REM Remove all .egg-info directories in the current folder
for /d %%i in (*.egg-info) do (
    echo Deleting %%i ...
    rmdir /s /q "%%i"
)

echo.
echo Building source distribution and wheel...
python -m build --sdist
python -m build --wheel

pause