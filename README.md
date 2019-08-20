# Dotfiles

```bash
$ sudo zypper install \
  the_silver_searcher \
  cmus \
  ctags \
  docker \
  gcc \
  git \
  htop \
  mr \
  nodejs10 \
  postgresql \
  postgresql-server \
  postgresql-devel \
  tlp \
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
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ sudo sh Miniconda3-latest-Linux-x86_64.sh  # install to /opt/miniconda3
$ sudo conda update conda
$ wget https://raw.githubusercontent.com/qiime2/environment-files/master/latest/staging/qiime2-latest-py36-linux-conda.yml
$ conda env create -n q2dev --file qiime2-latest-py36-linux-conda.yml
```
