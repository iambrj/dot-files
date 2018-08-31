#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='<\u \@  \W>\$ '

HISTSIZE=1000
HISTFILE=~/.bash_history
HISTFILESIZE=1000

# Few useful aliases
alias h='history | tail'
alias lss='ls -l'
alias lsa='ls -a'
alias r='ranger'
alias sr='sudo ranger'
alias v='vim'
alias sv='sudo vim'
alias q='exit'
alias docs='cd ~/docs'
alias books='cd ~/docs/books'

# exports
JAVA_HOME=/usr/lib/jvm/java-10-openjdk; export JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH;
export LFS=/mnt/lfs
export PATH=$PATH:/usr/local/go/bin
export PATH=~/docs/java/bin:$PATH
export FCEDIT='/usr/bin/vim'
