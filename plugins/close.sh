########################################################
# Close v0.2.0                                         #
# (c) 2010 joshua.redfield(AT)gmail.com &  hunterm.haxxr@gmail.com                    #
# Summary:                                             #
# Allows forcing an application window to close ########
# Usage:                                               #
# close, or close WINDOW_NAME###########################
# Dependencies:                                        #
# xkill, killall #######################################
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   killall $lauf_exec2
   return
fi
lauf_notify "Close an application" "Click an application window to kill, to cancel, right click anything"
exec xkill
