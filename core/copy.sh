########################################################
# Lauf.Copy                                            #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ] && [ ${lauf_exec3:=unset} = "to" ] && [ ! ${lauf_exec4:=unset} = "unset" ]; then
   cp "$lauf_exec2" "$lauf_exec4"
   lauf_notify "Copying file:" "$lauf_exec2 to $lauf_exec4"
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
        cp "$file" "$dir"
        lauf_notify "Copying file:" "$file to $dir"
        return
        ;;
    1)
        exec $0
esac
return
