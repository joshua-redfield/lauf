########################################################
# Lauf.Calc                                            #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Functions                                            #
########################################################
_calc() {
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
get_math=$(zenity $lauf_app_options --entry --width=${lauf_width} --title="${lauf_app_name}" --text="Enter a simple arbitary math equation below\nTip: You can also use calc 1+1")
case $? in
    0)
        _calc
        return
        ;;
    1)
        exec $0
esac
return
