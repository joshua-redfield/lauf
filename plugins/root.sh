########################################################
# root v0.3.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com  & hunterm.haxxr@gmail.com                     #
# Summary:                                             #
# Run something as root ################################
# Usage:                                               #
# root, or root APPLICATION_NAME #######################
# Dependencies:                                        #
# gksu, or gksudo ######################################
_sudo_command=gksudo
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   _sudo=$lauf_exec2
   lauf_notify "Root" "Running $_sudo as root"
   ${_sudo_command} ${_sudo}
   return
fi
########################################################
# GUI Code                                             #
########################################################
_sudo=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What are we running as root?\nTip: Caution when running things as root!")
case $? in
    0)
        lauf_notify "Root" "Running $_sudo as root"
        ${sudo_command} ${_sudo}
        return;;
    1)
        lauf_cancel;;
esac
