Import-Module (Join-Path $PSScriptRoot ..\PoshBox.psm1) -Force
& (Join-Path $PSScriptRoot ..\20_QMDevOpsBox\20_ReadMe.ps1)

& (Join-Path $PSScriptRoot 91_Fonts.ps1)
& (Join-Path $PSScriptRoot 92_Apps.ps1)
& (Join-Path $PSScriptRoot 93_KeePass.ps1)

mkdir ~\Projects -Force
mkdir ~\Projects\Platform -Force
mkdir ~\Projects\Modules -Force
mkdir ~\Projects\Provisioning -Force

git config --global user.email "Jaykul@HuddledMasses.org"
git config --global user.name  "Joel Bennett"
git config --global core.autocrlf "input"

if (Get-Command code -ErrorAction Ignore) {
    git config --global core.editor = code --wait
}
if (Get-Command code-insiders -ErrorAction Ignore) {
    git config --global core.editor = code-insiders --wait
}

# Configure git to use plink so that keys from KeeAgent work
# Some day soon, I should try switching this to the Windows OpenSSH
$plink = Get-Command plink | convert-path
[System.Environment]::SetEnvironmentVariable("GIT_SSH", $plink, "User")


& (Join-Path $PSScriptRoot 94_PowerShell.ps1)


<##### TODO: copy down my profile and projects from azure
Set-BingWallpaper
#>

Finalize