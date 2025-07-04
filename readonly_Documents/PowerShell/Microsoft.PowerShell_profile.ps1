# Load PSReadLine for better shell experience
Import-Module PSReadLine

# History navigation
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Load Starship prompt
Invoke-Expression (&starship init powershell)

# Load Zoxide for directory navigation
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

# Remove blue bg with white fonts for directories (list styles -> $PSStyle)
$PSStyle.FileInfo.Directory = "`e[34m"

# Customize token colors
Set-PSReadLineOption -Colors @{
    "Parameter" = "Cyan"
}

# Enable kubectl autocompletion
kubectl completion powershell | Out-String | Invoke-Expression

# Add alias
Set-Alias -Name k -Value kubectl

# Set environment variables
$env:K9S_CONFIG_DIR = "$HOME\.config\k9s"
