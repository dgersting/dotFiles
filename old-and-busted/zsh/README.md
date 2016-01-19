# My persoal .files
My personal Linux dot files

# Install
	git clone https://github.com/dgersting/dotFiles.git ~/.zsh
	ln -s ~/.zsh/.zshenv ~/.zshenv
	# Open a new shell to load new env

# Config
Main enviornment config file: `~/.zshenv` which should be kept as light as possible as it's sourced for every shell (interactive and non-interactive)

* `ZDOTDIR` Location in which zsh will look for 'local' dot files. (Default: `$HOME/.zsh`)
* `ADOTDIR` Location Antigen will place cloned git repos for our environment (Default: `$HOME/.antigen`)

# [Antigen](https://github.com/zsh-users/antigen)
Local customization file: `~/.antigenrc`
