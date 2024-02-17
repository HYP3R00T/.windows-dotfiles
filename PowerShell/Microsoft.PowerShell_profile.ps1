Invoke-Expression (&starship init powershell)

# Remove blue bg with white fonts for directories (list styles -> $PSStyle)
$PSStyle.FileInfo.Directory = "`e[34m"

# # Aliases
# New-Alias ad open_til_repo

# # Functions
# function open_til_repo {
#     Set-Location -Path "C:\Users\Rajes\"
#     code .gitconfig
# }

Clear-Host