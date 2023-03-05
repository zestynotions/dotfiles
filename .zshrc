#===========================================================
#  ____     ___     ____
# /\_ ,`\ /' _ `\  /',__\
# \/_/  /_/\ \/\ \/\__, `\
#   /\____\ \_\ \_\/\____/
#   \/____/\/_/\/_/\/___/
#
# http://www.zestynotions.com 
#===========================================================   

# setopt PROMPT_SUBST
PROMPT='%F{red}${vcs_info_msg_0_}%f %F{135} ∲ %f %F{82}» %f'

# if you hit ESC while writing a command you can edit the command with vim commands
# set -o vi   

eval "$(starship init zsh)"

icloudFolder="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
obsidianFolder="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/zns"

# =================================================== #
# -------- Keybindings for FZF functions ------------ # 
# =================================================== #

bindkey ^e skjump_edit
zle -N skjump_edit{,}

bindkey ^f skjump
zle -N skjump{,}

# =================================================== #
# ------------- FZF functions ----------------------- # 
# =================================================== #

# Show current working directory breadcrumb and list files
function chpwd() {
     emulate -L zsh
     pwd; exa -la --git --git-ignore --color=always --group-directories-first
 }

# Search home dir for files in nvim
function searchhomedir() {
  cd $icloudFolder
  nvim -c "Telescope find_files"
}

# Get to notes fast
function searchnotes() {
  cd $obsidianFolder
  nvim -c "set wrap" \
       -c "Telescope find_files"
}

function searchconfigs() {
  cd ~/.config
  nvim -c "Telescope find_files"
}

# =================================================== #
# ------------- Defaults ----------------------------------
# =================================================== #
export EDITOR='nvim'
export BROWSER='brave'
export TERMINAL='alacritty'

# export FZF_DEFAULTS_COMMAND='fd --color=never'
export FZF_TMUX_OPTS='-p'
export LC_ALL='en_US.UTF-8'  
export LANG='en_US.UTF-8'
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH=$PATH:/usr/local/bin:~/.config/bin:~/.local/bin:~/.cargo/bin
export MANPAGER="sh -c 'col -bx|bat -l man -p'" # Use bat to show man pages
export WLR_LIBINPUT_NO_DEVICES=1


# =================================================== #
# ------------- Aliases ----------------------------- #
# =================================================== #

alias ZZ=''           # Error handling for when I exit nvim times 2 by mistake.
alias cs='cht.sh $1' 	# Cheatsheet for man page alternative. e.g. "cs rsync" 
alias v='nvim' 				# Another alias for Neovim 
alias vim='nvim' 			# Another alias for Neovim
alias a='show_shortcuts' # List all aliases
alias du='duf'        # show mounts and disk usage

# -----------  unify all fzf + edit to become cd to dir and nvim
alias n='notetaker'       # script for taking notes
alias p='clear; ping -c 3 google.com' # ping google 3 timers and exit
alias j='clear; skjump'       # script for jumping between folder
alias e='clear; skjump_edit'  # script for jumping to folder and open telescope in nvim from there
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
alias i='clear; pfetch'          # runs pfetch terminal splash
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
alias vd='searchhomedir' 		        # Open nvim and telescope for files in home dir
alias vc='searchconfigs'            # Open nvim and telescope to config file

# ----------------- Source Other --------------------------
source ~/.config/alacritty/prv_aliases 		# Create and add your private aliases in this file
source ~/.config/bin/fuzzyjump                  # Jump folder script
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


# Un-comment below for zshrc on servers to have ssh attache to tmux sessions automatically
# tmux attach || tmux new


eval "$(zoxide init zsh)"

pfetch # show terminal initial info with s splash of color
