# Run this as Administrator
$RegistryPaths = @(
    "Registry::HKEY_CLASSES_ROOT\Directory\shell\OpenPowerShellHere",
    "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\OpenPowerShellHere",
    "Registry::HKEY_CLASSES_ROOT\Drive\shell\OpenPowerShellHere"
)

foreach ($path in $RegistryPaths) {
    # Create the key and set the Menu Name
    New-Item -Path $path -Force | Out-Null
    Set-ItemProperty -Path $path -Name "(Default)" -Value "Open in PowerShell"
    Set-ItemProperty -Path $path -Name "Icon" -Value "powershell.exe"
    
    # Create the command key to actually launch PowerShell
    $commandPath = "$path\command"
    New-Item -Path $commandPath -Force | Out-Null
    Set-ItemProperty -Path $commandPath -Name "(Default)" -Value "powershell.exe -NoExit -Command Set-Location -LiteralPath '%V'"
}

Write-Host "Success! 'Open in PowerShell' added to right-click menu." -ForegroundColor Green
