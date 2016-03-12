xcode-select --install || echo "Xcode already installed"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install cask
brew install caskroom/cask/brew-cask

# Update homebrew recipes
#brew update
#brew upgrade

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/completions
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap nviennot/tmate

brew install coreutils
brew install findutils
brew install moreutils
brew install binutils
brew install diffutils

brew install tmate
brew install osquery
brew install python
brew install openssl
brew install bash
brew install bash-completion2
brew install mysql
brew install sqlite
brew unlink postgresql
brew install postgresql
brew install dos2unix
brew install ant
brew install git
brew install jq
brew install jp2a
brew install wrk
brew install astyle
brew install csshx
brew install fish
brew install gradle
brew install mercurial
brew install subversion
brew install redis
brew install the_silver_searcher
brew install xmlstarlet
brew install watch
brew install tree
brew install pv
brew install erlang
brew install elixir
brew install leiningen
brew install npm
brew install rust
brew install lynx

# Install `wget` with IRI support.
brew install wget --with-iri

brew install s3cmd
brew install protobuf241
brew install lzop
brew install libevent
brew install play22
brew install maven32

# Install more recent versions of some OS X tools.
brew install grep --with-default-names
brew install wdiff --with-gettext
brew install openssh
brew unlink screen
brew install screen

brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls --with-default-names
brew install gawk --with-default-names
brew install curl --with-default-names
brew install emacs --with-cocoa
brew linkapps emacs

brew install rsync
brew install svn
brew install unzip
brew install less
brew install nano

brew install grc
brew install commonmark
brew install fpp
brew install youtube-dl
brew install shellcheck
brew install pgcli
brew install pandoc
brew install httpie

brew install fabric-completion
brew install --HEAD neovim/neovim/neovim

# Cask files
brew cask install $(cat Caskfile|grep -v "#")


echo "Add /usr/local/bin/bash to /etc/shells and chsh -s /usr/local/bin/bash"
