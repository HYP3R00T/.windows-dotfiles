function Load-RemoteScript {
    param([string]$url)
    Write-Host "Loading $url..."
    Invoke-RestMethod -Uri $url
}

$base = "https://raw.githubusercontent.com/HYP3R00T/.windows-dotfiles/main/scripts"

# Dot-source remote scripts
. ([ScriptBlock]::Create((Load-RemoteScript "$base/install-core.ps1")))
. ([ScriptBlock]::Create((Load-RemoteScript "$base/fix-onedrive.ps1")))
. ([ScriptBlock]::Create((Load-RemoteScript "$base/setup-dotfiles.ps1")))

# Now call functions from the sourced scripts
Install-CoreTools
Fix-OneDriveRedirects
Setup-Dotfiles
