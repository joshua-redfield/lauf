########################################################
# Look v0.3.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Lost a file? Find it with this #######################
# Usage:                                               #
# look for FILE_NAME, or look in DIRECTORY for FILE_NAME, or look
# Dependencies:                                        #
# find, grep #################################################
########################################################
# Functions #
#############

_find() {
        notify-send "${lauf_app_name}" "Looking in ${search_dir} for ${search}..." -i "${lauf_app_icon}"
        find . -name "*${search}*" | zenity --width=${lauf_width} --height=$(($lauf_height-100)) --window-icon=$lauf_app_icon --list --editable --title  "${lauf_app_name}" --text "Results will appear as they are found\nTip: Click twice to be able to copy" --column "Results for $search"
        if [ $? = "0" ]; then
            return
        else
            exec $0
        fi
}
_prog() {
        notify-send "${lauf_app_name}" "Looking in ${search_dir} for ${search}..." -i "${lauf_app_icon}"
        LOOKIN=$(echo $PATH | tr ':' ' ')
        launch=$(find $LOOKIN | grep "${search}" | zenity --width=${lauf_width} --height=$(($lauf_height-100)) --window-icon=$lauf_app_icon --list --editable --title  "${lauf_app_name}" --text "Results will appear as they are found\nTip: Click twice to be able to copy.\nYou can also select a program and then press OK to launch it." --column "Results for $search")
        if [ $? = "0" ]; then
            eval "${launch}"
            return
        else
            exec $0
        fi
}
########################################################
# Arguements for skipping GUI                          #
# look in <dir> for <file>                             #
# look for <file>                                      #
########################################################
echo le1 $lauf_exec1
echo le2 $lauf_exec2
echo le3 $lauf_exec3
echo le4 $lauf_exec4
if [ $lauf_exec2 = "for" ]; then
    if [ $lauf_exec3 = "program" ];then
        search="$lauf_exec4"
        echo $lauf_exec4
        search_dir="application directories"
        _prog
        return
    fi
    search="$lauf_exec3"
    search_dir="filesystem"
    cd "/"
    _find
    return
elif [ $lauf_exec2 = "program" ];then
    search="$lauf_exec3"
    echo $lauf_exec3
    search_dir="application directories"
    _prog
    return
elif [ $lauf_exec2 = "in" ]; then
    search="$lauf_exec5"
    search_dir="$lauf_exec3"
    cd "$lauf_exec3"
    _find
    return
fi
########################################################
# GUI Code                                             #
########################################################
search=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What can I help you find $_master?")
case $? in
    0)
        yarra "search" "${search}"
        if [ $search1 = "program" ];then
            search="$search2"
            echo $search2
            search_dir="application directories"
            _prog
            return
        else
            search_dir="filesystem"
            cd "/"
            _find
            return
        fi
    ;;
    1)
        exec $0
    ;;
    *)
        return
    ;;
esac
