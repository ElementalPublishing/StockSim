@echo off
rmdir /s /q build
rmdir /s /q dist
for /d %%i in (*.egg-info) do rmdir /s /q "%%i"
python -m build --sdist
python -m build --wheel