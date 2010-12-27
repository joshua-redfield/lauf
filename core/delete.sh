########################################################
# Lauf.Delete                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
_rm () {
    rm -f "$arg"
    lauf_notify "Trashed:" "$arg"
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   for arg in $lauf_exec
   do
        if [ ! $arg = $lauf_exec1 ]; then
            _rm
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
        _rm
        return
        ;;
    1)
        lauf_cancel
esac
return
