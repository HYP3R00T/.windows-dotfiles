# install.ps1
# Usage (run in a fresh terminal):
# curl -sSL https://raw.githubusercontent.com/<your-username>/<repo-name>/main/install.ps1 | powershell -NoProfile -

Write-Host "🔧 Starting Windows setup..." -ForegroundColor Cyan

# Ensure winget is available
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "❌ winget not found. Please install 'App Installer' from Microsoft Store manually."
    exit 1
}

# Helper to install package
function Install-Package {
    param (
        [string]$Id,
        [string]$ExtraArgs = ""
    )
    Write-Host "📦 Installing $Id..." -ForegroundColor Yellow
    winget install --id $Id -e --silent --accept-package-agreements --accept-source-agreements $ExtraArgs
}

# Core Dev Tools
Install-Package Brave.Brave
Install-Package Microsoft.PowerShell
Install-Package Microsoft.WindowsTerminal
# Install-Package Microsoft.WindowsTerminal.Preview
Install-Package wez.wezterm
Install-Package Starship.Starship
Install-Package Microsoft.VisualStudioCode '--override "/verysilent /suppressmsgboxes /mergetasks=\'!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath\'"'
# Install-Package Microsoft.VisualStudioCode.Insiders
Install-Package Git.Git
Install-Package GitHub.GitHubDesktop
# Install-Package Python.Python.3.13
Install-Package astral-sh.uv
Install-Package pnpm.pnpm
Install-Package ajeetdsouza.zoxide
Install-Package Hashicorp.Terraform
Install-Package Docker.DockerDesktop
Install-Package Kubernetes.kubectl
Install-Package Derailed.k9s
# Install-Package SUSE.RancherDesktop
# Install-Package LoftLabs.DevPod
# Install-Package Oracle.VirtualBox

# System Utilities
Install-Package Microsoft.PowerToys
Install-Package WinDirStat.WinDirStat
# Install-Package Microsoft.Sysinternals.Handle
# Install-Package Rufus.Rufus
# Install-Package Ventoy.Ventoy
# Install-Package Espanso.Espanso
Install-Package Fastfetch-cli.Fastfetch
# Install-Package Starpine.Screenbox

# Security & VPN
Install-Package Proton.ProtonVPN
Install-Package OpenWhisperSystems.Signal

# Media & Productivity
Install-Package Obsidian.Obsidian
Install-Package ShareX.ShareX
# Install-Package Spotify.Spotify
Install-Package VLC.VideoLAN
# Install-Package Audacity.Audacity
Install-Package yt-dlp.yt-dlp
# Install-Package vkbo.novelWriter
# Install-Package TidyCustoms.Publii

# Communication
# Install-Package SlackTechnologies.Slack
# Install-Package Discord.Discord
# Install-Package 9NKSQGP7F2NH  # WhatsApp Store ID

# Browsers
Install-Package Google.Chrome
Install-Package Mozilla.Firefox

# Gaming
Install-Package EpicGames.EpicGamesLauncher
Install-Package Ubisoft.Connect
Install-Package Valve.Steam

# Creative / Dev
Install-Package BlenderFoundation.Blender
# Install-Package GodotEngine.GodotEngine
# Install-Package MKLabs.StarUML
# Install-Package Google.AndroidStudio
# Install-Package Google.PlatformTools
# Install-Package Oracle.JDK.18
Install-Package OBSProject.OBSStudio
Install-Package dev47apps.DroidCam

# AI
# Install-Package Anthropic.Claude

# Data / Analytics
# Install-Package Microsoft.PowerBI

# Dotfiles
Install-Package twpayne.chezmoi

# Init chezmoi
Write-Host "📂 Initializing chezmoi..." -ForegroundColor Cyan
chezmoi init --apply HYP3R00T

Write-Host "✅ Setup complete. You may want to restart your terminal." -ForegroundColor Green
