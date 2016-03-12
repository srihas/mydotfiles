# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
    source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's dotfiles bin if it exists
if [ -d "DOTFILE_DIR/bin" ] ; then
    PATH="DOTFILE_DIR/bin:${PATH}"
else
    echo "Updating PATH to dotfile bin directory failed"
fi

PATH=".:${PATH}"

# Place user local stuff here
if [ -f "${HOME}/.localrc" ] ; then
    source "${HOME}/.localrc"
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

#Check if rbenv is installed and init rbenv
if [ -x "$(command -v rbenv)" ] ; then
    eval "$(rbenv init -)"
fi
