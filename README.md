Find product id in registry:

Computer\HKEY_CLASSES_ROOT\Installer\Dependencies

Select name then Default key

or

get product id first from

Computer\HKEY_CLASSES_ROOT\Installer\Products

for example: SQL 2016

CB138EA08A2F2ED4F8FB862B0216A1F7

Microsoft SQL Server 2016 Setup (English)

Then find Uninstallstring

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\<product code>\InstallProperties\UninstallString

MsiExec.exe /X{0AE831BC-F2A8-4DE2-8FBF-68B220611A7F}    -<< product code

product code: {0AE831BC-F2A8-4DE2-8FBF-68B220611A7F}