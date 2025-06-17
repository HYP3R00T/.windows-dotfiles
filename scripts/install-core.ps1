function Install-Package {
    param (
        [string]$Id,
        [string]$ExtraArgs = ""
    )

    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Error "winget not found. Please install 'App Installer' from Microsoft Store manually."
        exit 1
    }

    $installed = winget list --id $Id --exact | Select-String "^$Id\s"

    if (-not $installed) {
        Write-Host "Installing $Id..."
        winget install --id $Id -e --silent --accept-package-agreements --accept-source-agreements $ExtraArgs
    } else {
        $updatable = winget upgrade --id $Id --exact | Select-String "^$Id\s"
        if ($updatable) {
            Write-Host "Updating $Id..."
            winget upgrade --id $Id -e --silent --accept-package-agreements --accept-source-agreements $ExtraArgs
        } else {
            Write-Host "$Id is already up to date."
        }
    }
}


function Install-CoreTools {
    # Core Dev Tools
    Install-Package Brave.Brave
    Install-Package Microsoft.PowerShell
    Install-Package Microsoft.WindowsTerminal
    Install-Package wez.wezterm
    Install-Package Starship.Starship
    Install-Package Microsoft.VisualStudioCode '--override "/verysilent /suppressmsgboxes /mergetasks=\'!runcode, addcontextmenufiles, addcontextmenufolders, associatewithfiles, addtopath\'"'
    Install-Package Git.Git
    Install-Package GitHub.GitHubDesktop
    Install-Package astral-sh.uv
    Install-Package pnpm.pnpm
    Install-Package ajeetdsouza.zoxide
    Install-Package Hashicorp.Terraform
    Install-Package Docker.DockerDesktop
    Install-Package Kubernetes.kubectl
    Install-Package Derailed.k9s

    # System Utilities
    Install-Package Microsoft.PowerToys
    Install-Package WinDirStat.WinDirStat
    Install-Package Fastfetch-cli.Fastfetch

    # Security & VPN
    Install-Package Proton.ProtonVPN
    Install-Package OpenWhisperSystems.Signal

    # Media & Productivity
    Install-Package Obsidian.Obsidian
    Install-Package ShareX.ShareX
    Install-Package VLC.VideoLAN
    Install-Package yt-dlp.yt-dlp

    # Browsers
    Install-Package Google.Chrome
    Install-Package Mozilla.Firefox

    # Gaming
    Install-Package EpicGames.EpicGamesLauncher
    Install-Package Ubisoft.Connect
    Install-Package Valve.Steam

    # Creative / Dev
    Install-Package BlenderFoundation.Blender
    Install-Package OBSProject.OBSStudio
    Install-Package dev47apps.DroidCam
}
