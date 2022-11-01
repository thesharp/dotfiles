# dotfiles

## Current status

Currently the WSL branch is out of sync, because I don't work on Windows PCs at this very moment, but the master branch is up to date with MacOS.

## License

All this stuff here is licensed under the [MIT license](LICENSE).

## How to

- Install `Xcode` from the AppStore

- Install a patched `powerline` Monaco font
```bash
https://disk.yandex.ru/d/PFmmqHUo8cKt5g
https://disk.yandex.ru/d/H2eZvtdFVdUhYg -- JetBrains Light Nerd Font Complete
```

- Apply an iTerm2 profile
```bash
https://disk.yandex.ru/d/TtINxbTEEznZ4g
```

- Install homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install necessary packages
```bash
brew install aria2 docker fzf git gnu-sed gnupg go hub jq neovim node pip-completion pyenv pyenv-virtualenv pyenv-virtualenvwrapper ranger reattach-to-user-namespace rg tmux tmuxinator wget xz yarn zsh zsh-completions
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

- Install the following Python versions: 2.7.17 and 3.8.6 from `pyenv`
```bash
pyenv install 2.7.17
pyenv install 3.8.6
```

- Install latest Python 3.x version (3.10.7 at the moment of this writing) from `pyenv`
```bash
pyenv install 3.10.7
```

- Create a separate Python virtual environment just for `nvim` and install necessary packages
```bash
pyenv virtualenv 3.10.7 py3nvim
pyenv activate py3nvim
python3 -m pip install pynvim
pyenv which python
```

- Patch a `lima` formula and install it along with `colima`
```bash
https://gist.github.com/thesharp/b3d6963da30d0e427b62002b08289b25
brew edit lima
brew install -s lima
brew install colima
```
