# Usage: 
# execute_sql_on_db.ps1 -instanceName YourInstanceName -dbName YOURDB -sqlQuery "CREATE TABLE test (ID int PRIMARY KEY NOT NULL, Name varchar(25) NOT NULL;"
# execute_sql_on_db.ps1 -instanceName YourInstanceName -dbName YOURDB -sqlQuery "SELECT * FROM information_schema.tables WHERE TABLE_TYPE='BASE_TABLE';"
# execute_sql_on_db.ps1 -instanceName YourInstanceName -sqlQuery "SELECT name FROM sys.databases;"


# Load command line parameters
Param(
  [Parameter(Mandatory=$True)]
  [string]$instanceName,

  [Parameter(Mandatory=$False)]
  [string]$dbName,

  [Parameter(Mandatory=$True)]
  [string]$sqlQuery,

  [Parameter(Mandatory=$False)]
  [string]$userName,

  [Parameter(Mandatory=$False)]
  [string]$password

)

# Ensure SQL Power Shell Modules are in the path
$env:PSModulePath = $env:PSModulePath + ";C:\Program Files (x86)\Microsoft SQL Server\130\Tools\PowerShell\Modules"

# Import SQL Server Module called SQLPS
Import-Module SQLPS -DisableNameChecking
 
if ($dbName)  {

  # Your SQL Server Instance Name (Server)
  $mySrvConn = new-object Microsoft.SqlServer.Management.Common.ServerConnection
  $mySrvConn.ServerInstance = $instanceName
  $mySrvConn.LoginSecure = $false
  $mySrvConn.Login = $userName
  $mySrvConn.Password = $password

  $Srvr = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server($mySrvConn)

  # Check if the Database Exists
  $dbExists = $FALSE
  foreach ($db in $Srvr.databases) {
    if ($db.name -eq $dbName) {
      $dbExists = $TRUE
    }
  }

  # Execute query if the database exists
  if ($dbExists -eq $True) {
    Write-Host "Executing query against database $dbName"
    Invoke-Sqlcmd -Username $userName -Password $password -Query "$sqlQuery" -ServerInstance $instanceName -Database $dbName
  }
} else {
  Write-Host "Executing query against instance $instanceName"
  Invoke-Sqlcmd -Username $userName -Password $password -Query "$sqlQuery" -ServerInstance $instanceName
}

