# dotfiles

## hostnames

- `rattusrattus`: macbook
- `yersiniapestis`: wsl (debian)
- `devterm`: devterm (debian)

## steps

(1) set the fqdn (this is necessary for some of the host-specific chezmoi config):

```bash
# debian standalone
sudo hostnamectl set-hostname $MY_HOSTNAME.local

# debian wsl
echo -e "[network]\nhostname = $MY_HOSTNAME" | sudo tee -a /etc/wsl.conf

# macos
sudo scutil --set HostName $MY_HOSTNAME.local
sudo scutil --set LocalHostName $MY_HOSTNAME
sudo scutil --set ComputerName $MY_HOSTNAME
dscacheutil -flushcache
```

(2) reboot

(3) set up the package manager and bootstrap dependencies:

```bash
# debian
sudo apt update
sudo apt install curl zsh git

# macos
xcode-select --install
# download the pkg installer from: https://www.macports.org
# TODO: is there a reasonable unattended install workflow for macports?
```

(4) set the initial shell:

```bash
# debian
chsh -s $(which zsh)

# macos
# NA
```

(5) install a patched font, [Anonymice Pro](https://www.nerdfonts.com/font-downloads).
  - wsl: size 11
  - macos: size 16 or 17, no anti-aliasing

(6) install `age` private key from password manager into `~/.key.txt`

(7) bootstrap chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- \
  init \
  git://pingo.thermokar.st/dotfiles \
  --apply \
  --guess-repo-url=false
```

(8) set the new shell (in case installing from 3rd-party package manager):

```bash
# debian
# NA

# macos
sudo chpass -s '/opt/local/bin/zsh' $USER
```

(9) restart shell

(10) grab project source

```bash
ssh -T git@github.com
gwar ~/.local/share/chezmoi/data/personal.toml
```

(11) install miniconda:

```bash
# debian
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

# macos
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -O miniconda.sh

# then, for either os:
chmod +x miniconda.sh
sudo ./miniconda.sh -b -u -p /opt/miniconda3
```

(12) set up non-automated software and tools:

- steermouse (license in email): btn4==fwd, btn5==bck
- logitech control center
- lunar
- magnet
