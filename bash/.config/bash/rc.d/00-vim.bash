# Vim and neovim 

# Set vim to nvim
# TERM=wezterm is no problem for kitty, and enables undercurls for wezterm
alias nvim="env TERM=wezterm nvim"
alias vim="nvim"
alias ovim="exec vim"

# Headless packer commands
alias packer-compile="nvim --headless -c 'autocmd User PackerCompileDone quitall' -c 'PackerCompile'"
alias packer-sync="nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'"
alias packer-install="nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'"
alias packer-update="nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerUpdate'"

# Headless tree-sitter commands
alias tsvim-update="nvim --headless -c 'TSUpdateSync'"

