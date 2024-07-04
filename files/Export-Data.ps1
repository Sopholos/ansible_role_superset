#!/snap/bin/powershell -Command
# Ansible managed
param(
    [parameter(Mandatory=$false)][string]$destination = "/mnt/temp/superset/project",
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

    New-item -ItemType Directory -Force -Path $destination
    ./superset export-datasources --datasource-file=$destination/datasources.zip
    if ($LASTEXITCODE -ne 0) { throw "export-datasources exited with code $LASTEXITCODE." }
    Write-Host -ForegroundColor Green "Datasources exported successfully"

    ./superset export-dashboards --dashboard-file=$destination/dashboards.zip
    if ($LASTEXITCODE -ne 0) { throw "export-dashboards exited with code $LASTEXITCODE." }
    Write-Host -ForegroundColor Green "Dashboards exported successfully"
}
finally {
	Write-Host "Took: " ((Get-Date) - $start)
}
