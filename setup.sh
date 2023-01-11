#! /bin/bash

setup () {
    echo
    echo "Setting up $2"
    STASH="$2_stashed"
    HAD_OLD=false
    {
        if [ -e "$2" ]; then
            mv "$2" "$STASH"
            echo "✅ Stashed existing $2 to $STASH"
            HAD_OLD=true
        else 
            echo "ℹ️ No old configuration file $2 to stash"
        fi
    } || echo "ℹ️ No old configuration file $2 to stash"
    {
        ln -s $PWD/$1 "$2"
        echo "✅ Created link $PWD/$1 -> $2"
        if [ "$HAD_OLD" = true  ]; then
            {
                rm -rf "$STASH"
                echo "✅ Removed old $STASH"
            } || echo "❌ Failed to remove stahed old file $STASH"
        fi
    } || echo "❌ Failed to create link $PWD/$1 -> $2"
    
}

setup nvim $HOME/.config/nvim # neovim
setup tmux/tokyonight.conf $HOME/.tmux.conf # tmux
setup vrapper/vrapperrc $HOME/.vrapperrc # vrapper
if [[ $OSTYPE == "darwin"* ]]; then
    setup vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json # vscode for mac
else 
    setup vscode/settings.json $HOME/.config/Code/User/settings.json # vscode for linux
fi
