#!/snap/bin/powershell -Command
# Ansible managed
param(
    [parameter(Mandatory=$false)][string]$source = "/mnt/temp/superset/project",
    [parameter(Mandatory=$false)][string]$assigneduser = "admin",
    [parameter(Mandatory=$false)][string]$SUPERSET_HOME = "/opt/superset",
    [parameter(Mandatory=$false)][string]$SUPERSET_CONFIG_PATH = "/etc/superset/superset_config.py",
    [parameter(Mandatory=$false)][string]$FLASK_APP = "superset"
)

$ErrorActionPreference = "Stop"
$start = Get-Date

try {
    $env:SUPERSET_HOME = $SUPERSET_HOME
    $env:SUPERSET_CONFIG_PATH = $SUPERSET_CONFIG_PATH
    $env:FLASK_APP = $FLASK_APP

    Set-Location $SUPERSET_HOME/bin;

    ./superset fab import-roles --path=$source/roles.json
    if ($LASTEXITCODE -ne 0) { throw "fab import-roles exited with code $LASTEXITCODE." }
    Write-Host -ForegroundColor Green "Roles imported successfully"

    ./superset import-datasources --path=$source/datasources.zip --username=$assigneduser
    if ($LASTEXITCODE -ne 0) { throw "import-datasources exited with code $LASTEXITCODE." }
    Write-Host -ForegroundColor Green "Datasources imported successfully"

    ./superset import-dashboards --path=$source/dashboards.zip --username=$assigneduser
    if ($LASTEXITCODE -ne 0) { throw "import-dashboards exited with code $LASTEXITCODE." }
    Write-Host -ForegroundColor Green "Dashboards imported successfully"
}
finally {
	Write-Host "Took: " ((Get-Date) - $start)
}
