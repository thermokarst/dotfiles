# dotfiles

1) set the fqdn (this is necessary for some of the host-specific chezmoi config):

```bash
# debian
sudo hostnamectl set-hostname $MY_HOSTNAME.local

# macos
sudo scutil --set HostName $MY_HOSTNAME.local
sudo scutil --set LocalHostName $MY_HOSTNAME
sudo scutil --set ComputerName $MY_HOSTNAME
dscacheutil -flushcache  # maybe reboot, too?
```

2) set the shell:

```bash
# debian
chsh -s $(which zsh)

# macos
sudo chpass -s '/opt/local/bin/zsh' $USER
```

3) set up the package manager:

```bash
# debian - nothing to do here

# macos
xcode-select --install
# download the pkg installer from: https://www.macports.org
# TODO: is there a reasonable unattended install workflow for macports?
```

4) install a patched font, [Anonymice Pro](https://www.nerdfonts.com/font-downloads). size 16 or 17, no anti-aliasing

5) bootstrap chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- \
  init \
  git://pingo.thermokar.st/dotfiles \
  --apply \
  --guess-repo-url=false
```

6) install miniconda:

```bash
# debian
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

# macos
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -O miniconda.sh

# then, for either os:
chmod +x miniconda.sh
sudo ./miniconda.sh -b -u -p /opt/miniconda3
```

7) set up software:

- steermouse (license in email): btn4==fwd, btn5==bck
