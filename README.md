# dotfiles

## License

All this stuff here is licensed under the [MIT license](LICENSE).

## How to

- Install `Xcode` from the AppStore

- Install a JetBrainsMono Nerd font
```bash
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
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
brew install aria2 docker docker-buildx docker-compose fd fzf git gnu-sed gnupg go hub jq lua-language-server neovim node pip-completion pyenv pyenv-virtualenv pyenv-virtualenvwrapper ranger reattach-to-user-namespace rg shellcheck tmux tmuxinator wget xz yaml-language-server zsh zsh-completions zsh-fast-syntax-highlighting
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

- Install the latest Python version from `pyenv`
```bash
pyenv install 3.12.0
```

- Install various python utilities using the default versions
```bash
pip install -r requirements.txt
```

- Patch a `lima` formula and install it along with `colima`
```bash
https://gist.github.com/thesharp/b3d6963da30d0e427b62002b08289b25
brew edit lima
brew install -s lima
brew install colima
```

- Install various language servers
```bash
go install -v golang.org/x/tools/gopls@latest
npm install -g pyright bash-language-server dockerfile-language-server-nodejs
```
