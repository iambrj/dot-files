#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='<\u \@  \W>\$ '
alias docs='cd ~/docs'
alias books='cd ~/docs/books'
HISTSIZE=1000
HISTFILE=~/.bash_history
HISTFILESIZE=1000
alias h='history | tail'
alias hg='history | grep'
export FCEDIT='/usr/bin/vim'
alias ZZ='^d'
alias lss='ls -l'
export PATH=$PATH:/usr/local/go/bin
export PATH=~/docs/java/bin:$PATH
alias files='ranger'
alias q='exit'
alias lsa='ls -a'
JAVA_HOME=/usr/lib/jvm/java-10-openjdk; export JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH;
export LFS=/mnt/lfs
