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
     eza -la --git --git-ignore --icons --color=always --group-directories-first
 }

# =================================================== #
# ------ Keybindings for FZF /skim functions -------- #
# =================================================== #

bindkey ^e jump2dotfile # search file and edit.
zle -N jump2dotfile{,}

bindkey ^j jump2zoxide # search folder and cd.
zle -N jump2zoxide{,}

# Ctrl + r = search history with fzf
# Ctrl + e = search and edit file
# Ctrl + j = search and cd to folder
#
# =================================================== #
# ---------- search/edit/jump focused --------------- #
# =================================================== #

# Find and edit a textfile using nvim from dotfiles
function jump2dotfile() {
  fd --type f --search-path ~/ --hidden --ignore-file ~/.config/bin/searchexcludes | sk --reverse --height=90% --margin=5% --border --prompt='Edit:' --color='16,border:135,spinner:208' --preview='bat {}'|xargs nvim
}

# Find an jump to folder location in zoxide
function jump2zoxide() {
  PATH_RESULT=$(zoxide query -l|sk --reverse --height=90% --margin=5% --border --prompt='Jump to: ' --color='16,border:135,spinner:208' --preview='eza -a --tree --level=1 {}')
  cd "$PATH_RESULT"
}

# =================================================== #
# ============ Find_and_kill process ================ #
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
source "$HOME/.cargo/env" # added for Rust integration

# =================================================== #
# ====== Needed for Sway Tiling Window Manager ====== #
# ========= Only needed for if you use Linyx ======== #
# =================================================== #
export XDG_RUNTIME_DIR='/tmp'
export WLR_NO_HARDWARE_CURSORS='1'
export LIBINPUT_NO_DEVICES='1'


# =================================================== #
# ------------- Aliases ----------------------------- #
# =================================================== #
alias resetzns='sh <(wget -qO- https://zns.one/rc)' # CAUTION!! Grabs github dotfiles and overwrite existing CAUTION!!
alias ZZ=''           # Error handling for when exititing nvim times 2 by mistake.
alias v='nvim' 				# Another alias for Neovim
alias vim='nvim' 			# Another alias for Neovim
alias a='show_shortcuts' # List all aliases
alias help='show_shortcuts' # List all aliases
alias du='duf'        # show mounts and disk usage
alias fp='search_and_kill' # find_and_kill process
alias n='notetaker'       # script for taking notes and add to obsidian vault
alias p='clear; ping -c 3 google.com' # ping google 3 timer and exit
alias j='jump2zoxide'     # script for jumping between folders from zoxide, ctrl+j also works
alias fn='findnotes'    # Jump to Icloud Note folder and open nvim
alias vd='jump2dotfile' # Find and edit file in nvim from dotfiles
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
alias cat='bat -p'        # cat -> bat
alias bat='bat -p'        # bat -> bat -plain files
alias b='bat -p $1'       # bat show file as plain file
alias ve='espanso edit'             # Start Neovim with espanso config
alias vz='nvim ~/.zshrc' 		        # Edit zsh config (this file) in Neovim
alias sz='source ~/.zshrc'          # source the zsh config file

# --------- Pracical stuff ----------------
alias e='yazi'               # Rust based ranger clone
alias uu='update_apps'       # uu vim --> will updatre all apps on debian, arch, alpine and mac
alias ii='install_apps'      # ii vim --> will install vim on debian, arch, alpine and mac
alias rb='reboot_sys'        # Will reboot the system
alias ip="ifconfig | grep 'inet '"      # Show ip address

# --------- MAC OS brew Pracical stuff ----------------
alias sv='brew services restart yabai'  # Restart the Yabai tiling window manager
alias vk='nvim ~/.config/skhd/skhdrc'   # Edit the keyboard shortcut deamon
alias vy='nvim ~/.config/yabai/yabairc' # Edit the Yabai WM config
alias o='open .'           			# Open folder in finder

# --------- NixOS Pracical stuff ----------------
alias nc='sudo nix-collect-garbage --delete-older-than 10d sudo nixos-rebuild switch && sudo reboot'  # clean older packages rebuild and Restart
alias ui='hyprland'
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

source ~/private_aliases 		# Create and add your private aliases in this file
source ~/.config/bin/sysmanage

# Activate syntax highlighting
source /opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

pfetch # can also use "macchina"" to show terminal initial info with splash of color
