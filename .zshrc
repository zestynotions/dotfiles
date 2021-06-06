#===========================================================
#  ____     ___     ____
# /\_ ,`\ /' _ `\  /',__\
# \/_/  /_/\ \/\ \/\__, `\
#   /\____\ \_\ \_\/\____/
#   \/____/\/_/\/_/\/___/
#
# http://www.zestynotions.com 
#===========================================================   
# Git branch in prompt

# Load version control information
autoload -Uz add-zsh-hook vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{red}${vcs_info_msg_0_}%f %F{122} ∲ ❯ %f'



LANG='en_US.UTF-8'
set -o vi

# defaults
export EDITOR='nvim'
export BROWSER='brave'
export TERMINAL='alacritty'
export LANG
export PATH=$PATH:/usr/local/bin:~/.config/bin
export MANPAGER="sh -c 'col -bx|bat -l man -p'" # Use bat to show man pages

alias cs='cht.sh $1' 		# Cheatsheet for man page alternative. e.g. "cs rsync" 
alias v='nvim' 				# Another alias for Neovim 
alias o='open $1'           # Open folder in finder
alias vim='nvim' 			# Another alias for Neovim
alias a='sh show_shortcuts' # List all aliases
alias f='br -dp ~/'         # Find files, hit f + enter and start typing
alias n='nnn ~/'  			# Start the nnn CLI filemanager
alias q='exit' 				# Exits the terminal (Quit)
alias fg='zns_header' 		# Use this to create the asci 3d headers e.g. "fg zns"
alias t='tmux attach' 		# Attaches any existing tmux sessions 
alias i='uname_info_figlet'	# This calls the greeting message for the terminal on open, hostname, type and time + date.

# GIT specific aliases
alias gcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gp='git pull' # Get latest changes from github
alias ga='git add $1'
alias gc='git commit -m "$1"'
alias gp='git push'

# This adds a two-character column indicating the staged and unstaged statuses respectively.  The status character can be `-' for not modified, `M' for a modified file, `N' for a new file, `D' for deleted, `R' for renamed, `T' for type-change, `I' for ignored,  and  `U'  for conflicted.
alias gl='pwd; exa -la --git-ignore --git --color=always --group-directories-first' 		# List directory contens using exa (no hidden files)

# List files instead of using "ls"
alias ll='pwd; exa -la --color=always --group-directories-first' 	# List all directory contents using exa
alias l='pwd; exa -l --color=always --group-directories-first' 		# List directory contens using exa (no hidden files)

# Edit .configs
alias ec='cd ~/.config/ ; nvim' # Start Neovim with base in the .config directory
alias ez='nvim ~/.zshrc' 		# Edit zsh config file

# ===============================================
# Source other files 
# ===============================================
source ~/.config/bin/git-prompt.sh          # adding git functionality to the zsh prompt
source ~/.config/aliases/prv_aliases 		# Add private aliases in this file to keep seperate from file that might get pushed to www
source ~/.config/aliases/osx_aliases 		# If like me you are in OSX you might have osx specific aliases. e.g. "brew" instead of "pacman"
source ~/.config/nnn/config 				# Exported variables for nnn filemanager
source ~/.config/bin/func                   # Source the functions a generally use

uname_info_figlet | lolcat                  # show prompt initial info
