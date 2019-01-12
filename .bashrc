# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# mac aliases
# brew install coreutils gnu-which findutils tree jq
if [ "$(uname)" == "Darwin" ]; then
  eval `gdircolors -b`
  alias ls='gls --color=always -N'
  alias updatedb='sudo /usr/local/bin/gupdatedb'
  alias locate='/usr/local/bin/glocate'
  alias which='/usr/local/bin/gwhich'
  alias sudo='sudo ' # this allows aliases to cascade to sudo commands
fi

# linux aliases
if [ "$(uname)" == "Linux" ]; then
  if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=always'
    alias grep='grep --color=always'
  fi
fi

# general aliases
alias ll='ls -l'
alias lt='ls -lat'
alias tree='tree -C'
alias less='less -R'

# stripcolors command alias
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

# force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# history size
export HISTSIZE=10000000
export HISTTIMEFORMAT="%d/%m/%y %T "

# matlab-like history completion
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# prompt
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=gxgxcxdxbxegedabagacad  # cyan directories
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# set default editor
export EDITOR=/usr/bin/vim

# automatic screen in linux
if [ "$(uname)" == "Linux" ]; then
  if [ -x "$(command -v screen)" ]; then
    if [ -z "$STY" ]; then
      socket=`screen -ls | grep Detached | cut -f2 | sort | head -n1`
      if [ -z "$socket" ]; then
        echo "No socket available"
        echo "Starting new screen"
        /usr/bin/screen -q
      else
        echo "Connecting to $socket"
        /usr/bin/screen -q -r $socket
      fi
    else
      alias exit="/usr/bin/screen -DD $STY"
    fi
  fi
fi

# jupyter notebook strip using jq
alias nbstrip="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"
