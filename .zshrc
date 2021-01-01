# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=1000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

bindkey -v
bindkey '^R' history-incremental-search-backward

setopt autocd nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/razhan/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters
# End of lines added by compinstall
autoload -U zmv
autoload -U zcalc


#alias vim='nvim'
alias l='exa -Fhl --git'
alias la='exa -Fhla --git'
alias ls='exa -F'
alias lsa='exa -Fa'
alias cat='bat'
alias ga='git add'
alias gl='git pull'
alias gre='git reset'
alias gss='git status'
alias gck='git checkout'
alias gd='git diff'
alias gc='git commit -m'
alias gcam='git commit -am'
alias gp='git push'
alias copy='xclip -se c'
alias imgc='xclip -se c -t image/png -i'
alias on='optimus-manager --switch nvidia'
alias oi='optimus-manager --switch integrated'
alias os='optimus-manager --status'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '



# nvidia offloading variables
#export __NV_PRIME_RENDER_OFFLOAD=1 
#export __GLX_VENDOR_LIBRARY_NAME="nvidia"
#export __VK_LAYER_NV_optimus="NVIDIA_only"
#export __GL_SHOW_GRAPHICS_OSD=1 
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH=$HOME/go

export PATH="$PATH:/home/razhan/tools/flutter/bin"

_JAVA_AWT_WM_NONREPARENTING=1
