# dotfiles

## opensuse tumbleweed

```bash
$ sudo visudo  # add /opt/miniconda3/bin to secure_paths
$ sudo zypper install git libopenssl-1_1-devel tree zsh ripgrep
$ sudo zypper install -t pattern devel_C_C++
$ sudo chsh -s $(which zsh)
$ sudo hostname rattusrattus
$ sudo systemd-tmpfiles --create
$ sudo echo "[interop]\nappendWindowsPath = false" > /etc/wsl.conf
$ git clone --origin pingo ssh://git@pingo.thermokar.st/dotfiles ~/.dotfiles
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ cd ~/.dotfiles
$ ./install
$ source ~/.zshrc
$ base16_ashes
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ git clone ssh://git@pingo.thermokar.st/gwar ~/gwar
$ cd gwar
$ cargo build --release
$ ./target/release/gwar ~/.dotfiles/repos.toml
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ sudo sh Miniconda3-latest-Linux-x86_64.sh -p /opt/miniconda3 -b
$ sudo conda update conda
$ wget https://raw.githubusercontent.com/qiime2/environment-files/master/latest/staging/qiime2-latest-py38-linux-conda.yml
$ conda env create -n q2dev --file qiime2-latest-py38-linux-conda.yml
```

## macos

```bash
$ wget -O gwar https://github.com/thermokarst/gwar/releases/download/0.0.1/gwar-macos
$ chmod +x gwar
$ ./gwar ~/.dotfiles/repos.toml
$ git clone --origin pingo ssh://git@pingo.thermokar.st/dotfiles ~/.dotfiles
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ cd ~/.dotfiles
$ ./install
$ source ~/.zshrc
# At the time of this commit, cmus depends on mp4v2 - the latest version
# (ae4bd4f26c27327c8d188e127022d9231f8c7d4b) doesn't appear to be linking
# correctly, so I had to manually install an older version.
$ sudo -s
$ yes | port install \
    ImageMagick \
    cargo \
    cmus \
    curl \
    git \
    gnupg2 \
    htop \
    nodejs16 \
    pass \
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
$ vim +PlugInstall
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
$ sudo sh Miniconda3-latest-MacOSX-x86_64.sh -p /opt/miniconda3 -b
$ sudo conda update conda
$ wget https://raw.githubusercontent.com/qiime2/environment-files/master/latest/staging/qiime2-latest-py38-osx-conda.yml
$ conda env create -n q2dev --file qiime2-latest-py38-osx-conda.yml
```

## manual apps

- chrome
- cisco anyconnect
- docker desktop
- firefox
- garageband
- iterm2
- libreoffice
- melodics
- passff-host
- postgres.app
- renoise
- signal
- slack
- steermouse
- thunderbird
- virtualbox
- vscode
- xcode
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
