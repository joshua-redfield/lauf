########################################################
# PLUGIN_NAME v0.1.0                                   #
# EMAIL                                                #
# Summary:                                             #
# Most basic plugin ####################################
# Usage:                                               #
# Descripting on how to use plugin #####################
# Dependencies:                                        #
# Any dependencies #####################################
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! $lauf_exec2 = "" ]; then
   $notify=$lauf_exec2
   lauf_notify "You typed:" "$lauf_exec2"
   return
fi
########################################################
# GUI Code                                             #
########################################################
PLUGIN_NAME=$(zenity $lauf_app_options --entry --title="${lauf_app_name}" --text="Type something")
case $? in
    0)
        $notify=$PLUGIN_NAME
        lauf_notify "You typed:" "$notify"
        return;;
    1)
        lauf_notify "Canceled" "Cancel button was pressed"
        exec $0;;
esac

