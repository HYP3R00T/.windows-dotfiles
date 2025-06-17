function Fix-OneDriveRedirects {
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
    $props = Get-ItemProperty -Path $regPath

    foreach ($name in $props.PSObject.Properties.Name) {
        $val = $props.$name
        if ($val -like "*OneDrive*") {
            $folder = Split-Path $val -Leaf
            $newVal = "%USERPROFILE%\$folder"
            $src = [Environment]::ExpandEnvironmentVariables($val)
            $dest = [Environment]::ExpandEnvironmentVariables($newVal)

            Write-Host "`nUpdating: $name"
            Write-Host " - From: $src"
            Write-Host " - To:   $dest"

            if (!(Test-Path $dest)) {
                New-Item -ItemType Directory -Path $dest | Out-Null
            }

            try {
                # Recursively move entire directory contents while preserving structure
                Move-Item -Path (Join-Path $src '*') -Destination $dest -Force -ErrorAction Stop
            } catch {
                Write-Warning " - Could not move some items: $_"
            }

            Set-ItemProperty -Path $regPath -Name $name -Value $newVal
        }
    }

    # Restart Explorer to apply changes
    Stop-Process -Name explorer -Force
    Start-Process explorer
}
