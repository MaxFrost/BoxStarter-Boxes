# choco upgrade -y vscode
choco upgrade -y vscode-insiders
choco upgrade -y microsoft-windows-terminal
choco upgrade -y git.install --package-parameters="'/GitOnlyOnPath /WindowsTerminal /NoShellIntegration /SChannel'"
choco install -y pwsh
refreshenv
pwsh (Join-Path $PSScriptRoot ..\PoshBox\PowerShellSettings.ps1)

@(
    "ms-vscode.PowerShell"
) | InstallCodeExtension