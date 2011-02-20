########################################################
# define v0.1.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Use google define service to look up any word or phrase #######################
# Usage:                                               #
# define WORD, or define
# Dependencies:                                        #
# curl, w3m, awk, xclip(optional) #################################################
########################################################
# Functions #
#############
google_define () {
    define=$(curl -s -A 'Mozilla/4.0'  'http://www.google.com/search?q=define:+'$google_define_var2 \
| w3m -dump -T text/html)
    define_temp=$(echo $define | awk -F'●' '{ print $2 }')
    lauf_notify "Google Define: $google_define_var" "$define_temp"
    if type "xclip" >/dev/null; then
        echo "$define_temp" | xclip -selection clipboard
    fi
    return
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   google_define_var=${lauf_exec#"$lauf_exec1 "}
   google_define_var2=$(echo $google_define_var | tr -s ' ' '+')
   google_define
   return
fi
########################################################
# GUI Code                                             #
########################################################
google_define_var=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What would you like Google to define $_master?")
case $? in
    0)
    google_define_var2=$(echo google_define_var | tr -s ' ' '+')
    google_define
    ;;
    *)
    lauf_cancel
    ;;
esac
