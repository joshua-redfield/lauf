########################################################
# Lauf.Calc                                            #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Functions                                            #
########################################################
_configure() {
   calc=$(echo $(($get_math)))
   lauf_notify "Calculator: [ $calc ]" "Long Answer: $get_math=$calc"
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! $lauf_exec2 = "" ]; then
   get_math=$lauf_exec2
   _calc
   return
fi
########################################################
# GUI Code                                             #
########################################################
_configure=$(cat "$lauf_app_dir/lauf.cfg" | zenity $lauf_app_options --width=${lauf_width} --title="${lauf_app_name}" --list --column="Settings" --hide-header --editable --text="")
case $? in
    0)
        _calc
        return
        ;;
    1)
        exec $0
esac
return
