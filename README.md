# dotfiles

## 1. set the fqdn:

```bash
# macos-specific commands
sudo scutil --set HostName $MY_HOSTNAME.local
sudo scutil --set LocalHostName $MY_HOSTNAME
sudo scutil --set ComputerName $MY_HOSTNAME
dscacheutil -flushcache
```

## 2. reboot

## 3. install https://typeof.net/Iosevka/

## 4. install `age` private key from password manager into `~/.key.txt`

## 5. bootstrap chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- \
  init \
  git://pingo.thermokar.st/dotfiles \
  --apply \
  --guess-repo-url=false
```

## 6. restart shell
