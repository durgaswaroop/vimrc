alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push -u origin master"
alias grao="git remote add origin"
alias gprox="git config --global -l"
alias gfo="git fetch origin"
# alias gpset - in bashrc.local
alias gpunset="git config --global --unset http.proxy"
alias gpush='git add _vimrc;git commit -m "More additions";git push -u origin master'
alias vimrc='cd /c/progra~1/Vim'
alias grep='grep --color'
alias grep='grep -oP'
alias xargs="xargs -n 1 -d '\n'"
alias ls='ls --color=auto'
alias lsa='ls -A'
alias las='ls -A'
alias la='ls -A'
alias l='ls'
alias s='ls'
alias sls='ls'
alias cd..='cd ..'
alias sl='ls'
alias llh='ls -lh'
alias lsh='ls -lh'
alias src='source ~/.bashrc'
alias ..="cd .."
alias ...="cd ../.."
alias wget="wget -c"

PS1="\[\017\]\[\033[33;1m\]\w\[\033[0m\] `if [ $? = 0 ]; then echo "\[\033[37;1m\]:)\[\033[0m\]"; else echo "\[\033[31;1m\]:(\[\033[0m\]"; fi` \[\033[33;1m\]>\[\033[0m\]"
#alias
cd (){
	builtin cd $1
	if [ $? == 0 ];
	then
		ls -ltr
	fi
}
