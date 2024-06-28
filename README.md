## USAGE

```sh
git clone --recursive git@github.com:yukimura1227/dotfiles.git
```



```sh
# homebrew install and then 
cd dotfiles/for_mac_only/common_brewfile

# install Roset for google japanese input
sudo softwareupdate --install-rosetta

brew bundle
```

```sh
# setup symbolic links
sh create_link_to_dotfiles.sh

sh for_mac_only/linking_karabiner_settings.sh
```

```sh
vim
# and then :GoInstallBinaries
```
