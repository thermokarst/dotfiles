# dotfiles

set the fqdn (this is necessary for some of the host-specific chezmoi config):

```bash
# debian
sudo hostnamectl set-hostname $MY_HOSTNAME.local

# macos
sudo scutil --set HostName $MY_HOSTNAME.local
sudo scutil --set LocalHostName $MY_HOSTNAME
sudo scutil --set ComputerName $MY_HOSTNAME
dscacheutil -flushcache  # maybe reboot, too?
```

set the shell:

```bash
# debian
chsh -s $(which zsh)

# macos
sudo chpass -s '/opt/local/bin/zsh' $USER
```

set up the package manager:

```bash
xcode-select --install
# grab the pkg installer from: https://www.macports.org/install.php
```

patched font, [Anonymice Pro](https://www.nerdfonts.com/font-downloads)

bootstrap chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- \
  init \
  git://pingo.thermokar.st/dotfiles \
  --apply \
  --guess-repo-url=false
```
