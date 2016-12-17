# dotfiles

## About

This is the home of my personal dotfiles. I use it to bootstrap a sane environment for me to work on various machines with different operating systems.

## License

All this stuff here is licensed under the [MIT license](LICENSE).

## How to

### MacOS X

*Full version coming when I will setup a new box*

* Install homebrew

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Install necessary packages

```bash
brew install zsh-completion git gnu-sed gnupg hub pip-completion pyenv pyenv-virtualenvwrapper reattach-to-user-namespace tmux wget
```

* Install vim

```bash
brew install macvim --with-override-system-vim
```

* Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

* Run the update.sh script to link stuff up

```bash
$HOME/dotfiles/update.sh
```

### Linux

*Full version coming when I will setup a new box*

* Enable passwordless sudo

* Install necessary packages (including vim)

```bash
sudo yum install -y zsh git tmux wget vim-enhanced
```

* Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

* Run the update.sh script to link stuff up

```bash
$HOME/dotfiles/update.sh
```

### OpenBSD

* Enable passwordless doas. Run it as root (su -)

```bash
echo "permit nopass keepenv { PKG_PATH ENV PS1 SSH_AUTH_SOCK } :wheel" >> /etc/doas.conf
```

* Install necessary packages (including vim [choose a flavor like vim-7.4.769-no_x11-perl-python3-ruby], no mutt needed on OpenBSD boxes)

```bash
doas pkg_add zsh vim colorls git
```

* Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

* Run the update.sh script to link stuff up

```bash
$HOME/dotfiles/update.sh
```

### FreeBSD

* Install necessary packages

```bash
pkg install zsh sudo git vim gnuls
```

* Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

* Run the update.sh script to link stuff up

```bash
bash $HOME/dotfiles/update.sh
```
