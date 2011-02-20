########################################################
# translate v0.1.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Use google translate service to translate words or phrased into a different language #######################
# Usage:                                               #
#  translate LANGUAGE to LANGUAGE PHRASE or translate #
# Dependencies:                                        #
# curl, sed #################################################
########################################################
# Functions #
#############
google_translate () {
    translate=$(curl -s -A 'Mozilla/4.0' "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$translate_text&langpair=${lauf_exec2}|${lauf_exec4}" | \
sed -E -n 's/[[:alnum:]": {}]+"translatedText":"([^"]+)".*/\1/p';)
    lauf_notify "Google Translate: $translate_text_first" "$translate"
    return
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ] && [ ! $lauf_exec2 = "" ] && [ $lauf_exec3 = "to" ] && [ ! $lauf_exec4 = "" ] && [ ! $lauf_exec5 = "" ]; then
   #google_define_var=${lauf_exec#"$lauf_exec1 "}
   translate_text_first=${lauf_exec#"$lauf_exec1 $lauf_exec2 $lauf_exec3 $lauf_exec4 "}
   translate_text=$(echo $translate_text_first |  tr -s ' ' '+') #Change spaces into plus signs
   google_translate
   return
fi
########################################################
# GUI Code                                             #
########################################################
google_translate=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What word or phrase are you trying to translate $_master?")
case $? in
    0)
    lauf_exec2=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What language are you translating from $_master?")
    lauf_exec4=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What language are you translating to $_master?")
    translate_text=$(echo $google_translate |  tr -s ' ' '+') #Change spaces into plus signs
    translate_text_first=$google_translate
    google_translate
    ;;
    *)
    lauf_cancel
    ;;
esac
