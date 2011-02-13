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
elif [[ $( hostname ) == stallman2.rootnode.net ]]; then
	prompt fire green red green
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


################# git prompt ######################

# based on: http://kriener.org/articles/2009/06/04/zsh-prompt-magic

setopt prompt_subst
autoload colors
colors
autoload -Uz vcs_info

# set some colors
for COLOR in RED GREEN YELLOW WHITE BLACK CYAN; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
PR_RESET="%{${reset_color}%}";

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stangedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
FMT_BRANCH="${PR_GREEN}%s::%b%u%c${PR_RESET}" # e.g. master¹²
FMT_ACTION="(${PR_CYAN}%a${PR_RESET}%)"   # e.g. (rebase-i)
FMT_PATH="%R${PR_YELLOW}/%S"              # e.g. ~/repo/subdir

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr '¹'  # display ¹ if there are unstaged changes
zstyle ':vcs_info:*:prompt:*' stagedstr '²'    # display ² if there are staged changes
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}//" "${FMT_PATH}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"              "${FMT_PATH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""                             "%~"


function precmd {
    vcs_info 'prompt'
}

function rprompt {
    local brackets=$1
    local color1=$2
    local color2=$3

    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}${PR_RESET}"
    local colon="${color1}:"
    local at="${color1}@${PR_RESET}"

    local user_host="${color2}%n${at}${color2}%m"
    local vcs_cwd='${${vcs_info_msg_1_%%.}/$HOME/~}'
    local cwd="${color2}%B%20<..<${vcs_cwd}%<<%b"
    local inner=""
    local git='$vcs_info_msg_0_'

	RPROMPT="${PR_RESET}${bracket_open}${inner}${git}${bracket_close}${PR_RESET}"
}

rprompt '  ' $BR_BRIGHT_BLACK $PR_WHITE


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
alias s="uptime && echo \"--\" && free -m && echo \"--\" && t && grep \"cpu MHz\" /proc/cpuinfo && cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor && sensors G CPU  && /usr/sbin/hddtemp -q /dev/sda && /usr/sbin/hddtemp -q /dev/sdb && nvidia-smi -a |tail -n 4"
alias    -g    L='|most '
alias    -g    G='|grep '
alias    -g    S='|sort'
alias rm="rm -I"
alias w="w -f"
alias aria2cSl="aria2c -s 5 --max-download-limit=200K"
alias aria2cS="aria2c -s 5"
alias du="du -h --max-depth=1"
alias DU="du -h --max-depth=0 *"
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
alias pth="poldek -n th-test -n ti -n ti-test -n th -n th-ready"
alias pti="poldek -n ti -n ti-test"
alias ptid="poldek -n ti-dev -n ti-dev-test"
alias ptia="poldek -n ti -n ti-test -n ti-dev -n ti-dev-test"
alias pul="poldek -n ti -n ti-test --up; ipoldek -n ti llu; ipoldek -n ti-test llu"
alias pula="poldek -n ti -n ti-test -n ti-dev -n ti-dev-test --up; ipoldek -n ti llu; ipoldek -n ti-test llu; ipoldek -n ti-dev llu; ipoldek -n ti-dev-test llu"
###########################PLDend##########################

######################SSHFS##################################
alias	Sshfss='sshfs grizz@s2.rootnode.net:/home/grizz/ /home/users/grizz/mnt/stallman'
alias	Sshfsm='sshfs mirley@192.168.1.2:/home/mirley/ /home/users/grizz/mnt/mirley'
alias 	Sshfsr='sshfs grizz@s.rootnode.net:/home2/grizz/www/grizz.rootnode.net/htdocs /home/users/grizz/mnt/grizz.rootnode.net'
alias	Sshfsw='sshfs grizz@s.rootnode.net:/home2/grizz/www/ /home/users/grizz/mnt/www'
##########################SSHFSend###########################

export PAGER=less
export EDITOR="vim"
alias e=$EDITOR
alias ee="gvim"
export OOO_FORCE_DESKTOP="kde"

