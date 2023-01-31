# dotfiles

on debian machines, set the fqdn (this is necessary for some of the host-specific chezmoi config):

```bash
sudo hostnamectl set-hostname $MY_HOSTNAME.local
```

set the shell:

```bash
chsh -s $(which zsh)
```

bootstrap chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- \
  init \
  git://pingo.thermokar.st/dotfiles \
  --apply \
  --guess-repo-url=false
```
