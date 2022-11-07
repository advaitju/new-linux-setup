#! /bin/bash

# Git
git config --global core.eol lf           # Git changes line-endings to Linux when needed
git config --global core.autocrlf input   # Automatically convert line-endings to Linux on commit
git config --global init.defaultBranch main  # Set default 'git init' branch name to 'main'


# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "alias gc='git config user.name \"Advait Junnarkar\" && git config user.email <email>'" | tee -a ~/.zsh_aliases
echo "alias c='clear && tput reset'" | tee -a ~/.zsh_aliases
echo "alias t='tmux'" | tee -a ~/.zsh_aliases
echo "alias t0='tmux attach-session -t 0'"  | tee -a ~/.zsh_aliases
echo "alias t1='tmux attach-session -t 1'" | tee -a ~/.zsh_aliases
echo "alias t2='tmux attach-session -t 2'" | tee -a ~/.zsh_aliases
echo "alias t3='tmux attach-session -t 3'" | tee -a ~/.zsh_aliases
echo "alias tls='tmux ls'" | tee -a ~/.zsh_aliases
echo "alias lsa='ls -a'" | tee -a ~/.zsh_aliases

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget tmux


# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
cp ~/.tmux/.tmux.conf ~
rm -rf ~/.tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect

echo "set -g mouse on"                                                 | tee -a ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'"                     | tee -a ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-resurrect'"                    | tee -a ~/.tmux.conf
