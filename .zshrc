# =================================================== #
#  ____     ___     ____
# /\_ ,`\ /' _ `\  /',__\
# \/_/  /_/\ \/\ \/\__, `\
#   /\____\ \_\ \_\/\____/
#   \/____/\/_/\/_/\/___/
#
# =================================================== #
# ----------- http://www.zestynotions.com ----------- # 
# =================================================== #

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Show current working directory breadcrumb and list files
 function chpwd() {
     emulate -L zsh
     clear
     exa -la --git --git-ignore --icons --color=always --group-directories-first
 }

# =================================================== #
# ------ Keybindings for FZFi/skim functions -------- # 
# =================================================== #

bindkey ^e jump2dotfile # Ctrl + e = search file and edit.
zle -N jump2dotfile{,}

bindkey ^j jump2zoxide # Ctrl + j = search folder and cd.
zle -N jump2zoxide{,}

# =================================================== #
# ---------- search/edit/jump focused --------------- # 
# =================================================== #

# Find and edit a textfile using nvim from dotfiles
function jump2dotfile() {
  fd --type f --search-path ~/ --hidden --ignore-file ~/.config/bin/searchexcludes | sk --reverse --height=90% --margin=5% --border --prompt='Edit:' --color='16,border:135,spinner:208' --preview='bat {}'|xargs nvim
}

# Find an jump to folder location in zoxide
function jump2zoxide() {
  PATH_RESULT=$(zoxide query -l|sk --reverse --height=90% --margin=5% --border --prompt='Jump to: ' --color='16,border:135,spinner:208' --preview='exa -a --tree --level=1 {}')
  cd "$PATH_RESULT"
}

# =================================================== #
# ============ Search_and_kill process ============== #
# =================================================== #

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
source "$HOME/.cargo/env"

# =================================================== #
# ====== Needed for Sway Tiling Window Manager ====== #
# =================================================== #
export XDG_RUNTIME_DIR='/tmp'
export WLR_NO_HARDWARE_CURSORS='1'
export LIBINPUT_NO_DEVICES='1'


# =================================================== #
# ------------- Aliases ----------------------------- #
# =================================================== #
alias resetzns='sh <(wget -qO- https://zns.one/rc)' # CAUTION!! Grab github dotfiles and overwrite existing CAUTION!!
alias ZZ=''           # Error handling for when exititing nvim times 2 by mistake.
alias cs='cht.sh $1' 	# Cheatsheet for man page alternative. e.g. "cs rsync" 
alias v='nvim' 				# Another alias for Neovim 
alias vim='nvim' 			# Another alias for Neovim
alias a='show_shortcuts' # List all aliases
alias du='duf'        # show mounts and disk usage
alias qq='search_and_kill' # search_and_kill process
alias n='notetaker'       # script for taking notes
alias p='clear; ping -c 3 google.com' # ping google 3 timers and exit
alias j='jump2zoxide'     # script for jumping between folders from zoxide
alias gj='jump2folder'       # script for jumping between folder
alias fn='searchnotes'    # Jump to Icloud Note folder and open nvim
alias e='jump2dotfile' # Find and edit file in nvim from dotfiles
alias ge='jump2file'       # Find and edit file in nvim
alias q='exit' 				    # Exits the terminal (Quit)
alias gc='git_commit'     # git commit all with message and push
alias Q='exit' 				    # Exits the terminal (Quit)
alias ...='cd ../.. '     # Go up 2 levels
alias ..='cd .. '         # Go up 1 levels
alias fg=''fg'' 		      # Bring back a process that was in the background
alias t='tmux attach||tmux new' # Attach to existing tmux session or start a new tmux session
alias i='clear; macchina'          # runs macchina terminal splash
alias ll='clear; exa -la --icons --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa
alias lt='clear; exa --tree --level=1 --icons --group-directories-first' # show tree view
alias ls='clear; exa -la --icons --git --git-ignore --color=always --group-directories-first' 	# List all directory contents using exa
alias cat='bat -p'        # cat -> bat
alias bat='bat -p'        # bat -> bat -plain files
alias b='bat -p $1'       # bat show file as plain file 
alias ve='espanso edit'             # Start Neovim with espanso config
alias vz='nvim ~/.zshrc' 		        # Edit zsh config (this file) in Neovim
alias sz='source ~/.zshrc'          # source the zsh config file

# --------- Pracical stuff ----------------
alias o='open .'           			# Open folder in finder
alias sv='brew services restart yabai'  # Restart the Yabai tiling window manager
alias ek='nvim ~/.config/skhd/skhdrc'   # Edit the keyboard shortcut deamon
alias ey='nvim ~/.config/yabai/yabairc' # Edit the Yabai WM config
alias uu='update_apps'                  # uu vim --> will install vim on debian, arch, alpine and mac
alias rb='reboot_sys'                # Will reboot the system 
alias ip="ifconfig | grep 'inet '"      # Show ip address 

# =================================================== #
# ----------------- Git .config magic --------------- #
# =================================================== #

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 		# prefix for git to handle my dotfiles
alias cfgl='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME log --oneline' # show git log in one line for the dotfiles
alias cfgc='cfg_commit'                            # Simplified commit all and push for dotfiles 
alias gc='git_commit'                            # Simplified commit all and push for dotfiles 


# =================================================== #
# ----------------- Source Other -------------------- #
# =================================================== #

source ~/private_aliases 		# Create and add your private aliases in this file
source ~/.config/bin/reboot_sys
source ~/.config/bin/update_apps


pfetch # can also use "macchina"" to show terminal initial info with splash of color
