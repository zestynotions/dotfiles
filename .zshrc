#===========================================================
#  ____     ___     ____
# /\_ ,`\ /' _ `\  /',__\
# \/_/  /_/\ \/\ \/\__, `\
#   /\____\ \_\ \_\/\____/
#   \/____/\/_/\/_/\/___/
#
# http://www.zestynotions.com 
#===========================================================   

# Load version control information
autoload -Uz add-zsh-hook vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{red}${vcs_info_msg_0_}%f %F{122} ∲ ❯❯ %f'

# if you hit ESC while writing a command you can edit the command with vim commands
set -o vi   

# ---------------------------------------------------------
# defaults
export EDITOR='nvim'
export BROWSER='brave'
export TERMINAL='alacritty'
export LC_ALL='en_US.UTF-8'  
export LANG='en_US.UTF-8'
export PATH=$PATH:/usr/local/bin:~/.config/bin
export MANPAGER="sh -c 'col -bx|bat -l man -p'" # Use bat to show man pages
# ---------------------------------------------------------
alias ZZ=''                 # Error handling for when I exit nvim times 2 by mistake.
alias cs='cht.sh $1' 		# Cheatsheet for man page alternative. e.g. "cs rsync" 
alias v='nvim' 				# Another alias for Neovim 
alias vim='nvim' 			# Another alias for Neovim
alias a='sh show_shortcuts' # List all aliases
alias f='br ~/ ;ll'         # Search from Home directory
alias fc='br ~/.config/ ;ll'# search from config directory '+e' opens file in editor
alias q='exit' 				# Exits the terminal (Quit)
alias ...='cd ../..'        # Go up 2 levels
alias fg='zns_header' 		# Use this to create the asci 3d headers e.g. "fg zns"
alias t='tmux' 	        	# Starts a tmux session
alias ta='tmux attach' 		# Attaches any existing tmux sessions 
alias i='uname_info_figlet'	# This calls the greeting message for the terminal on open, hostname, type and time + date.
alias ll='pwd; exa -la --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa

# ---------------------------------------------------------
# GIT specific alias for the bare repo I use to manage my dotfiles in ~/.cfg
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 		# prefix for git to handle my dotfiles
alias cfgl='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME log --oneline' # show git log in one line for the dotfiles
alias cfgc='git_commit'                            # Simplified commit all and push for dotfiles 

# ---------------------------------------------------------
# Edit .configs
alias ec='cd ~/.config/ ; nvim' # Start Neovim with base in the .config directory makes if faster to find files
alias ez='nvim ~/.zshrc' 		# Edit zsh config (this file) in Neovim

# ===============================================
# Source other files 
# ===============================================
source ~/.config/bin/git-prompt.sh          # adding git functionality to the zsh prompt
source ~/.config/aliases/prv_aliases 		# Create and add your private aliases in this file
source ~/.config/aliases/osx_aliases 		# If like me you are in OSX you might have osx specific aliases. e.g. "brew" instead of "pacman"
source ~/.config/bin/func                   # Source the functions I generally use
source $HOME/Library/Application\ Support/org.dystroy.broot/launcher/bash/br # Find tool writtin in rust for searching files and directories fast
. /usr/local/etc/profile.d/z.sh             # sourcing the Z program for fast user switching

uname_info_figlet | lolcat                  # show terminal initial info with s splash of color


