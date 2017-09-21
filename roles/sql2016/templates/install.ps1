# create_mssql_db.ps1 -instanceName YourInstanceName -dbName YOURDB
Enable-WSManCredSSP –Role Client –DelegateComputer wintest1 -Force
# Load command line parameters
$p = Start-Process {{ disk_image_out.mount_path }}setup.exe -ArgumentList '/Q /ACTION=Install /IACCEPTSQLSERVERLICENSETERMS /ENU /UPDATEENABLED=false /FEATURES=SQLENGINE /INSTANCENAME=MSSQLSERVER /SECURITYMODE=SQL /SAPWD=Password1! /AGTSVCSTARTUPTYPE=automatic /BROWSERSVCSTARTUPTYPE=automatic /SQLSYSADMINACCOUNTS=sqladmin /SQLBACKUPDIR=C:\Backup /SQLUSERDBDIR=C:\Databases /SQLUSERDBLOGDIR=C:\UserDatabases' -wait -NoNewWindow -PassThru

# Ensure SQL Power Shell Modules are in the path
$p.HasExited
# Import SQL Server Module called SQLPS
$p.ExitCode

