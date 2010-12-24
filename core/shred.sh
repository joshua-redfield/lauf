########################################################
# Lauf.Shred                                           #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   for arg in $lauf_exec
   do
        if [ ! $arg = $lauf_exec1 ]; then
            shred -u "$arg"
            lauf_notify "Shredding:" "$arg"
        fi
   done
   return
fi
########################################################
# GUI Code                                             #
########################################################
cd $HOME
arg=$(zenity $lauf_app_options --file-selection --title=${lauf_app_name}" - $1")
case $? in
    0)
        shred -u "$arg"
        lauf_notify "Shredding:" "$arg"
        return
        ;;
    1)
        exec $0
esac
return
