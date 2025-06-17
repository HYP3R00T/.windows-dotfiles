function Setup-Dotfiles {
    Install-Package twpayne.chezmoi
    chezmoi init --apply https://github.com/HYP3R00T/.windows-dotfiles
}
