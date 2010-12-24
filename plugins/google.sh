########################################################
# Google v0.2.0                                        #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Allows you to perform google searches inside lauf ####
# Usage:                                               #
# google, or google SEARCH #############################
# Dependencies:                                        #
# gconfigtool-2, a working web browser #################
########################################################
########################################################
# Functions / Variables                                #
########################################################
lauf_plugin_name="Google Search"
default_browser=$(gconftool-2 --get '/desktop/gnome/url-handlers/http/command' | cut -f1 -d' ')
google='http://google.com/#q='

_google() {
   lauf_notify "${lauf_app_name} - Google" "Searching for: $google_search"
   $default_browser $google"${google_search}"
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
   google_search=${lauf_exec#"google "}
   _google
   return
fi
########################################################
# GUI Code                                             #
########################################################
google_search=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What are you searching google for?\nNote: You're a dumbass")
case $? in
    0)
        _google
        return;;
    1)
        exec $0;;
esac
