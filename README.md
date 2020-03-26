# Dotfiles

```bash
$ git clone https://github.com/thermokarst/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ git remote rename origin thermokarst
$ sudo bash -c "echo nix /System/Volumes/Data/nix | tr ' ' '\t' >> /etc/synthetic.conf"
$ sudo mkdir /System/Volumes/Data/nix
$ sudo chown $USER /System/Volumes/Data/nix
# REBOOT
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ ./install
$ curl https://nixos.org/nix/install | sh
$ source ~/.zshrc
$ nix-env -i \
  alacritty \
  docker \
  git \
  htop \
  postgresql \
  reattach-to-user-namespace \
  silver-searcher \
  tmux \
  vim \
  wget \
  xz
$ base16_ashes
$ code --install-extension AndrsDC.base16-themes
$ code --install-extension donjayamanne.githistory
$ code --install-extension github.vscode-pull-request-github
$ code --install-extension karigari.chat
$ code --install-extension lextudio.restructuredtext
$ code --install-extension ms-python.python
$ code --install-extension ms-vsliveshare.vsliveshare
$ code --install-extension vscodevim.vim
$ code --install-extension wakatime.vscode-wakatime
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
$ sudo sh Miniconda3-latest-MacOSX-x86_64.sh -p /opt/miniconda3 -b
$ sudo conda update conda
$ wget https://raw.githubusercontent.com/qiime2/environment-files/master/latest/staging/qiime2-latest-py36-osx-conda.yml
$ conda env create -n q2dev --file qiime2-latest-py36-osx-conda.yml
```
