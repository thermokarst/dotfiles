# dotfiles

on debian machines, first set the fqdn:

```bash
sudo hostnamectl set-hostname $MY_HOSTNAME.local
```

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init ssh://git@pingo.thermokar.st/dotfiles --apply --guess-repo-url=false
```
