# dotfiles


### Bare repo for my .configs

Trying to follow the guide here: https://www.atlassian.com/git/tutorials/dotfiles 
Except I am using "cfg" as alias for my git commands.

A big part of how my system is configured is based on the Yabai windows manager combined with skhd for keyboard commands.
For command line I have integrated exa for listing files and directories, bat instead of cat for highlighting and color.
Together these tool work with various shell scripting from my .config/bin folder called through my .zshrc to help get stuff done, including dynamically updating and displaying keyboard shortcuts and aliases for the system.

## Todo's
- Script a faster/easier/automated way for git add, commit and push for the bare repo (so far "cfg commit -am 'message' " seems to be the easiest way.)
- Separately synced prv_alias file for confidential aliases sourced in the .zshrc. How do I have my repo open for all but keep the prv_aliases private? 
- Have the script that displays shortcuts decide to include either the skhd file if on OSX or the Sway config file if on Arch
- Decide if 'fd $1 peco' is useful instead of broot for finding files on system. Searching in nnn might already be good enough as most text and config files are found through telescope in Neovim anyway.

