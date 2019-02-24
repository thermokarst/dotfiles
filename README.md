# Dotfiles

```bash
$ sudo zypper install \
  the_silver_searcher \
  cmus \
  docker \
  gcc \
  git \
  htop \
  mr \
  nodejs10 \
  tmux \
  tree \
  vim \
  wget \
  xz \
  zsh
$ git clone https://github.com/thermokarst/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ git remote rename origin thermokarst
$ sudo chsh $USER -s zsh
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ ./install
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ vim +PlugInstall
$ mr checkout
```
