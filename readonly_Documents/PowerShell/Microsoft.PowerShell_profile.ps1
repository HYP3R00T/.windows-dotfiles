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
# kubectl completion powershell | Out-String | Invoke-Expression

# Enable kubectl autocompletion
# if (Get-Command kubectl -ErrorAction SilentlyContinue) {
#     kubectl completion powershell | Out-String | Invoke-Expression
# }

if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    # Generate and register kubectl autocompletion
    $kubectlCompletion = kubectl completion powershell | Out-String
    Invoke-Expression $kubectlCompletion
    # Ensure kubectl completion takes precedence
    Register-ArgumentCompleter -CommandName 'kubectl' -ScriptBlock {
        param($wordToComplete, $commandAst, $cursorPosition)
        kubectl completion powershell | Out-String | Invoke-Expression
    }
}

# Add alias
Set-Alias -Name k -Value kubectl

# Echo a message to indicate the profile has been loaded
Write-Host "PowerShell profile loaded successfully." -ForegroundColor Green