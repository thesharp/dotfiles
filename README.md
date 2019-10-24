# dotfiles

## License

All this stuff here is licensed under the [MIT license](LICENSE).

## How to

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
brew install zsh zsh-completions git gnu-sed gnupg hub pip-completion pyenv pyenv-virtualenvwrapper reattach-to-user-namespace tmux wget rg fzf neovim ag
```

- Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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
