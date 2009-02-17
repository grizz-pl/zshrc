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
prompt fire

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
alias t="sensors |grep Core"
alias s="uptime && echo \"--\\n\" && free -m G buf && echo \"--\\n\" && t && echo \"--\\n\" && sensors G CPU && echo \"--\\n\" && /usr/sbin/hddtemp -q /dev/sda && /usr/sbin/hddtemp -q /dev/sdb
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



######################SSHFS##################################
alias	Sshfss='sshfs grizz@s.rootnode.net:/home/grizz/ /home/users/grizz/mnt/stallman'
alias	Sshfsm='sshfs mirley@192.168.1.2:/home/mirley/ /home/users/grizz/mnt/mirley'
alias 	Sshfsr='sshfs grizz@s.rootnode.net:/home2/grizz/www/grizz.rootnode.net/htdocs /home/users/grizz/mnt/grizz.rootnode.net'
alias	Sshfsg='sshfs grizz@s.rootnode.net:/home2/grizz/www/grizz.pl/htdocs /home/users/grizz/mnt/grizz.pl'
alias	Sshfsf='sshfs grizz@s.rootnode.net:/home2/grizz/www/firlej.org/htdocs /home/users/grizz/mnt/firlej.org'
##########################SSHFSend###########################

export PAGER=less
export EDITOR="gvim"
alias e=$EDITOR

export OOO_FORCE_DESKTOP="kde"
