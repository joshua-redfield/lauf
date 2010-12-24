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
        xdg-open "$arg"
        return
        ;;
    1)
        exec $0
        ;;
esac
return
