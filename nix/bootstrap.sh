#!/bin/bash
set -eu

case $0 in
    /*|~*)
        SCRIPT_INDIRECT="$(dirname "$0")"
        ;;
    *)
        PWD="`pwd`"
        SCRIPT_INDIRECT="$(dirname "$PWD/$0")"
        ;;
esac
export BASEDIR="$(cd "$SCRIPT_INDIRECT" ; pwd -P)"

link_file () {
    SOURCE=$1
    DESTINATION=$2

    if [ -h "$DESTINATION" ]; then
        echo "Updating link: $DESTINATION"
        rm "$DESTINATION"
    elif [ -d "$DESTINATION" ]; then
        echo "Replacing directory: $DESTINATION (saving old version)"
        SAVE_NAME="$DESTINATION.dotfiles.sav"
        if [ -e "$SAVE_NAME" ]; then
            SAVE_NAME="$SAVE_NAME.$(date +'%s')"
        fi
        mv "$DESTINATION" "$SAVE_NAME"
    elif [ -e "$DESTINATION" ]; then
        # if it exists but isn't a directory or a link, assume it is a file.
        echo "Replacing file: $DESTINATION"
        rm "$DESTINATION"
    else
        echo "Creating link: $DESTINATION"
    fi

    ln -s "$SOURCE" "$DESTINATION"
}

# Set up soft links from files to their destination (in home directory)
# Note: /bin/bash is required for ~/.* expansion in loop below
for i in "$BASEDIR"/*; do
    [ ! -d "$i" ] && continue
    [ "$(basename "$i")" == "ignored" ] && continue

    for j in "$i"/*; do
        FILENAME="$(basename "$j")"
        DESTINATION="$HOME/.$FILENAME"
	link_file $j $DESTINATION
    done
done


# Make a pass deleting stale links, if any
for i in ~/.*; do
    [ ! -h "$i" ] && continue

    # We have a link: Is it stale? If so, delete it ...
    # Since we can't use readlink, assume that if the link is
    # not pointing to a file or a directory that it is stale.
    if [ ! -f "$i" -a ! -d "$i" ]; then
        echo "Deleting stale link: $i"
        rm "$i"
    fi
done

# Install some essential programs

if ! command -v git >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y git
fi

if ! command -v nvim >/dev/null 2>&1; then
    pushd /tmp
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim-linux64
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm -f /tmp/nvim-linux64.tar.gz
    popd
fi

# Link neovim config
NVIMDIR="$BASEDIR/ignored/nvim"
DESTINATION="$HOME/.config/nvim"
link_file $NVIMDIR $DESTINATION

if ! command -v curl >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y curl
fi

if ! command -v unzip >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y unzip
fi

# install required font for starship prompt
TMPFILE=`mktemp`
mkdir -p ~/.local/share/fonts
curl -L --output ${TMPFILE} https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip -d ~/.local/share/fonts/FiraCode\ Nerd\ Font ${TMPFILE}
rm ${TMPFILE}

# install starship prompt
curl -sS https://starship.rs/install.sh | sh
