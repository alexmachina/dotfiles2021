function adda {
    local ALIASES_PATH=~/scripts/aliases

    if [ $# -eq 0 ]
        then
            echo "Oops, no params"
    fi

    if [ $# -eq 1 ]
        then
            local CMD=$(history | tail -2 | head -1 | cut -c8-999)
            local NAME=$1
            local ALIAS_TEXT="alias ${NAME}='${CMD}'"
            echo $ALIAS_TEXT >> $ALIASES_PATH
            source $ALIASES_PATH
    fi

    if [ $# -eq 2 ]
        then
            local NAME=$1
            local CMD=$2
            local ALIAS_TEXT="alias ${NAME}='${CMD}'"

            echo  $ALIAS_TEXT >> $ALIASES_PATH
            source $ALIASES_PATH
    fi
}