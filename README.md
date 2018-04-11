# Dotfiles

```bash
$ git clone https://github.com/thermokarst/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
# Install macports
$ sudo port selfupdate
$ sudo port install \
  the_silver_searcher \
  aspell \
  aspell-dict-en \
  cmus \
  git \
  gnupg2 \
  graphviz-devel \
  htop \
  imagemagick \
  myrepos \
  nodejs9 \
  openssl \
  postgresql10 \
  postgresql10-server \
  python36 \
  tmux-pasteboard \
  rsync \
  tmux \
  tree \
  vim \
  wget \
  xz \
  zsh
$ sudo port select --set python python36
$ sudo port select --set python3 python36
$ sudo port select --set postgresql postgresql10
$ sudo chpass -s '/opt/local/bin/zsh' $USER
$ sudo sh -c 'echo /opt/local/bin/zsh >>/etc/shells'
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ ./install
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ vim +PlugInstall
$ mr checkout
```

## Typical `pip` modifications for macports

```bash
pip install --global-option=build_ext --global-option=-I/opt/local/include -r requirements.txt
```
