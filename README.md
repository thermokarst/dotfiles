# dotfiles

```bash
$ git clone https://github.com/thermokarst/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ git remote rename origin thermokarst
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ ./install
$ sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
$ source ~/.zshrc
$ nix-env -i \
  alacritty \
  cmus \
  docker \
  elixir \
  git \
  htop \
  nodejs \
  postgresql \
  reattach-to-user-namespace \
  silver-searcher \
  syncthing \
  tmux \
  vim \
  wget \
  xz \
  yarn
$ base16_ashes
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
$ sudo sh Miniconda3-latest-MacOSX-x86_64.sh -p /opt/miniconda3 -b
$ sudo conda update conda
$ wget https://raw.githubusercontent.com/qiime2/environment-files/master/latest/staging/qiime2-latest-py36-osx-conda.yml
$ conda env create -n q2dev --file qiime2-latest-py36-osx-conda.yml
```

## optional vscode extensions

```bash
$ code --install-extension AndrsDC.base16-themes
$ code --install-extension ecmel.vscode-html-css
$ code --install-extension formulahendry.auto-close-tag
$ code --install-extension hollowtree.vue-snippets
$ code --install-extension JakeBecker.elixir-ls
$ code --install-extension karigari.chat
$ code --install-extension lextudio.restructuredtext
$ code --install-extension ms-python.python
$ code --install-extension ms-vscode.Go
$ code --install-extension ms-vsliveshare.vsliveshare
$ code --install-extension redhat.vscode-yaml
$ code --install-extension vscodevim.vim
$ code --install-extension wakatime.vscode-wakatime
```
