#! /bin/zsh

which tmux

if tmux list-sessions &>/dev/null; then
    TMUX_RUNNING=0
else
    TMUX_RUNNING=1
fi


T_RUNTYPE="serverless"
if [ "$TMUX_RUNNING" -eq 0 ]; then
    if [ "$TMUX" ]; then # inside tmux
        T_RUNTYPE="attached"
    else # outside tmux
        T_RUNTYPE="detached"
    fi
fi

SESSION_NAME="🏡"
if [ "$T_RUNTYPE" != "serverless" ]; then
    SESSION=$(tmux list-sessions -F '#S' | grep "^$SESSION_NAME$") # find existing session
fi

if [ "$SESSION" = "" ]; then # session is missing
    SESSION="$SESSION_NAME"
    tmux new-session -d -s "$SESSION" -c "$HOME" # create session
fi

case $T_RUNTYPE in # attach to session
attached)
    tmux switch-client -t "$SESSION"
    ;;
detached) ;&
serverless)
    tmux attach -t "$SESSION"
    ;;
esac
