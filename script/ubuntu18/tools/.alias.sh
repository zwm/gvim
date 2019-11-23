# Prompt
#set prompt="%m[%n]%%#"
#export PS1='\h:\w$'
export PS1="[\u@\h:\w]\$"
# add "./"
export PATH=$PATH:./
# editor
alias g='gvim'
alias vi='vim'
# ls
alias l='ls -lF'
alias la='ls -alF'
alias ll='ls -AlF'
# cd
#alias cd='cd \!*;l -a' # csh
#alias cd="cd $1;ls"
cdls(){
	\cd "${1}";
#	ls -AlF;
	ls -lF;
}
alias cd='cdls'
alias cd..='cd ..'
alias cdd='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias h='history'
# Source alias
alias vb='vim ~/.bashrc'
alias gb='gvim ~/.bashrc'
alias sb='source ~/.bashrc'
alias ga='gvim ~/.bashrc_xt/.alias.sh'
alias gts='gvim ~/.bashrc_xt/.tools_synopsys_2016.sh'

