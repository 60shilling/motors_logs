
# set default editor to nvim
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=/home/linux/.local/share/neovim/bin/nvim

# path to my custom funcs, single and aggregated completions
fpath=(/home/linux/.zfunctions ~/.config/zsh_funcs ~/.zsh/completion ~/.zsh_completions/zsh-completions/src $fpath)

# set nvm environs and load
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# zsh-nvm, source and config
# source ~/.zsh_nvm/zsh-nvm.plugin.zsh

# auto suggestions
# source ~/.zsh/zsh_suggests/zsh-autosuggestions.zsh

# set brew environment 
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# jekyll env
export GEM_HOME="$HOME/gems"

export PATH=/usr/bin:/snap/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/neovim/bin:$PATH
export PATH=/home/linux/Applications:/home/linux/.local/share:$PATH
# export PATH=$HOME/.luarocks/share/lua/5.1/?.lua:$PATH
eval $(luarocks path)

# don't make too small or doesn't work
export KEYTIMEOUT=5
export CHEATCOLORS=true
export CHEAT_CONFIG_PATH=~/snap/cheat/common/.config/cheat/conf.yml


autoload run-help

# for my funcs in .config/zsh_funcs autoload them all
autoload -- ~/.config/zsh_funcs/[^_]*(:t)

#colors
autoload -U colors
colors

#export LS_COLORS="$(vivid generate gruvbox-dark)"
#export LS_COLORS="$(vivid generate gruvbox-dark-soft)"
#export LS_COLORS="$(vivid generate gruvbox-dark-hard)"
#export LS_COLORS="$(vivid generate iceberg-dark)"
#export LS_COLORS="$(vivid generate jellybeans)"
export LS_COLORS="$(vivid generate molokai)"
#export LS_COLORS="$(vivid generate nord)"
#export LS_COLORS="$(vivid generate snazzy)"

setopt histignorealldups sharehistory

bindkey -v

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# case insensetive auto complete
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# bindkey -s '^o' 'ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"\n'

# alias section
source ~/.zsh_aliases/git_aliases
# alias ls='nnn -edH'
alias opera='flatpak run com.opera.Opera'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# alias l='ls -lah --color=auto'
alias l='exa -al'
alias tree='exa --tree -a -L 3'
alias cat='batcat --theme="Solarized (light)"'
alias fd='fdfind --color=auto'
alias vi='nvim.appimage'
alias nvim='nvim.appimage'
alias view='nvim -R'
alias htop='TERM=xterm-256color htop'
alias rnr=". ranger"
alias tnu='tmux new'
alias lg='lazygit'


# edit command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# zsh command line fast syntax highlighting
source ~/repos_github/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

bindkey -s '^f' '^t'


autoload -U promptinit; promptinit
SPACESHIP_DIR_TRUNC=6
prompt spaceship
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_PROMPT_SUFFIXES_SHOW=true

# below was a fix for spaceship not changing prompt on mode change
eval spaceship_vi_mode_enable

# make path entries unique
declare -U path

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/linux/google-cloud-sdk/path.zsh.inc' ]; then . '/home/linux/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/linux/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/linux/google-cloud-sdk/completion.zsh.inc'; fi

export GOPATH=/home/linux/go

export PATH=$PATH:/home/linux/go/bin

fpath+=~/.zfunc

[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

