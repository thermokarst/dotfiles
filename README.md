# Dotfiles

```bash
$ git clone https://github.com/thermokarst/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ ./homebrew-install
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
$ chsh -s /usr/local/bin/zsh
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ ./install
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ vim +PlugInstall
$ mkdir ~/bin
$ git clone https://github.com/laurent22/rsync-time-backup ~/bin/.rsync-time-backup
$ ln -s ~/bin/.rsync-time-backup/rsync_tmbackup.sh ~/bin/rsync_tmbackup.sh
```
