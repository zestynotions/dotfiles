# =================================================== #
#  ____     ___     ____
# /\_ ,`\ /' _ `\  /',__\
# \/_/  /_/\ \/\ \/\__, `\
#   /\____\ \_\ \_\/\____/
#   \/____/\/_/\/_/\/___/
#
# =================================================== #
#------------ http://www.zestynotions.com ------------#
# =================================================== #

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Show current working directory breadcrumb and list files
 function chpwd() {
     emulate -L zsh
     clear
     eza -la --git --git-ignore --icons=always --color=always --group-directories-first
 }

# =================================================== #
# ----- Obsidian functions https://obsidian.md/ ----- #
# =================================================== #

# Declare where your Obsidian vault is, in my case it is synced through Icloud.
obsidianvault="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/zns" 

alias en="edit_notes" # fuzzy find and edit obsidian notes in neovim
function edit_notes() {
 cd $obsidianvault
  sk --reverse --margin=3% --prompt='Edit in Nvim: ' --preview='bat --style=numbers --color=always {}' | xargs nvim
}

# =================================================== #
# ------ Keybindings for FZF /skim functions -------- #
# =================================================== #

alias ed='edit_dotfile' # search dotfile and edit.
function edit_dotfile() {
  cd $HOME/.config
  sk --reverse --margin=3% --prompt='Edit in Nvim: ' --preview='bat --style=numbers --color=always {}' | xargs nvim
 }

alias j='jump2zoxide' # search zoxide folders and jump to that folder
function jump2zoxide() {
   PATH_RESULT=$(zoxide query -l|sk --reverse --margin=3% --prompt='Jump to directory: ' --preview='eza -a --tree --color=always --icons=always --level=1 {}')
   cd "$PATH_RESULT"
 }

# =================================================== #
# ============ Find_and_kill process ================ #
# =================================================== #

alias kp='kill_process' # Search active processes and kill it
function kill_process() {
procs -t |sk --reverse |awk '{print $2}'|xargs kill -9
}

# =================================================== #
#------------- Defaults ----------------------------- #
# =================================================== #

export EDITOR='nvim'
export BROWSER='brave'
export TERMINAL='wezterm'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export PATH=$PATH:/usr/local/bin:~/.config/bin:~/.local/bin
export MANPAGER="sh -c 'col -bx|bat -l man -p'" # Use bat to show man pages

# =================================================== #
# ------------- Normal Aliases ---------------------- #
# =================================================== #

alias e='yazi'               # Rust based file explorer
alias resetzns='sh <(wget -qO- https://zns.one/rc)' # CAUTION!! Grabs github dotfiles and overwrite existing CAUTION!!
alias av='grep "keymap" $HOME/.config/nvim/init.lua|bat'	# Show keymaps for Neovim
alias at='grep "bind" $HOME/.config/tmux/tmux.conf|bat'		# Show keymaps for tmux 
alias aa='grep "alt-" $HOME/.config/aerospace/aerospace.toml|bat'	# Show keymaps for aerospace 
alias ZZ=''           # Error handling for when exititing nvim times 2 by mistake.
alias v='nvim' 				# Another alias for Neovim
alias vim='nvim' 			# Another alias for Neovim
alias a='clear; show_shortcuts' # List all aliases
alias help='show_shortcuts' # List all aliases
alias du='duf'        # show mounts and disk usage
alias w="clear; curl v2.wttr.in/tokyo" #show Tokyo weater forecast for the nest 3 days
alias p='clear; ping -c 3 google.com' # ping google 3 timer and exit
alias q='exit' 				    # Exits the terminal (Quit)
alias gc='git_commit'     # git commit all with message and push
alias Q='exit' 				    # Exits the terminal (Quit)
alias kk='cd ../.. '     # Go up 2 levels
alias k='cd .. '         # Go up 1 levels
alias fg=''fg'' 		      # Bring back a process that was in the background
alias t='tmux attach||tmux new' # Attach to existing tmux session or start a new tmux session
alias i='clear; macchina'          # runs macchina terminal splash
alias ll='clear; eza -la --icons --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa
alias lt='clear; eza --tree --level=1 --icons --group-directories-first' # show tree view
alias ls='clear; eza -la --icons --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa
alias bat='bat -p'        # bat -> bat -plain files
alias b='bat -p $1'       # bat show file as plain file
alias ez='nvim ~/.zshrc'  # Edit zsh config (this file) in Neovim
alias sz='clear; source ~/.zshrc' # source the zsh config file
alias ip="ifconfig | grep 'inet '"  # Show ip address

# --------- OS agnostic commands ----------------
alias uu='update_apps'       # uu --> will update all apps on debian, arch, alpine and mac
alias ii='install_apps'      # 'ii vim' --> will install vim on debian, arch, alpine and mac
alias rb='reboot_sys'        # Will reboot the system

# --------- MAC OS stuff ------------------------
alias o='open .'    	# Open folder in macos finder

# --------- NixOS stuff -------------------------
alias rn='sudo nixos-rebuild switch'  # rebuild and Restart
alias ui='hyprland' # Start the Hyprland window manager
alias ec='sudo nvim /etc/nixos/configuration.nix' # Edit nix conf file
alias sd='sudo shutdown -h now' # shutdown without waiting

# =================================================== #
# ----------------- Git .config magic --------------- #
# =================================================== #

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # prefix for git to handle my dotfiles
alias cfgl='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME log --oneline' # show git log in one line for the dotfiles
alias cfgc='cfg_commit' # Simplified commit all and push for dotfiles
alias gc='git_commit'   # Simplified commit all and push for github


# =================================================== #
# --------------- Source Private Aliases ------------ #
# =================================================== #

# Create and add your private shortcuts in this file that are not sync to github
if [ -f "$HOME/private.sh" ]; then
source $HOME/private.sh
fi

source $HOME/.config/bin/sysmanage

pfetch # can also use "macchina"" to show terminal initial info with splash of color
