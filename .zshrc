export ZSH=/home/ubuntu/.oh-my-zsh

#export CXX="ccache clang++"
#export CC="ccache clang"

ZSH_THEME="ys"

plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias install="sudo apt-get install"
alias em='emacsclient'
alias eserver='emacs --daemon'
alias g='git'
alias gs='git status'
alias apt='sudo apt-get'
alias sc='source ~/.zshrc'
alias zc='vi ~/.zshrc'
alias ci='g add . && g ci -m "ci" && g push'
alias hisg='history | grep'
alias t='TERM=xterm-256color tmux'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias ts='t new -s'
alias install='sudo apt-get install'

proxy='http://192.168.1.10:6152'
# where proxy
proxy () {
  export http_proxy=$proxy
  export HTTPS_PROXY=$http_proxy
  export HTTP_PROXY=$http_proxy
  export FTP_PROXY=$http_proxy
  export https_proxy=$http_proxy
  export ftp_proxy=$http_proxy
  export NO_PROXY="local-delivery,local-auth"
  export no_proxy=$NO_PROXY
  echo "Proxy on"
}

# where noproxy
noproxy () {
  unset http_proxy
  unset HTTPS_PROXY
  unset HTTP_PROXY
  unset FTP_PROXY
  unset https_proxy
  unset ftp_proxy
  echo "Proxy off"
}

#source /opt/ros/kinetic/setup.zsh

export ROSCONSOLE_FORMAT='[${severity}] [${time}] [${file}:${line}]: ${message}'

alias rcd='roscd'
alias red='rosed'
alias rmk='catkin_make -j4'
alias rt=catkin_make run_tests
alias rpkg='catkin_create_pkg'
alias rcore='roscore &'
alias rl='roslaunch'
alias rr='rosrun'
alias e='rosed'
