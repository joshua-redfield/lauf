########################################################
# Process v0.3.0                                       #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Shows a simple process list allowing you to kill a process
# Usage:                                               #
# process ##############################################
# Dependencies:                                        #
# ps, killall ##########################################
########################################################
com1='zenity --title="'${lauf_app_name}' - Process" --window-icon='${lauf_app_icon}' --text="Select a process to kill.\nNote: Will kill all of process name" --height='${lauf_height}' --width='${lauf_width}' --list --separator=" & " --radiolist --column="Select" --column="Process Name"'
########################################################
# Get process list                                     #
########################################################
#TODO: This attempts to limit the number of dulplicate #
#processes that ps shows. Doesn't work perfectly, but  #
#does slim the list down some                          #
########################################################
prevapp=12345QWERTY
for app in `ps xo comm`
do
    if [ $app != $prevapp ];
    then
    com2=" \"\" \"$app\""
    com1=$com1$com2
    fi
    prevapp=$app
done

test=`eval "$com1"`
case $? in
"0")
    killall ${test}
;;
"1")
    exec $0
;;
esac

