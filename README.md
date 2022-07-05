# dotfiles

## wslg ubuntu

```bash
sudo apt update
sudo apt upgrade
sudo apt install neovim tmux ripgrep zsh tree git build-essential libssl-dev pkg-config mpd
sudo hostname $HOSTNAME
chsh -s $(which zsh)
sudo echo "[interop]\nappendWindowsPath = false" > /etc/wsl.conf
git clone --origin pingo ssh://git@pingo.thermokar.st/dotfiles ~/.dotfiles
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cd ~/.dotfiles
./install
source ~/.zshrc
base16_ashes
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone ssh://git@pingo.thermokar.st/gwar ~/gwar
cd ~/gwar
cargo build --release
./target/release/gwar ~/.dotfiles/$REPOS.toml
cd ~/ && rm -rf ~/gwar
```

## manual apps

- chrome
- cisco anyconnect
- docker desktop
- firefox
- garageband
- iterm2
- libreoffice
- logseq
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
