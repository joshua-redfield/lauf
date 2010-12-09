########################################################
# Close v0.2.0                                         #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Allows forcing an application window to close ########
# Usage:                                               #
# close, or close WINDOW_NAME###########################
# Dependencies:                                        #
# xkill, killall #######################################
########################################################
if [ ! $lauf_exec2 = "" ]; then
   killall $lauf_exec2
   return
fi
notify-send "${lauf_app_name} - Close" "Click an application window to kill" -i "${lauf_app_icon}"
exec xkill

