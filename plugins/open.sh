########################################################
# open v0.4.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Open any file with it's default application.##########
# Usage:                                               #
# open, or open FILE_NAME FILE_NAME2 ECT ###############
# Dependencies:                                        #
# xdg-open #############################################
########################################################
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   lauf_exec=${lauf_exec#"$lauf_exec1 "}
   lauf_notify "Opening File(s):" "$lauf_exec"
   for arg in $lauf_exec
   do
        if [ ! $arg = $lauf_exec1 ]; then
            xdg-open "$arg"
        fi
   done
   return
fi
########################################################
# GUI Code                                             #
########################################################
cd $HOME
arg=$(zenity $lauf_app_options --file-selection --title=$lauf_app_name" - $1")
case $? in
    0) 
        arg=${arg#"$lauf_exec1 "}
        lauf_notify "Opening File(s):" "$arg"
        xdg-open "$arg"
        return
        ;;
    1)
        lauf_cancel
        ;;
esac
return
