#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser
export MANPAGER="nvim -c 'set ft=man' -c 'colorscheme slate' -"
export PAGER="less"
PATH=$HOME/bin:$PATH
#add ~/.cabal/bin to $PATH
PATH=~/.cabal/bin:$PATH
#recommended by Haskell Stack
PATH=$HOME/.local/bin:$PATH
export PATH

#node.js settings
PATH="$HOME/node_modules/.bin:$PATH"
export npm_config_prefix=~/node_modules

#Added by Perl/Cpan
PATH="/home/zelhar/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/zelhar/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/zelhar/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/zelhar/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/zelhar/perl5"; export PERL_MM_OPT;

#solves issue with gnome-terminal not starting
#dbus-update-activation-environment --all
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#updates xkeyboard every time
if [ $DISPLAY ]; then 
    source ~/bin/myxkeyboardsetting.sh
fi

#Jupyter Notebook and Lab
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=100000
export HISTFILE=~/.bash_history
#setopt HIST_FIND_NO_DUPS
#setopt inc_append_history
#setopt share_history
#
#alias brave='brave --disk-cache-dir="/tmp/brave-cache"'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zelhar/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

. "$HOME/.cargo/env"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/zelhar/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/zelhar/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/zelhar/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/zelhar/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/zelhar/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
