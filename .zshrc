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

# setopt CORRECT 
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Show current working directory breadcrumb and list files
 function chpwd() {
     emulate -L zsh
     clear
     eza -la --git --git-ignore --icons=always --color=always --group-directories-first
 }

# Start Yazi with a shell wrapper that provides the ability to change the current working directory when exiting Yazi.
 function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# =================================================== #
# ------ Keybindings for FZF /skim functions -------- #
# =================================================== #

 # search dotfile and edit.
alias ed='editdotfile'
function editdotfile() {
  cd $HOME/.config
  sk --reverse --margin=3% --prompt='Edit in Nvim: ' --preview='bat --style=numbers --color=always {}' | xargs nvim
 }


# search and cd to folder
alias j='jump2zoxide'
function jump2zoxide() {
   PATH_RESULT=$(zoxide query -l|sk --reverse --margin=3% --prompt='Jump to directory: ' --preview='eza -a --tree --color=always --icons=always --level=1 {}')
   cd "$PATH_RESULT"
 }


# =================================================== #
# ============ Find_and_kill process ================ #
# =================================================== #

alias kp='search_and_kill'
function search_and_kill() {
procs -t |sk --reverse |awk '{print $2}'|xargs kill -9
}

# =================================================== #
# ============ Make a backup of a file ============== #
# =================================================== #

alias bk='copy_rename_backup'
function copy_rename_backup() {
  if [ $# -eq 1 ]
then
 cp -pvi "$1" "${1}.bak"
fi
chpwd
}

# =================================================== #
# ------------- Defaults ---------------------------- #
# =================================================== #

export EDITOR='nvim'
export BROWSER='brave'
export TERMINAL='wezterm'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export PATH=$PATH:/usr/local/bin:~/.config/bin:~/.local/bin
export MANPAGER="sh -c 'col -bx|bat -l man -p'" # Use bat to show man pages

# =================================================== #
# ------------- Aliases ----------------------------- #
# =================================================== #

alias e='yazi'               # Rust based file explorer
alias vx='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias resetzns='sh <(wget -qO- https://zns.one/rc)' # CAUTION!! Grabs github dotfiles and overwrite existing CAUTION!!
alias ZZ=''           # Error handling for when exititing nvim times 2 by mistake.
alias v='nvim' 				# Another alias for Neovim
alias vim='nvim' 			# Another alias for Neovim
alias a='show_shortcuts' # List all aliases
alias help='show_shortcuts' # List all aliases
alias du='duf'        # show mounts and disk usage
alias w="clear; curl v2.wttr.in/tokyo" #show Tokyo weater forecast for the nest 3 days
alias fp='search_and_kill' # find_and_kill process
alias dn='daynotetaker'       # script for taking dailynotes and add to obsidian vault
alias sn='solnotetaker'       # script for taking solitarynotes and add to obsidian vault
alias p='clear; ping -c 3 google.com' # ping google 3 timer and exit
alias fn='findnotes'    # Jump to Icloud Note folder and open nvim
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
alias sz='source ~/.zshrc' # source the zsh config file
alias ip="ifconfig | grep 'inet '"      # Show ip address

# --------- OS agnostic commands ----------------
alias uu='update_apps'       # uu --> will update all apps on debian, arch, alpine and mac
alias ii='install_apps'      # 'ii vim' --> will install vim on debian, arch, alpine and mac
alias rb='reboot_sys'        # Will reboot the system

# --------- MAC OS stuff ------------------------
alias ry='brew services restart yabai'  # Restart the Yabai tiling window manager
alias es='nvim ~/.config/skhd/skhdrc'   # Edit the keyboard shortcut deamon
alias ey='nvim ~/.config/yabai/yabairc' # Edit the Yabai WM config
alias o='open .'           			# Open folder in finder

# --------- NixOS stuff -------------------------
alias nr='sudo nixos-rebuild switch'  # rebuild and Restart
alias ui='hyprland'
alias en='sudo nvim /etc/nixos/configuration.nix'               # Edit nix conf file
alias sd='sudo shutdown -h now'

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

# Create and add your private shortcuts in this file
if [ -f "$HOME/private.sh" ]; then
source $HOME/private.sh
fi

source ~/.config/bin/sysmanage

pfetch # can also use "macchina"" to show terminal initial info with splash of color
