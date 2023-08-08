. "$HOME/.cargo/env"
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
