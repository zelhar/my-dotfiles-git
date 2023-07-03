# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE="true"
#VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}««««««%f"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  stack
  #tmux
  #tmuxinator
  #tmux-cssh
  vi-mode
  themes
  web-search
  zsh-interactive-cd
  conda-zsh-completion
  rust
#  zsh_reload
)

source $ZSH/oh-my-zsh.sh

# User configuration

#History settings
HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=100000
export HISTFILE=~/.zhistory
setopt HIST_FIND_NO_DUPS
setopt inc_append_history
setopt share_history

#if [[ -z "${MANPATH}" ]]; then
  #MY_SCRIPT_VARIABLE="Some default value because DEPLOY_ENV is undefined"
#else
  #MY_SCRIPT_VARIABLE="${DEPLOY_ENV}"
#fi

#export MANPATH="/usr/local/man:$MANPATH"
#export MANPATH="$HOME/Downloads/manpages:$MANPATH"
if [[ -z "${INFOPATH}" ]]; then
    export INFOPATH="/usr/share/info:$INFOPATH"
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
   export VISUAL=vim
   export TERM=xterm
 else
#   export EDITOR='nvim'
   export EDITOR='vim'
#   export VISUAL=nvim
   export VISUAL=vim
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
########################################
#Zelhar's .zshrc
########################################
#export EDITOR=emacs
#export EDITOR=nvim
#export VISUAL=nvim
#export BROWSER=qutebrowser
export BROWSER=brave
#alias brave='brave --disk-cache-dir="/tmp/brave-cache"'
#export EDITOR="vim --remote-tab-silent "
#gvim () { command gvim --remote-tab-silent "$@" || command gvim "$@"; }
#vim () { command vim --remote-tab-silent "$@" || command vim "$@"; }
#export MANPAGER="nvim -M -c 'set ft=man' -c 'colorscheme slate' -"
export MANPAGER='nvim +Man!'
export PAGER=less
export MANWIDTH=80


# My Proxy Settings (for Privoxy):
#export http_proxy="http://127.0.0.1:8118"
# export https_proxy="https://127.0.0.1:8118"
# I chnaged it because drop_box_uploader didn't work with the https://...
#export https_proxy="http://127.0.0.1:8118"

#alias ssteam="LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' /usr/bin/steam"
alias ttmux="TERM=xterm-256color tmux"
#add '~/bin' to PATH.
#export PATH="$HOME/bin:$PATH"
if [[ ! $PATH =~ "$HOME/bin" ]]
then
    PATH=$HOME/bin:$PATH
    #node.js
    PATH="$HOME/node_modules/.bin:$PATH"
    # perl
    PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
    #add ~/.cabal/bin to $PATH
    PATH=~/.cabal/bin:$PATH
    #recommended by Haskell Stack
    PATH=$HOME/.local/bin:$PATH
    #PATH=$PATH:$HOME/.local/bin
    #Lua local installs
    PATH=$HOME/.luarocks/bin:$PATH
    PATH=$HOME/.ghcup/bin:$PATH
    #PATH=$PATH:$HOME/.ghcup/bin
    # add .cargo/bin for rust
    PATH=$HOME/.cargo/bin:$PATH
    export PATH
fi


#node.js settings
#PATH="$HOME/node_modules/.bin:$PATH"
export npm_config_prefix=~/node_modules

# not sure about that, I enabled for conda tab completion
#autoload -Uz compinit promptinit
#compinit
#promptinit
#autoload -Uz compinit
#compinit

# trying to fix kde issues with i3
#export QT_QPA_PLATFORMTHEME="qt5ct"

#FZF settings:
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

#Added by Perl/Cpan
#PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

#solves issue with gnome-terminal not starting
#dbus-update-activation-environment --all

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#updates xkeyboard every time
if [ $DISPLAY ]; then 
    source ~/bin/myxkeyboardsetting.sh
fi

#disable ctl-s (freezes screen, ctl-q to unfreeze)
stty -ixon

#Jupyter Notebook and Lab
#export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

alias ipython="ipython --no-autoindent --matplotlib --pylab --TerminalInteractiveShell.auto_match=0"
alias import="-0-0-0-0-0-0-0" #cancel this cpmmand which hangs the Xsystem
alias rscript="Rscript --no-init-file --slave"

# Charite ssh settings
# User specific aliases and functions
alias smii="watch nvidia-smi"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias gpu2="ssh kolby@172.16.120.171"
alias gpu="ssh kolby@172.16.120.170"

export PORT1=2622
export PORT2=2623
export PORT3=2624

# User configuration
alias prepgpu="ssh -v -N -L localhost:8888:localhost:$PORT1 bih-gpu"
alias prepgpu2="ssh -v -N -L localhost:8888:localhost:$PORT1 bih-gpu2"
alias prepgpu23="ssh -v -N -L localhost:8888:localhost:$PORT2 bih-gpu2"
alias prep23="ssh -v -N -L localhost:8888:localhost:$PORT1 bih-front"
alias prep24="ssh -v -N -L $PORT2:localhost:$PORT2 bih-front"
alias prep25="ssh -v -N -L $PORT3:localhost:$PORT3 bih-front"

#alias condact="conda activate test"
alias cytoscapefunfun="JAVA_HOME=/usr/lib/jvm/java-8-openjdk cytoscape"
# MY personal zsh plugins
#export MYPLUGINS="$HOME/.config/zsh/plugins"
#source "$MYPLUGINS/web-search/web-search.plugin.zsh"
alias cite="python ~/bin/scholar.py"


# R environment (for knime to work with Rserve)
export R_LIBS=$HOME/R/library

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zelhar/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zelhar/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/zelhar/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/zelhar/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

