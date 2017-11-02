export DISABLE_AUTO_TITLE='true'
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color
export GTEST_COLOR=1
export EDITOR='vim'
# export CXX="ccache clang++"
# export CC="ccache clang"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

ZSH_THEME="ys"

plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Alias
# edit config
alias sc='source $HOME/.zshrc'
alias zc='$EDITOR $HOME/.zshrc'
alias zcc='$EDITOR $HOME/.zshrc.custom'
alias zs='$EDITOR $HOME/.ssh/config'
alias zv='$EDITOR $HOME/.vim/vimrc'
alias uv='$HOME/.vim/update.sh'
alias ud='$HOME/.dotfiles/install.sh'
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
alias t='TERM=screen-256color tmux'
alias tl='t list-sessions'
alias ta='t attach -t'
alias ts='t new -s'
alias tks='t kill-session -t'
alias tkw='t kill-window -t'
alias tpl='TERM=screen-256color tmuxp load'
alias ssh-remote='command -v echo $remote >/dev/null 2>&1 || { ssh "$remote" }'
function tpcall() {
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
# package manager
export apt_pref='apt-get' # change to apt-fast if you like
alias aac='sudo $apt_pref autoclean'
alias aupd='sudo $apt_pref update'
alias aupg='sudo $apt_pref upgrade'
alias audg='sudo $apt_pref update && sudo $apt_pref upgrade'
alias apge='sudo $apt_pref purge'
alias arm='sudo $apt_pref remove'
alias di='sudo dpkg -i'
alias ai='sudo $apt_pref install'
alias acs='apt-cache search'
# shadowsocks
alias ss='$HOME/proxyservice on'
alias ssk='$HOME/proxyservice off'

# proxy
proxy='http://127.0.0.1:6152'
function proxy () {
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

function noproxy () {
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
source /usr/local/bin/virtualenvwrapper.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# custom
source $HOME/.zshrc.custom
