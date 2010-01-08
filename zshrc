# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt    GLOB
setopt    EXTENDED_HISTORY
setopt    INC_APPEND_HISTORY
setopt    SHARE_HISTORY
setopt    HIST_IGNORE_DUPS
setopt    HIST_FIND_NO_DUPS
setopt    HIST_IGNORE_SPACE
setopt    HIST_VERIFY
setopt    NO_HIST_BEEP
setopt    NO_BEEP
setopt    NO_HUP
setopt correctall
setopt hist_ignore_all_dups
#bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#autoload -U zcalc
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit
if [[ $( hostname ) == stallman ]]; then
	prompt fire green green green
	[ ! -f "$HOME/.nosplash" ] && /usr/local/bin/splash
	[ ! -f "$HOME/.nomotd" ] && cat /etc/motd.rootnode
elif [[ $( hostname ) == pld-users.org ]]; then
	prompt fire red grey red
elif [[ $( whoami ) == root ]]; then
	prompt elite2 red
elif [[ $( whoami ) == grizz ]]; then
	prompt fire
else
	prompt fade white grey blue
fi
#zsh t'n't
################### KEYBINDINGS #################
bindkey -e

case $TERM in
        linux)
        bindkey "^[[1~" beginning-of-line       # Home
        bindkey "^[[4~" end-of-line             # End 
        bindkey "^[[3~" delete-char             # Del
        bindkey "^[[2~" overwrite-mode          # Insert 
        bindkey "^[[5~" history-search-backward # PgUp 
        bindkey "^[[6~" history-search-forward  # PgDn
        ;;

    xterm)
        bindkey "^[OH"  beginning-of-line       # Home
        bindkey "^[OF"  end-of-line             # End 
        bindkey "^[[3~" delete-char             # Del
        bindkey "^[[2~" overwrite-mode          # Insert 
        bindkey "^[[5~" history-search-backward # PgUp 
        bindkey "^[[6~" history-search-forward  # PgDn
        ;;
        
    cons25l2)
        bindkey "^[[H"  beginning-of-line       # Home
        bindkey "^[[F"  end-of-line             # End 
        bindkey "^?"    delete-char             # Del
        bindkey "^[[L"  overwrite-mode          # Insert 
        bindkey "^[[I"  history-search-backward # PgUp 
        bindkey "^[[G"  history-search-forward  # PgDn
        ;;
esac

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

############## aliases ##################

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ll -A'
alias t="sensors |grep Core"
alias s="uptime && echo \"--\\n\" && free -m && echo \"--\\n\" && t && grep \"cpu MHz\" /proc/cpuinfo && cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor && echo \"--\\n\" && sensors G CPU && echo \"--\\n\" && /usr/sbin/hddtemp -q /dev/sda && /usr/sbin/hddtemp -q /dev/sdb
"
alias    -g    L='|most '
alias    -g    G='|grep '
alias    -g    S='|sort'
alias rm="rm -I"
alias w="w -f"
alias aria2cSl="aria2c -s 5 --max-download-limit=200K"
alias aria2cS="aria2c -s 5"
alias du="du -h"
alias DU="du -sh *"
alias sc="screen -x"

### ARCH Linux START ###
#
#alias ags="fakeroot aur-get -S"
#alias agn="fakeroot aur-get -Sn"
#alias sfm="shell-fm"
#
#alias pcss="yaourt"
#alias pcs="yaourt -S"
#alias pcsb="yaourt -Sb"
#alias pcsu="yaourt -Su"
#alias pcsy="yaourt -Sy"
#alias pcsyu="yaourt -Syu"
#alias pcr="yaourt -R"
#alias pcq="yaourt -Q"
#alias pcqi="yaourt -Qi"
#alias pcql="yaourt -Ql"
#alias pcqo="yaourt -Qo"
#alias pcqs="yaourt -Qs"
#
#alias pcu="yaourt -U"
#
### ARCH Linux END ###


######################PLDBUILDER##############3
alias Sv="grep Version"
alias Ss="grep Sum"
alias Su="grep URL"
alias SS="egrep 'Version|URL|Sum'"
alias Sl="grep -A 10 Log"
alias bb='time ./builder -bb'
alias bbak='time ./builder -bb --define alt_kernel desktop'
#######################PLDBUILDERend############################

###########################PLD#############################
alias pu="poldek --up"                                                    
alias pllu="ipoldek llu"
alias pul="pu && pllu" #tricky :P                                         
alias pud="poldek --upgrade-dist"
alias pth="poldek -n th-test -n titanium -n titanium-test -n th -n th-ready"
alias pula="pth --up && pul && pth --shcmd 'llu kde* gtk2-theme-engine-* Qt* qt* texlive*'"
###########################PLDend##########################

######################SSHFS##################################
alias	Sshfss='sshfs grizz@s.rootnode.net:/home/grizz/ /home/users/grizz/mnt/stallman'
alias	Sshfsm='sshfs mirley@192.168.1.2:/home/mirley/ /home/users/grizz/mnt/mirley'
alias 	Sshfsr='sshfs grizz@s.rootnode.net:/home2/grizz/www/grizz.rootnode.net/htdocs /home/users/grizz/mnt/grizz.rootnode.net'
alias	Sshfsw='sshfs grizz@s.rootnode.net:/home2/grizz/www/ /home/users/grizz/mnt/www'
##########################SSHFSend###########################

export PAGER=less
export EDITOR="vim"
alias e=$EDITOR
alias ee="gvim"
export OOO_FORCE_DESKTOP="kde"
