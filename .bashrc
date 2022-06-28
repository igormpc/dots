#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#colors
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#vim mode
set -o vi

#cd on dir
shopt -s autocd 

#infinite history
HISTSIZE= HISTFILESIZE= #inf hist

#alias
alias ls='ls --color=auto --group-directories-first'
alias bm="bashmount"
alias sdn="sudo shutdown -h now"
alias sr="sudo reboot"
alias r="ranger"
alias p="sudo pacman"
alias nb="newsboat"
alias m="mpv"
alias z="zathura"
alias nv="nvim"
alias v="nvim"
alias vim="nvim"
export SC_DOC_DIR="$HOME/docs/scdocs"
alias scn='cd $SC_DOC_DIR && nvim `date +"%d-%m-$y"`.scd -c "SCNvimStart"'

