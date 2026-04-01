# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Path & Environment Initialization ---
export ZSH="$HOME/.oh-my-zsh"

# Load local environment scripts
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# --- Oh My Zsh Configuration ---
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enhanced plugins for Software Engineering productivity
plugins=(
  # Version Control
  git
  git-extras
  git-flow
  
  # Productivity & Navigation
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  z
  
  # Programming Languages & Tools
  docker
  docker-compose
  kubectl
  python
  pip
  poetry
  node
  npm
  yarn
  
  # System & Utilities
  history
  colored-man-pages
  command-not-found
)

# FZF - Load manually if installed
if command -v fzf &> /dev/null; then
  export FZF_BASE="$(which fzf)"
  plugins+=(fzf)
fi

source $ZSH/oh-my-zsh.sh

# --- User Custom Variables ---

# CUDA & Library Paths
export LD_LIBRARY_PATH="/usr/local/cuda-12.5/lib64:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"

# OpenCode Configuration (LOCAL VLLM)
# Config is at ~/.opencode/opencode.json
export PATH="$HOME/.opencode/bin:$PATH"

# Golang Configuration
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# fnm - Fast Node Manager
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# =============================================================================
# SOFTWARE ENGINEERING PRODUCTIVITY ENHANCEMENTS
# =============================================================================

# -----------------------------------------------------------------------------
# FZF - Fuzzy Finder (Critical for productivity)
# -----------------------------------------------------------------------------
# Only configure fzf if it's installed
if command -v fzf &> /dev/null; then
  # Use fzf for command history search
  bindkey '^R' history-incremental-search-backward
  bindkey '^F' history-incremental-search-forward

  # Enable fzf-tab for fuzzy completion
  zstyle ':fzf-tab:*' continuous-trigger '/'
  zstyle ':fzf-tab:*' fzf-command fzf
  zstyle ':fzf-tab:*' default-color $'\033[37m'
  zstyle ':fzf-tab:*' query-color $'\033[31m'
  zstyle ':fzf-tab:*' prefix-color $'\033[33m'

  # fzf completion keybindings
  bindkey '^I' fzf_completion
fi

# -----------------------------------------------------------------------------
# Enhanced History Configuration
# -----------------------------------------------------------------------------
export HISTSIZE=100000           # Large history size
export SAVEHIST=100000          # Save that many history entries
export HISTFILE="$HOME/.zsh_history"
export HIST_STAMPS="yyyy-mm-dd"  # Timestamp format

# Better history handling
setopt SHARE_HISTORY            # Share history between sessions
setopt HIST_IGNORE_ALL_DUPS     # Don't save duplicate commands
setopt HIST_IGNORE_SPACE       # Don't save commands starting with space
setopt HIST_REDUCE_BLANKS       # Remove extra blanks from history
setopt HIST_VERIFY              # Show command before executing history expansion
setopt APPEND_HISTORY           # Append to history (don't overwrite)
setopt INC_APPEND_HISTORY       # Add commands to history immediately

# -----------------------------------------------------------------------------
# Enhanced Completion
# -----------------------------------------------------------------------------
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=*' 'r:|=*' 'l:|=*'
# Complete with menu selection
zstyle ':completion:*' menu select
# Show completions with colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Ignore completion for commands we don't have
zstyle ':completion:*:commands' ignored-patterns '_*'
# Group completions by type
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# -----------------------------------------------------------------------------
# Vi Mode Improvements
# -----------------------------------------------------------------------------
# Use vi mode
bindkey -v
# Fix backspace in vi mode
export KEYTIMEOUT=1

# Better vi mode navigation
bindkey -a 'h' vi-backward-char
bindkey -a 'l' vi-forward-char
bindkey -a 'j' vi-down-line-or-history
bindkey -a 'k' vi-up-line-or-history

# Escape to normal mode
bindkey '^J' vi-digit-or-end-of-line
bindkey '^[' vi-cmd-mode

# -----------------------------------------------------------------------------
# Directory Navigation
# -----------------------------------------------------------------------------
# Auto-CD - cd to directories without typing cd
setopt AUTO_CD
# Auto-pushd - automatically push directories onto the stack
setopt AUTO_PUSHD
# Don't duplicate entries in pushd
setopt PUSHD_IGNORE_DUPS
# Use ls after cd
setopt AUTO_LIST

# -----------------------------------------------------------------------------
# Global Aliases (type anywhere in command line)
# -----------------------------------------------------------------------------
alias -g L='| less'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g LL='| less -R'
alias -g CA='| cat'
alias -g NUL='> /dev/null 2>&1'
alias -g RED='&>/dev/null'

# -----------------------------------------------------------------------------
# Development Aliases
# -----------------------------------------------------------------------------

# Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate -20'
alias gb='git branch'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gst='git stash'
alias gsp='git stash pop'
alias gss='git stash show'
alias gsa='git stash apply'

# Docker shortcuts
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dprune='docker system prune -af'
alias dstop='docker stop $(docker ps -q)'

# Kubernetes shortcuts
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kga='kubectl get all'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias klf='kubectl logs -f'
alias kex='kubectl exec -it'

# Python/uv shortcuts
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias act='source ./venv/bin/activate'

# Node shortcuts
alias n='npm'
alias ni='npm install'
alias nr='npm run'
alias nd='npm run dev'
alias nb='npm run build'
alias nt='npm run test'
alias nw='npm run watch'

# Rust
alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'
alias ccheck='cargo check'
alias cfmt='cargo fmt'

# Go
alias gor='go run .'
alias gob='go build .'
alias got='go test ./...'
alias gofmt='go fmt ./...'

# Tmux shortcuts
alias tm='tmux'
alias tma='tmux attach -t'
alias tml='tmux list-sessions'
alias tmn='tmux new -s'

# Utility shortcuts
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree -L 2 -a'
alias hist='history'
alias h='history'

# Network utilities
alias ping='ping -c 5'
alias wget='wget -c'

# Quick navigation
alias home='cd ~'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias ws='cd ~/Workspace'

# ----------------------------------------------------------------------
# Development Functions
# ----------------------------------------------------------------------

# Create a new directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find file by name
ff() {
  find . -type f -iname "*$1*" 2>/dev/null
}

# Find text in files
fg() {
  if [ -z "$1" ]; then
    echo "Usage: fg <pattern> [path]"
    return 1
  fi
  local path="${2:-.}"
  rg --smart-case --hidden -l "$1" "$path" 2>/dev/null
}

# Kill process by name
kp() {
  pkill -9 -f "$1" 2>/dev/null || echo "No process found: $1"
}

# Docker cleanup
dclean() {
  echo "Stopping all containers..."
  docker stop $(docker ps -aq) 2>/dev/null
  echo "Removing all containers..."
  docker rm $(docker ps -aq) 2>/dev/null
  echo "Removing all images..."
  docker rmi $(docker images -q) 2>/dev/null
  echo "Cleaning up volumes..."
  docker volume prune -f 2>/dev/null
  echo "Done!"
}

# Quick Python HTTP server
serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

# Git: Show untracked files as a tree
glt() {
  git log --oneline --graph --decorate -20
  echo ""
  echo "Untracked files:"
  git ls-files --others --exclude-standard | xargs -I{} echo "  ? {}"
}

# Git: Quick commit all changes with message
gcommit() {
  git add -A && git commit -m "$1"
}

# Git: Undo last commit (keep changes)
gundo() {
  git reset --soft HEAD~1
}

# Kubernetes: Port forward
kpf() {
  local pod="$1"
  local port="$2"
  kubectl port-forward "$pod" "$port:$port"
}

# Kubernetes: Quick pod logs
klogs() {
  local pod="$1"
  local container="${2:-}"
  if [ -n "$container" ]; then
    kubectl logs -f "$pod" -c "$container"
  else
    kubectl logs -f "$pod"
  fi
}

# ----------------------------------------------------------------------
# Environment Optimizations
# ----------------------------------------------------------------------

# Enable color support
export CLICOLOR=1

# Set editor
export EDITOR=vim
export VISUAL=vim

# Less colors
export LESS='-R -i -w -M -z-4'

# Increase terminal scrollback
export TERM=xterm-256color

# Faster tab completion (disable automatic updates)
DISABLE_AUTO_UPDATE="true"

# Better less colors for man pages
export MANPAGER="less -R"

# =============================================================================
# Final Touches - Powerlevel10k Configuration
# =============================================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias to check if vLLM is running
alias vllm-check="curl http://localhost:8000/v1/models"
# Alias to watch vLLM logs
alias vllm-logs="docker compose -f $HOME/Documents/Local_Vllm/docker-compose.yml logs -f"

# --- Local VLLM Configuration ---
# Config is at ~/.opencode/opencode.json
# Auth is at ~/.local/share/opencode/auth.json

# =============================================================================
# Load additional local configurations if they exist
# =============================================================================
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# MultiExec
export PATH="$HOME/.multiexec:$PATH"
alias multiexec='$HOME/.multiexec/multiexec'
