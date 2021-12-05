# dotfiles


### Bare repo for my .configs

Trying to follow the guide here: https://www.atlassian.com/git/tutorials/dotfiles 
Except I am using "cfg" as alias for my git commands.

A big part of how my system is configured is based on the Yabai windows manager for MAC OS combined with skhd for keyboard commands. However most of my dots files integrate everythig I need for use on linux, so Sway windows manager and using espanso for cross platform text expander to improve productivity and mobility between OS's.

For command line I have integrated exa for listing files and directories, bat instead of cat for highlighting and color.
lf terminal filemanager with bat preview. Im trying to use rust re-writes of existing great unix tools and "pipe" it all together.

Together these tool work with various shell scripts from my .config/bin folder called through my .zshrc to help get stuff done, including dynamically updating and displaying keyboard shortcuts and aliases for the system using "a" in terminal.

### Todo's
- Done - Script a faster/easier/automated way for git add, commit and push for the bare repo (so far "cfg commit -am 'message' " seems to be the easiest way.)
- Have the script that displays shortcuts decide to include either the skhd file if on OSX or the Sway config file if on Arch

