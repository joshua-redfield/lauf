###################################################
# Program Search v0.1.0                           #
# (c) 2010 hunterm.haxxr@gmail.com                #
# Summary:                                        #
# Searches for programs on the system using $PATH #
# Usage:                                          #
# program <query>                                 #
# Dependencies:                                   #
# find ############################################
# $PATH ###########################################
###################################################
# Functions #
#############
_find() {
        notify-send "${lauf_app_name}" "Looking for ${search}..." -i "${lauf_app_icon}"
        LOOKIN=$(echo $PATH | tr ':' ' ')
        find $LOOKIN | grep "${search}" | zenity --width=${lauf_width} --height=$(($lauf_height-100)) --window-icon=$lauf_app_icon --list --editable --title  "${lauf_app_name}" --text "Results will appear as they are found\nTip: Click twice to be able to copy.\nYou can also select a program and then press OK to launch it." --column "Results for $search"
        if [ $? = "0" ]; then
            eval `${search}` &
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
if [ -n "$lauf_exec2" ]; then
    search=$lauf_exec2
    _find
    return
fi
########################################################
# GUI Code                                             #
########################################################
search=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What is the program you want to look for?")
case $? in
    0)
        _find
        return
    ;;
    1)
        exec $0
    ;;
    *)
        return
    ;;
esac
