function saveAlias {
    echo $1
    local ALIASES_PATH=~/scripts/aliases
    echo $1 >> $ALIASES_PATH
}

function adda {
    if [ $# -eq 0 ]
        then
            echo "Oops, no params"
    fi

    if [ $# -eq 1 ]
        then
            local CMD=$(history | tail -2 | head -1 | cut -c8-999)
            local NAME=$1
            local ALIAS_TEXT="alias ${NAME}='${CMD}'"
            saveAlias "$ALIAS_TEXT"
    fi

    if [ $# -eq 2 ]
        then
            local NAME=$1
            local CMD=$2
            local ALIAS_TEXT="alias ${NAME}='${CMD}'"

            saveAlias "$ALIAS_TEXT"
    fi
}