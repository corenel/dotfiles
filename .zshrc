export DISABLE_AUTO_TITLE='true'
export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color
export GTEST_COLOR=1
export EDITOR='vim'
# export CXX="ccache clang++"
# export CC="ccache clang"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

ZSH_THEME="ys"

plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# # automatically run tmux when starting shell
# if which tmux >/dev/null 2>&1; then
#     # if no session is started, start a new session
#     test -z ${TMUX} && tmux

#     # when quitting tmux, try to attach
#     while test -z ${TMUX}; do
#         tmux attach || break
#     done
# fi

# Alias
# edit config
alias sc='source $HOME/.zshrc'
alias st='tmux source $HOME/.tmux.conf'
alias zc='$EDITOR $HOME/.zshrc'
alias zcc='$EDITOR $HOME/.zshrc.custom'
alias zs='$EDITOR $HOME/.ssh/config'
alias zv='$EDITOR $HOME/.vim/vimrc'
alias zt='$EDITOR $HOME/.tmux.conf'
alias uv='$HOME/.vim/update.sh'
alias ud='cd $.dotfiles/ && git pull && cd -'
alias ud='cd $.dotfiles-personal/ && git pull && cd -'
# ls (from common-aliases)
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
# make
alias mk='make -j`nproc`'
alias mc='make clean'
# git
alias ci='git add . && git commit -m "ci" && git push'
# grep
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
alias hst='fc -El 0'
alias hsg='fc -El 0 | grep'
alias psg='ps ax | grep'
# head and tail
# alias -g H='| head'
# alias -g T='| tail'
# alias -g G='| grep'
# alias -g L="| less"
# alias -g M="| most"
# alias -g LL="2>&1 | less"
# alias -g CA="2>&1 | cat -A"
# alias -g NE="2> /dev/null"
# alias -g NUL="> /dev/null 2>&1"
# alias -g P="2>&1| pygmentize -l pytb"
# find
alias fd='find . -type d -name' # find directories in current path
alias ff='find . -type f -name' # find files in current path
alias fdr='sudo find / -type d -name' # find directories in root path
alias ffr='sudo find / -type f -name' # find files in root path
# dangerous operations with prompt
alias mv='mv -i -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias chmod='chmod -v'
alias chown='chown -v'
alias rename='rename -v'
# tmux
alias t='tmux'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias ts='tmux new -s'
alias tks='tmux kill-session -t'
alias tkw='tmux kill-window -t'
alias tload='tmuxp load'
alias ffk='set-remote && tmuxp load remote'

reset-remote() {
  echo "reset remote ssh host:"
  read REMOTE
  tmux setenv -g REMOTE $REMOTE
}

set-remote () {
  ssh -q $REMOTE exit
  while [[ $? -ne 0 ]]; do
      echo "invalid remote: $REMOTE"
      reset-remote
      ssh -q "$REMOTE" exit
  done
  echo "valid ssh host: $REMOTE"
}

ssh-remote () {
  # if [[ ("$REMOTE" && ! "$REMOTE" = "-REMOTE") ]] ; then
  if [[ ("$REMOTE") ]] ; then
    echo "use remote: $REMOTE"
  elif [[ $(tmux show-environment -g REMOTE | sed "s:^.*=::") ]] ; then
    export REMOTE=$(tmux show-environment -g REMOTE | sed "s:^.*=::")
    echo "use global remote env: $REMOTE"
  else
    set-remote
  fi
  ssh "$REMOTE" -t "reset && $SHELL"
}

twcall () {
  for _pane in $(tmux list-panes -F '#{pane_id}'); do
    tmux send-key -t ${_pane} C-z "$1" Enter
  done
}

tscall () {
  for _pane in $(tmux list-panes -s -F '#{pane_id}'); do
    tmux send-key -t ${_pane} C-z "$1" Enter
  done
}

tacall () {
  for _pane in $(tmux list-panes -a -F '#{pane_id}'); do
    tmux send-key -t ${_pane} C-z "$1" Enter
  done
}

# python
alias py3='python3'
alias py2='python2'
# print info
alias dfh='df -hlT'
alias gput='watch -n 1 nvidia-smi'
alias tree='tree -F -A -I CVS'

# proxy
export CUSTOM_PROXY='http://10.12.218.233:6152'
proxy () {
  export http_proxy=$CUSTOM_PROXYy
  export HTTPS_PROXY=$http_proxy
  export HTTP_PROXY=$http_proxy
  export FTP_PROXY=$http_proxy
  export https_proxy=$http_proxy
  export ftp_proxy=$http_proxy
  export NO_PROXY="local-delivery,local-auth"
  export no_proxy=$NO_PROXY
  echo "Proxy on"
}

noproxy () {
  unset http_proxy
  unset HTTPS_PROXY
  unset HTTP_PROXY
  unset FTP_PROXY
  unset https_proxy
  unset ftp_proxy
  echo "Proxy off"
}

# virtualenv
export VIRTUALENVWRAPPER_PYTHON=python3
export WORKON_HOME=~/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# fzf
[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

# custom
[ -f $HOME/.zshrc.custom ] && source $HOME/.zshrc.custom
