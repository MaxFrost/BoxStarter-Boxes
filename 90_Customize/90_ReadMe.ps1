Import-Module (Join-Path $PSScriptRoot ..\PoshBox.psm1) -Force
& (Join-Path $PSScriptRoot ..\20_QMDevOpsBox\20_ReadMe.ps1)

& (Join-Path $PSScriptRoot 91_Fonts.ps1)
& (Join-Path $PSScriptRoot 92_Apps.ps1)

mkdir ~\Documents\Work -Force
mkdir ~\Documents\Work\Platform -Force
mkdir ~\Documents\Work\Modules -Force
mkdir ~\Documents\Work\Provisioning -Force

git config --global user.email "James.Maxson@Questionmark.com"
git config --global user.name  "James Maxson"
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


<##### TODO: git clone the core work projects ...
cd ~\Projects\Modules
git clone
cd ~\Projects\Platform
#>


<##### TODO: copy down my profile and projects from azure
Set-BingWallpaper
#>

Finalize