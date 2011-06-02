if [ "$EMACS" == "t" ]; then
	alias ls='ls -C --color=always'
else
	export PATH=/usr/bin:/usr/local/bin:$PATH
	alias ls='ls --color=auto'
fi

export PS1="\[\e[32m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\$ "


