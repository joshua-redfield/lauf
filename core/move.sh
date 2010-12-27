########################################################
# Lauf.Move                                            #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ] && [ ${lauf_exec3:=unset} = "to" ] && [ ! ${lauf_exec4:=unset} = "unset" ]; then
   mv "$lauf_exec2" "$lauf_exec4"
   lauf_notify "Moving file:" "$lauf_exec2 to $lauf_exec4"
   return
fi
########################################################
# GUI Code                                             #
########################################################
cd $HOME
file=$(zenity $lauf_app_options --file-selection --title=${lauf_app_name}" - $lauf_exec1")
case $? in
    0)
        dir=$(zenity $lauf_app_options --file-selection --directory --title=${lauf_app_name}" - $lauf_exec1")
        mv "$file" "$dir"
        lauf_notify "Moving file:" "$file to $dir"
        return
        ;;
    1)
        lauf_cancel
esac
return
