#===========================================================
#  ____     ___     ____
# /\_ ,`\ /' _ `\  /',__\
# \/_/  /_/\ \/\ \/\__, `\
#   /\____\ \_\ \_\/\____/
#   \/____/\/_/\/_/\/___/
#
# http://www.zestynotions.com 
#===========================================================   

# setup zsh prompt if not using starship 
# PROMPT='%F{red}${vcs_info_msg_0_}%f %F{135} ∲ %f %F{82}» %f'
# --------------------------------------------------- # 
# Show current working directory breadcrumb and list files
# function chpwd() {
#     emulate -L zsh
#     pwd; exa -la --git --git-ignore --color=always --group-directories-first
# }

# if you hit ESC while writing a command you can edit the command with vim motions 
set -o vi   

eval "$(starship init zsh)"

# ============== Define exa defaults ================ #
exa_d="exa -la --icons --git --git-ignore --color=always --group-directories-first"

alias vb='$exa_d'

# =================================================== #
# -------- Keybindings for FZF functions ------------ # 
# =================================================== #

bindkey ^e jump2file
zle -N jump2file{,}

bindkey ^j jump2folder
zle -N jump2folder{,}

# =================================================== #
# -------------- Search/jump generic----------------- # 
# =================================================== #

# Find and edit a textfile using nvim
function jump2file() {
  fd --type f --search-path / --hidden --ignore-file ~/.config/bin/searchexcludes | sk --reverse --height=90% --margin=5% --border --color='16,border:135,spinner:208' --preview='bat {}'|xargs nvim
}

# --------------------------------------------------- # 
# Find an jump to folder location
function jump2folder() {
  PATH_RESULT=$(fd --type d --search-path / --hidden --ignore-file ~/.config/bin/searchexcludes|sk --reverse --height=70% --margin=7% --border --prompt='Select a folder: ' --color='16,border:135,spinner:208' --preview='exa -a --tree --level=1 {}')
  clear
  cd "$PATH_RESULT"
  exa -la --icons --git --git-ignore --color=always --group-directories-first
}

# =================================================== #
# ------------- search/jump focused ----------------- # 
# =================================================== #

# Find and edit a textfile using nvim from dotfiles

function jump2dotfile() {
  fd --type f --search-path ~/ --hidden --ignore-file ~/.config/bin/searchexcludes | sk --reverse --height=90% --margin=5% --border --color='16,border:135,spinner:208' --preview='bat {}'|xargs nvim
}

# --------------------------------------------------- # 
# Find an jump to folder location in zoxide
function jump2zoxide() {
  PATH_RESULT=$(zoxide query -l|sk --reverse --height=70% --margin=7% --border --prompt='Select a folder: ' --color='16,border:135,spinner:208' --preview='exa -a --tree --level=1 {}')
  clear
  cd "$PATH_RESULT"
  exa -la --icons --git --git-ignore --color=always --group-directories-first
}

# --------------------------------------------------- # 
# Get to notes fast
function searchnotes() {
  cd $obsidianFolder
  fd --type f | sk --reverse --height=90% --margin=5% --border --color='16,border:135,spinner:208' --preview='bat {}'|xargs nvim
}

# --------------------------------------------------- # 
# Search_and_kill process
function search_and_kill() {
procs -t |sk --reverse |awk '{print $2}'|xargs kill -9 
}

# =================================================== #
# ------------- Defaults ---------------------------- #
# =================================================== #
export EDITOR='nvim'
export BROWSER='brave'
export TERMINAL='alacritty'
export LC_ALL='en_US.UTF-8'  
export LANG='en_US.UTF-8'
export PATH=$PATH:/usr/local/bin:~/.config/bin:~/.local/bin:~/.cargo/bin
export MANPAGER="sh -c 'col -bx|bat -l man -p'" # Use bat to show man pages


# ====== Needed for Sway Tiling Window Manager ====== #
export XDG_RUNTIME_DIR='/tmp'
export WLR_NO_HARDWARE_CURSORS='1'
export LIBINPUT_NO_DEVICES='1'


# =================================================== #
# ------------- Aliases ----------------------------- #
# =================================================== #
alias rc='sh <(wget -qO- https://zestynotions.com/rc)' # CAUTION!! Grab github dotfiles and overwrite existing CAUTION!!
alias ZZ=''           # Error handling for when exititing nvim times 2 by mistake.
alias cs='cht.sh $1' 	# Cheatsheet for man page alternative. e.g. "cs rsync" 
alias v='nvim' 				# Another alias for Neovim 
alias vim='nvim' 			# Another alias for Neovim
alias a='show_shortcuts' # List all aliases
alias du='duf'        # show mounts and disk usage
alias qq='search_and_kill' # search_and_kill process
alias e='jump2dotfile' # Find and edit file in nvim from dotfiles
alias ge='jump2file'       # Find and edit file in nvim
alias n='notetaker'       # script for taking notes
alias p='clear; ping -c 3 google.com' # ping google 3 timers and exit
alias j='jump2zoxide'     # script for jumping between folders from zoxide
alias gj='jump2folder'       # script for jumping between folder
alias fn='searchnotes'    # Jump to Icloud Note folder and open nvim
alias cdic='cd $icloudFolder' #cd to iCloud
alias lt='exa --tree --level=1 --group-directories-first'
alias q='exit' 				    # Exits the terminal (Quit)
alias Q='exit' 				    # Exits the terminal (Quit)
alias ...='cd ../.. '     # Go up 2 levels
alias ..='cd .. '         # Go up 1 levels
alias fg=''fg'' 		      # Bring back a process that was in the background
alias t='tmux' 	        	# Starts a tmux session``
alias ta='tmux attach' 		# Attaches any existing tmux sessions 
alias pf='clear; pfetch'         # runs pfetch terminal splash
alias i='clear; macchina'          # runs macchina terminal splash
alias ll='clear; exa -la --icons --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa
alias ls='clear; exa -la --icons --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa
alias cat='bat -p'        # cat -> bat
alias bat='bat -p'        # bat -> bat -plain files


# ----------------- Git .config magic ---------------------
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 		# prefix for git to handle my dotfiles
alias cfgl='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME log --oneline' # show git log in one line for the dotfiles
alias cfgc='cfg_commit'                            # Simplified commit all and push for dotfiles 
alias gc='git_commit'                            # Simplified commit all and push for dotfiles 

# ----------------- Edit config files ---------------------
alias ve='espanso edit'             # Start Neovim with espanso config
alias vz='nvim ~/.zshrc' 		        # Edit zsh config (this file) in Neovim
alias sz='source ~/.zshrc'          # source the zsh config file

# ----------------- Source Other --------------------------
source ~/.config/alacritty/prv_aliases 		# Create and add your private aliases in this file
source "$HOME/.cargo/env"

case `uname` in
  Darwin)
    # commands for OS X go here
source ~/.config/alacritty/osx_aliases 		# If like me you are in OSX you might have osx specific aliases. e.g. "brew" instead of "pacman"
  ;;
  Linux)
    # commands for Linux go here
source ~/.config/alacritty/linux_aliases 		# If like me you are in OSX you might have osx specific aliases. e.g. "brew" instead of "pacman"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac


# Uncomment below for zshrc on servers to have ssh attach to tmux sessions automatically
# tmux attach || tmux new


eval "$(zoxide init zsh)"

macchina # show terminal initial info with s splash of color
