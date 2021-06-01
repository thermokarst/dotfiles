# dotfiles

```bash
$ git clone --origin thermokart ssh://git@pingo.thermokar.st:dotfiles ~/.dotfiles
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ cd ~/.dotfiles
$ ./install
$ source ~/.zshrc
$ sudo port install \
    ImageMagick \
    cmus \
    curl \
    git \
    gnupg2 \
    htop \
    nodejs16 \
    pass \
    pinetry-mac \
    syncthing-macos \
    the_silver_searcher \
    tmux \
    tmux-pasteboard \
    tree \
    vim \
    watch \
    wget
$ base16_ashes
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
$ sudo sh Miniconda3-latest-MacOSX-x86_64.sh -p /opt/miniconda3 -b
$ sudo conda update conda
$ wget https://raw.githubusercontent.com/qiime2/environment-files/master/latest/staging/qiime2-latest-py38-osx-conda.yml
$ conda env create -n q2dev --file qiime2-latest-py38-osx-conda.yml
$ conda env create -n dotfiles -c conda-forge pygit2
$ conda run -n dotfiles python ~/.dotfiles/bin/sync_git_repos.py ~/.dotfiles/repos.ini
```

## manual apps

- chrome
- docker desktop
- firefox
- garageband
- iterm2
- libreoffice
- melodics
- passff-host
- postgres.app
- steermouse
- thunderbird
- virtualbox
- vscode
- zoom

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
