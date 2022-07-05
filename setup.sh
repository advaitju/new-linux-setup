#! /bin/bash

sudo apt update
sudo apt upgrade

# Install software/packages
sudo apt install wget curl gcc git make xclip vim fonts-powerline zsh tmux rename build-essential
# VS Code
sudo snap install code --classic

# Set up Git
git config --global core.eol lf           # Git changes line-endings to Linux when needed
git config --global core.autocrlf input   # Automatically convert line-endings to Linux on commit
git config --global init.defaultBranch main  # Set default 'git init' branch name to 'main'


# zsh setup
# Trigger zsh first time user setup.
zsh -v
# Set zsh as default terminal
chsh -s /bin/zsh
# Get directory colors
cd ~ && curl -o ~/dircolors.256dark https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark && cd -
# zsh config
echo "PS2='> '"						                                             | tee -a ~/.bashrc ~/.zshrc

mv ./.zsh_aliases ~/.zsh_aliases
echo "source ~/.zsh_aliases"                                           | tee -a ~/.bashrc ~/.zshrc

echo "eval \`dircolors ~/dircolors.256dark\`"                          | tee -a ~/.bashrc ~/.zshrc
# Check if powerline-fonts for agnoster are installed correctly
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"


# tmux setup
# oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf -t ~
cp ~/.tmux/.tmux.conf.local ~
# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect

echo "set -g mouse on"                                                 | tee -a ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'"                     | tee -a ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-resurrect'"                    | tee -a ~/.tmux.conf


# Hide username and machine name from CLI prompt
echo '
# Hide username and machine name from CLI prompt
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)"
  fi
}
' | tee -a ~/.bashrc ~/.zshrc


# Set up nodenv
# Backup any existing copy first. Proceed only if it succeeds.
sudo mv -i ~/.nodenv ~/.nodenv-backup && \
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' | tee -a ~/.bashrc ~/.zshrc
echo 'eval "$(nodenv init -)"' | tee -a ~/.bashrc ~/.zshrc
# Reload shell to load nodenv
source ~/.zshrc
# Install nodenv-build - to be able to install node versions using the 'nodenv install' command
git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build
# Test if nodenv is set up correctly
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash

# Set up phpenv
# Backup any existing copy first. Proceed only if it succeeds.
# sudo mv -i ~/.phpenv ~/.phpenv-backup && \
# git clone git://github.com/phpenv/phpenv.git ~/.phpenv
# echo 'export PATH="$HOME/.phpenv/bin:$PATH"' | tee -a ~/.bashrc ~/.zshrc
# echo 'eval "$(phpenv init -)"' | tee -a ~/.bashrc ~/.zshrc
# Reload shell to load phpenv
# source ~/.zshrc
# Install phpenv-build - to be able to install php version using the 'phpenv install' command
# git clone git://github.com/php-build/php-build.git $HOME/.phpenv/plugins/php-build

git clone git@github.com:advaitju/linux-tools.git ~
sh ~/linux-tools/setup.sh

# Set up 
## mkdir ~/scripts
# mv ./s ./take ~/scripts/
## mv ./s ~/scripts/
## sudo chmod +x ~/scripts/*
## ln -s ~/scripts/s /bin
## ln -s ~/scripts/take /bin

## Do manually
## Set ZSH_THEME="agnoster"

## Add github SSH keys
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/github_id_rsa
# xclip -sel clip < ~/.ssh/github_id_rsa.pub
## Test github connection
# ssh -T git@github.com
