# Usage: 
# create_mssql_db.ps1 -instanceName YourInstanceName -dbName YOURDB

# Load command line parameters
Param(
  [Parameter(Mandatory=$True)]
    [string]$instanceName,

  [Parameter(Mandatory=$True)]
  [string]$dbName
)

# Ensure SQL Power Shell Modules are in the path
$env:PSModulePath = $env:PSModulePath + ";C:\Program Files (x86)\Microsoft SQL Server\110\Tools\PowerShell\Modules"

# Import SQL Server Module called SQLPS
Import-Module SQLPS -DisableNameChecking
 
# Your SQL Server Instance Name (Server)
$Srvr = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList $instanceName
 
# Check if the Database Already Exists
$dbExists = $FALSE
foreach ($db in $Srvr.databases) {
  if ($db.name -eq $dbName) {
    Write-Host "DB already exists."
    $dbExists = $TRUE
  }
}


# Create database with default settings
if ($dbExists -eq $FALSE) {
  $db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database($Srvr, $dbName)
  $db.Create()
 
  #Confirm, list databases in your current instance
  $Srvr.Databases |
  Select Name, Status, Owner, CreateDate
}
