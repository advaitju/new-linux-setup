#! /bin/bash

# Git
git config --global core.eol lf # Git changes line-endings to Linux when needed
git config --global core.autocrlf input # Automatically convert line-endings to Linux on commit
git config --global init.defaultBranch main  # Set default 'git init' branch name to 'main'
git config --global --add --bool push.autoSetupRemote true


# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

$SHELL_CONFIG_FILE=~/.zshrc

echo "alias c='clear && tput reset'" | tee -a ~/.zshrc
echo "alias rm='rm -rf'"             | tee -a ~/.zshrc
echo | tee -a ~/.zshrc

echo "alias ga='git add .'"                    | tee -a ~/.zshrc
echo "alias gc='git commit -m'"                | tee -a ~/.zshrc
echo "# Fast git commit"                       | tee -a ~/.zshrc
echo "alias gcf='git add . && git commit -m \"Commit\" && git push'" | tee -a ~/.zshrc
echo "# git config (work)"                     | tee -a ~/.zshrc
echo "alias gcfw='git config user.name \"Advait Junnarkar\" && git config user.email <email>'" | tee -a ~/.zshrc
echo "alias gp='git push'"                     | tee -a ~/.zshrc
echo "alias gs='git status'"                   | tee -a ~/.zshrc
echo "alias gsp='git stash && git pull && git push && git stash pop'" | tee -a ~/.zshrc

echo "alias lsa='ls -a'"                       | tee -a ~/.zshrc
echo                                           | tee -a ~/.zshrc

echo "alias t='tmux'"                          | tee -a ~/.zshrc
echo "alias t0='tmux attach-session -t 0'"     | tee -a ~/.zshrc
echo "alias t1='tmux attach-session -t 1'"     | tee -a ~/.zshrc
echo "alias t2='tmux attach-session -t 2'"     | tee -a ~/.zshrc
echo "alias t3='tmux attach-session -t 3'"     | tee -a ~/.zshrc
echo "alias tls='tmux ls'"                     | tee -a ~/.zshrc
echo "alias tr='tmux rename-session -t'\n"     | tee -a ~/.zshrc
echo                                           | tee -a ~/.zshrc

echo "alias n='npm'"                           | tee -a ~/.zshrc
echo | tee -a ~/.zshrc


echo "alias ..='cd ..'" | tee -a $SHELL_CONFIG_FILE
echo "alias ...='cd ../..'" | tee -a $SHELL_CONFIG_FILE
echo "alias ....='cd ../../..'" | tee -a $SHELL_CONFIG_FILE
echo "alias .....='cd ../../../..'" | tee -a $SHELL_CONFIG_FILE
echo | tee -a ~/.zshrc


# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/advait/.zprofile # Add brew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zshrc

brew install wget tmux gh
brew install --cask visual-studio-code


# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.zshrc
nvm install node


# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
cp ~/.tmux/.tmux.conf ~
rm -rf ~/.tmux

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect

echo                                                   | tee -a ~/.tmux.conf
echo "set -g mouse on"                                 | tee -a ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'"     | tee -a ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-resurrect'"    | tee -a ~/.tmux.conf


# Reload terminal
source ~/.zshrc
