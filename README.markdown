Installation

    git clone git://github.com/rohityadavcloud/dotfiles.git
    git clone https://github.com/ohmyzsh/ohmyzsh.git  ~/.oh-my-zsh

Create symlinks: (export SRC_ROOT=$PWD)

    ln -sf $SRC_ROOT/aliasrc ~/.aliasrc
    ln -sf $SRC_ROOT/dir-colors ~/.dircolors
    ln -sf $SRC_ROOT/zshrc.zsh ~/.zshrc
    ln -sf $SRC_ROOT/vimrc ~/.vimrc
    ln -sf $SRC_ROOT/vim ~/.vim
    ln -sf $SRC_ROOT/irssi ~/.irssi
    ln -sf $SRC_ROOT/muttrc ~/.muttrc
    ln -sf $SRC_ROOT/muttrc-colors ~/.muttrc-colors
    ln -sf $SRC_ROOT/git/gitconfig ~/.gitconfig
    ln -sf $SRC_ROOT/git/gitmessage ~/.gitmessage

To uninstall: (cd <path/to/dotfiles>; export SRC_ROOT=$PWD)

    rm -f $SRC_ROOT/aliasrc ~/.aliasrc
    rm -f $SRC_ROOT/dir-colors ~/.dircolors
    rm -f $SRC_ROOT/zshrc.zsh ~/.zshrc
    rm -f $SRC_ROOT/vimrc ~/.vimrc
    rm -f $SRC_ROOT/vim ~/.vim
    rm -f $SRC_ROOT/irssi ~/.irssi
    rm -f $SRC_ROOT/muttrc ~/.muttrc
    rm -f $SRC_ROOT/muttrc-colors ~/.muttrc-colors
    rm -f $SRC_ROOT/git/gitconfig ~/.gitconfig
    rm -f $SRC_ROOT/git/gitmessage ~/.gitmessage

