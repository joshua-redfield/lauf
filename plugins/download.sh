########################################################
# Download v0.2.0                                      #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Download a direct URL or FTP file ####################
# Usage:                                               #
# download, or download URL/FTP ########################
# Dependencies:                                        #
# wget #################################################
########################################################
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
    save_location=$HOME
    _download=$lauf_exec2
    wget -O "${save_location}" "${__download}" 2>&1 | sed -u 's/.* \([0-9]\+%\)\ \+\([0-9.]\+.\) \(.*\)/\1\n# Speed: \2\/s, ETA: \3/' | zenity --progress --title="Downloading" --window-icon=${lauf_app_icon} --width=${lauf_width} --auto-close --auto-kill
    lauf_notify "Download" "${download} Complete!"
    return
fi
########################################################
# GUI Code                                             #
########################################################
__download=$(zenity --entry --width=${lauf_width} --title="${lauf_app_name}" --window-icon="${lauf_app_icon}" --text="What's the URL of the file?\nNote: Both HTTP and FTP work" $icon)
case $? in
0)
    cd $HOME
    save_location=$(zenity --file-selection --save --window-icon="${lauf_app_icon}" --title="${lauf_app_name} - Where do you want to save the download?" $icon)
    wget -O "${save_location}" "${__download}" 2>&1 | sed -u 's/.* \([0-9]\+%\)\ \+\([0-9.]\+.\) \(.*\)/\1\n# Speed: \2\/s, ETA: \3/' | zenity --progress --title="Downloading" --window-icon=${lauf_app_icon} --width=${lauf_width} --auto-close --auto-kill
    lauf_notify "Download" "${download} Complete!"
;;
1)
lauf_cancel
esac
