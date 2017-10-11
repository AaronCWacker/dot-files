export EDITOR=vim

APPINST_PATH="$HOME/app_inst"
ROSWELL_PATH="$HOME/.roswell"

if [ -d "$APPINST_PATH" ]; then
    export APPINST_PATH
    APPINST_BINS=$(echo $APPINST_PATH/*/bin | tr -s '[:blank:]' ':')
fi
if [ -n "$APPINST_BINS" ]; then
    export PATH=$APPINST_BINS:$PATH
fi

if [ -d "$ROSWELL_PATH" ]; then
    export PATH=$ROSWELL_PATH/bin:$PATH
fi

# virtualenvwrapper
if which virtualenvwrapper.sh > /dev/null 2>&1; then

    export WORKON_HOME=$HOME/.virtualenvs

    if which python3 > /dev/null 2>&1; then
        export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
        export VIRTUALENVWRAPPER_VIRTUALENV="$(which pyvenv)"
    fi
fi

# Aliases
alias ec='emacsclient --alternate-editor=""'
alias ecc='ec -c'
alias ect='ec -t'
alias eck='emacsclient -e "(kill-emacs)"'
