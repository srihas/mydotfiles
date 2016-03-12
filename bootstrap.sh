#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

if [ -x "$(command -v git)" ] ; then
	 echo "Updating dotfiles from git repo"
    git pull origin master
else
	 echo "git not installed... proceeding without checkout"
fi

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
#echo $DIR

function link_dot_file() {
    file=${1}
    #echo ${file}
    ln -sf ${DIR}/${file} ${HOME}/${file#dot} # Remove dot prefix from filename
}

echo "Start : Linking dotfiles from $DIR"
for file in dot.*; do
    link_dot_file ${file}
done
echo "End   : linking dot.<file> complete"

FILENAME=$(echo ${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]}| cut -d'/' -f 2)
echo "Start : Updating installation directory details in scripts"
find ./ ! -name 'bootstrap.sh' -type f -exec sed -i -e 's?DOTFILE_DIR?'$DIR'?g' {} \;
echo "End   : files updated successfully"

# Os specific stuff
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

# Execute Os specific bootstrap
echo "Identified platform as ${platform}"
echo "Start : Executing ./bootstrap_${platform}.sh ..."
bash ./bootstrap_${platform}.sh
echo "Completed successfully"
