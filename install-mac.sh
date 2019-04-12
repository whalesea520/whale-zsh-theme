#!/usr/bin/env bash
# --------------------------------------------------------------------------------------------
# @Date    : 2018-10-10 20:09
# @Author  : whale (zj7687362@gmail.com)
# @Link    : http://www.whalesea.net/
# @Version : 0.1
# @Notes   : oh-my-zsh whale style theme
# --------------------------------------------------------------------------------------------
# Terminal & Shell We're going to use iTerm2 as our default terminal with a zsh shell.
# ### Installation
# brew cask install iTerm2
# ### Settings
# 1、Under Profiles->Colors, load and apply the Broadcast color theme
# 2、Under Profiles->Text, change the font to Meslo LG M Regular for Powerline 10pt
# 3、Under Profiles->Terminal, Character Encoding should be UTF-8 and Terminal Type xterm-256color
# ### Install zsh We're going to use zsh as a replacement for bash.
# 1、Install zsh
#   brew install zsh
# 2、Install oh-my-zsh
#   curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# 3、change the theme to whale
#   git clone https://github.com/whalesea520/whale-zsh-theme.git
#   cd whale-zsh-theme
#   chmod +x install-mac.sh
#   ./install-mac.sh
# 4、Reload the configuration file or restart iTerm2 for the change to take effect
#   killall iTerm2 &> /dev/null
#   open -a /Applications/iTerm.app/
# --------------------------------------------------------------------------------------------
# Copyright: 2019 (c) WHALE 🐳
# --------------------------------------------------------------------------------------------

#set -x

OS=`uname`

if [[ ${OS} != 'Darwin' ]]; then
    exit 0
fi

### Installation

# install iterm2
if [[ -d /Applications/iTerm.app/ ]]; then
    echo '---> exists iterm2'
else
    echo '---> install iterm2'
    brew cask install iTerm2
fi

# install zsh
if command -v zsh >/dev/null 2>&1; then
    echo '---> exists zsh'
else
    echo '---> install zsh'
    brew install zsh
fi

# install oh-my-zsh
if [[ -d ~/.oh-my-zsh/ ]]; then
    echo '---> exists oh-my-zsh'
else
    echo '---> install oh-my-zsh'
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi


# install whale theme
echo '---> install oh-my-zsh whale style Theme'
if [[ -d $HOME/.whale/ ]]; then
    WHALE_PATH=$HOME
fi
if [[ -d /home/$USER/.whale/ ]]; then
    WHALE_PATH=/home/$USER
fi

PWD_WHALE=`pwd`
DIR_WHALE=${WHALE_PATH}/.whale
FILE_WHALE_THEME=${WHALE_PATH}/.oh-my-zsh/custom/themes/whale.zsh-theme
FILE_ZSHRC=${WHALE_PATH}/.zshrc

rm -rf ${DIR_WHALE}
mkdir -p ${DIR_WHALE}
cd ${DIR_WHALE}

cp -r ${PWD_WHALE}/. ${DIR_WHALE}/

#ls -la | grep "^-"

rm -f ${FILE_ZSHRC} ${FILE_WHALE_THEME}

ln -sf ${DIR_WHALE}/.zshrc ${FILE_ZSHRC}
ln -sf ${DIR_WHALE}/whale.zsh-theme ${FILE_WHALE_THEME}

echo 'Done ! (the symlink is ~/.oh-my-zsh/custom/themes/whale.zsh-theme)'

# final
echo '---> Install Complete.'
echo 'Do it.'
echo 'chsh -s $(which zsh)'