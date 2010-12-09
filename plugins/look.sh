########################################################
# Look v0.3.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Lost a file? Find it with this #######################
# Usage:                                               #
# look for FILE_NAME, or look in DIRECTORY for FILE_NAME, or look
# Dependencies:                                        #
# find #################################################
########################################################
# Functions #
#############
_find() {
        notify-send "${lauf_app_name}" "Looking in ${search_dir} for ${search}" -i "${lauf_app_icon}"
        find . -name "*${search}*" | zenity --width=${lauf_width} --height=$(($lauf_height-100)) --window-icon=$lauf_app_icon --list --editable --title  "${lauf_app_name}" --text "Results will appear as they are found\nTip: Click twice to be able to copy" --column "Results for $search"
        if [ $? = "0" ]; then
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
if [ $lauf_exec2 = "for" ]; then
    search=$lauf_exec3
    search_dir="filesystem"
    cd "/"
    _find
    return
elif [ $lauf_exec2 = "in" ]; then
    search_dir=$lauf_exec3
    search=$lauf_exec5
    cd $search_dir
    _find
    return
fi
########################################################
# GUI Code                                             #
########################################################
search=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What can I help you find $_master?")
case $? in
    0)
        cd "/"
        search_dir="filesystem"
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
