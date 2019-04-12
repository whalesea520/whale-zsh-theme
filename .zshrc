# Path to your oh-my-zsh installation.
if [ -d $HOME/.oh-my-zsh/ ]; then
    export ZSH=$HOME/.oh-my-zsh
fi
if [ -d /home/$USER/.oh-my-zsh/ ]; then
    export ZSH=/home/$USER/.oh-my-zsh
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="whale"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn docker)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

#===============================
# whale alias
# Author: zj7687362@gmail.com
#===============================
# kubectl lazy load
function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

# some alias and environment configurations
alias findps="ps aux|grep "
alias to="source ~/script/to"

alias kube="kubectl"
alias kubeget="kubectl get -o wide"
alias kubed="kubectl describe"
alias kubeall="kubectl get -o wide --all-namespaces all"
alias ddie="docker ps -a|grep Exited|awk '{print \$1}'|xargs -i docker rm {}"
alias dnone="docker images|grep none|awk '{print \$3}'|xargs -i docker rmi {}"
alias dimg="docker images|awk '{print \$3}'|xargs -i docker rmi {}"

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
export TERM="xterm-256color"
