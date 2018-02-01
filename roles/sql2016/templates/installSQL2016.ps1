$p = Start-Process {{ disk_image_out.mount_path }}setup.exe -ArgumentList '/Q /ACTION=Install /IACCEPTSQLSERVERLICENSETERMS /ENU /UPDATEENABLED=false /FEATURES=SQLENGINE,Conn /INSTANCENAME=MSSQLSERVER /SECURITYMODE=SQL /SAPWD={{ mssql_password }} /AGTSVCSTARTUPTYPE=automatic /BROWSERSVCSTARTUPTYPE=automatic /SQLSYSADMINACCOUNTS={{ mssql_username }} /SQLBACKUPDIR=C:\Backup /SQLUSERDBDIR=C:\Databases /SQLUSERDBLOGDIR=C:\UserDatabases' -wait -NoNewWindow -PassThru

$p.HasExited

$p.ExitCode