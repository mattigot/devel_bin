# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

#general
alias mount_builds='sudo mount /mnt/jenkins/'
#dir shortcuts
alias cdriver='cd ~/devel/driver/iwlwifi-stack-dev/'
alias cdriverp='cd ~/devel/driver/iwlwifi-stack-public-modrename'
alias cdwpa='cd ~/devel/hostap/iwlwifi-hostap/wpa_supplicant/'
alias cdwpap='cd ~/devel/hostap/iwlwifi-hostap-public/wpa_supplicant/'
alias cdfwp='cd ~/devel/fw/iwlwifi-fw-binary-public'
alias cdhal='cd ~/devel/hal/iwlwifi-libwifihal/'
alias cdbin='cd ~/bin/'
alias cdbuild='cd ~/builds/'
alias cdut='cd ~/google_test/fm_ut'
alias cdssh='cd ~/.ssh'

alias wake='sudo etherwake -i wlan0 34:13:e8:30:0a:ac'
#clone
alias clndriver='git clone ssh://mgottlie@git-amr-3.devtools.intel.com:29418/iwlwifi-stack-dev'
alias clnwpa='git clone ssh://mgottlie@git-amr-3.devtools.intel.com:29418/iwlwifi-hostap'

#version info
alias supplicant_v='wpa_supplicant -v'
alias driver_v='modinfo -F version iwlwifi'
# trace-command
alias tc='sudo trace-cmd record -e iwlwifi -e iwlwifi_msg -e iwlwifi_ucode -e iwlwifi_data -e mac80211 -e cfg80211 -e mac80211_msg -e printk'
#alias tc='sudo trace-cmd record -e mac80211 -e cfg80211 -e iwlwif*'
alias tp='FWAPI=mvm HEXDUMP=1 MSGFILE=/lib/firmware/ucode_dbg_string.hex trace-cmd report -i trace.dat > trace_log'
alias tpw="trace-cmd report -R trace.dat > trace.log"

#net console
alias nc_dbg='netconsole_inst 10.12.217.189'
alias nc_s_dbg='netcat -l -u 6666 | tee /tmp/log'

#debug
alias dmesgc='sudo dmesg -c'
alias dmesgcr='sudo dmesg -c && reset'
alias dmesgadb='adb shell dmesg | grep -E "iwl|wlan|80211"'
alias syslog='sudo tail -f /var/log/syslog'
alias wrtadb='adb shell ls /data/wrt_dumps'
#iwliwfi
alias lsiwl='lsmod | grep iwl'
alias lliwl='ll | grep iwl'

alias gitadd="git status | grep modified | awk '{ print $2 }' | xargs git add"

alias cp_run_sparse="./intc-scripts/check-commit-msg.py /tmp /tmp master"

alias xmm_rw_root='adb shell su - mount -o remount, "rw" /'
alias xmm_rw_system='adb shell su - mount -o remount, "rw" /system'

export GIT_EDITOR=vim

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export TERM='xterm-256color'

# Color mapping
grey='\[\033[1;30m\]'
red='\[\033[0;31m\]'
RED='\[\033[1;31m\]'
green='\[\033[0;32m\]'
GREEN='\[\033[1;32m\]'
yellow='\[\033[0;33m\]'
YELLOW='\[\033[1;33m\]'
purple='\[\033[0;35m\]'
PURPLE='\[\033[1;35m\]'
white='\[\033[0;37m\]'
WHITE='\[\033[1;37m\]'
blue='\[\033[0;34m\]'
BLUE='\[\033[1;34m\]'
cyan='\[\033[0;36m\]'
CYAN='\[\033[1;36m\]'
NC='\[\033[0m\]'

#command prompt coloring
#export PS1="\e[0;31m[\u@\h \W]\$ \e[m"
#PS1="$yellow[$red\H$yellow][$GREEN\w$grey$yellow]$NC# "
PS1="$yellow[$red\w$grey$yellow]$NC# "

#zephry
export ZEPHYR_GCC_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/home/tester/devel/zephyr/zephyr-sdk

#enviorment variables
#old PATH for backup: /home/tester/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/vol/store/boot/sbin
#PATH="${PATH}:/home/tester/bin/hostapd:/home/tester/bin/supplicant:/home/tester/bin/driver:/home/tester/bin/tools:/home/tester/bin/android/:/home/tester/bin/iperf"
PATH="${PATH}:/home/tester/bin/hostapd:/home/tester/bin/supplicant:/home/tester/bin/driver:/home/tester/bin/tools:/home/tester/bin/android/:/home/tester/bin/iperf:/home/tester/bin/setup"
