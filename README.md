# dotfiles

## About

This is the home of my personal dotfiles. I use it to bootstrap a sane environment for me to work on various machines with different operating systems.

## License

All this stuff here is licensed under the [MIT license](LICENSE).

## How to

### macOS

- Install `Xcode` from the AppStore

- Install a patched `powerline` Monaco font
```bash
https://gist.github.com/rogual/6824790627960fc93077/raw/88d6a40aec5c2d9bc8db30ecbbc6b33fa3e3cb6b/Monaco%2520for%2520Powerline.otf
```

- Install homebrew
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install necessary packages
```bash
brew install zsh zsh-completions git gnu-sed gnupg hub pip-completion pyenv pyenv-virtualenvwrapper reattach-to-user-namespace tmux wget ag fzf
```

- Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- Install vim
```bash
brew install macvim --with-override-system-vim --with-lua --with-python3
```

- Link Python 3 and install pip3
```bash
sudo brew link python3
brew postinstall python3
```

- Install Python 3 neovim support
```bash
pip3 install neovim
```

- Clone the dotfiles repo
```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

- Remove the existing `~/.zshrc` file from oh-my-zsh installation
```bash
rm -f ~/.zshrc
```

- Run the update.sh script to link stuff up
```bash
$HOME/dotfiles/update.sh
```

- Install Python 2.7

```bash
pyenv install 2.7.14
```

- Switch global Python version

```bash
pyenv global 2.7.14
```

### Linux

*Full version coming when I will setup a new box*

- Enable passwordless sudo

- Install necessary packages (including vim)

```bash
sudo yum install -y zsh git tmux wget vim-enhanced
```

- Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

- Run the update.sh script to link stuff up

```bash
$HOME/dotfiles/update.sh
```

### OpenBSD

- Enable passwordless doas. Run it as root (su -)

```bash
echo "permit nopass keepenv { PKG_PATH ENV PS1 SSH_AUTH_SOCK } :wheel" >> /etc/doas.conf
```

- Install necessary packages (including vim [choose a flavor like vim-7.4.769-no_x11-perl-python3-ruby])

```bash
doas pkg_add zsh vim colorls git
```

- Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

- Run the update.sh script to link stuff up

```bash
$HOME/dotfiles/update.sh
```

### FreeBSD

- Install necessary packages

```bash
pkg install zsh sudo git vim gnuls
```

- Clone the dotfiles repo

```bash
git clone --recursive git@github.com:thesharp/dotfiles $HOME/dotfiles
```

- Run the update.sh script to link stuff up

```bash
bash $HOME/dotfiles/update.sh
```
