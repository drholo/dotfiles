#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alth --color=auto'
PS1='[\u@\h \W]\$ '


alias goboost='set -x; asusctl profile boost -t true -f boost; sudo cpupower frequency-set -g performance >&/dev/null; { set +x; } >&/dev/null'
alias gonormal='set -x; asusctl profile normal -t true -f normal; sudo cpupower frequency-set -g schedutil >&/dev/null; { set +x; } >&/dev/null'
alias gosilent='set -x; asusctl profile silent -t false -f silent; sudo cpupower frequency-set -g schedutil >&/dev/null; { set +x; } >&/dev/null'

alias chrome='google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland'
export EDITOR=vim

alias swaycfg='vim .config/sway/config'

setfwvar() {
	export TESTFW_HOST=10.185.121.82;
	export TESTFW_HOST_ENS=10.185.121.87;
	export TESTFW_DEV_MODE=1
}

setfwvarsing() {
	export TESTFW_HOST=10.185.121.69;
	export TESTFW_DEV_MODE=1
}
_JAVA_AWT_WM_NONREPARENTING=1


alias ssh-andrii-vps1='ssh andrii@172.99.190.93'
alias ssh-andrii-vps2='ssh andrii@172.99.189.238'
alias ssh-andrii-vps3='ssh andrii@172.99.190.74'
alias ssh-sdk-vps1='ssh sassdk@172.99.190.93'
alias ssh-gitlab-vps1='ssh gitlab@172.99.190.93'
alias svenv='source .venv/bin/activate'

alias xterminator='GDK_BACKEND=x11 terminator'

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct

export PATH=$PATH:/home/andrii/app/nRF-Command-Line-Tools_10_13_0_Linux64/mergehex/:/home/andrii/app/nRF-Command-Line-Tools_10_13_0_Linux64/nrfjprog/

unset HISTFILESIZE
HISTSIZE=10000
export PYENV_ROOT="/home/andrii/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init --path)"
fi
