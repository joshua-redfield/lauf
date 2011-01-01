########################################################
# tweet v0.4.0                                         #
# (c) 2010 joshua.redfield(AT)gmail.com & hunterm.haxxr@gmail.com
# Summary:                                             #
# Update twitter status ################################
# Usage:                                               #
# twitter, or twitter STATUS_UPDATE ####################
# Dependencies:                                        #
# wget                                                 #
########################################################
if [ "$tweet_user" = "" ]; then
    zenity --error --text="Username has not been set in script"
    lauf_cancel;
    elif [ "$tweet_pass" = "" ]; then
        zenity --error --text="Password has not been set in script"
        lauf_cancel
fi
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! $lauf_exec2 = "" ]; then
    tweet=${@#"tweet "}
    count=$(echo "$tweet" | wc -m)
    [ $count -gt 140 ] && zenity --error $lauf_app_icon --title=${lauf_app_name} --text="Your tweet was $count characters, the maximum is 140 characters!\nYour TWEET was NOT sent!" && return
    wget -qO - --post-data="status=${tweet}" --http-user="$tweet_user" --http-password="$tweet_pass" http://api.supertweet.net/statuses/update.xml
    lauf_notify "${lauf_app_name} - Twitter" "Status changed to: ${tweet}"
    return
fi
########################################################
# GUI Code                                             #
########################################################
tweet=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="What's happening?\nNote: Max 140 Characters!")
case $? in
    0)
        count=$(echo "$tweet" | wc -m)
        [ $count -gt 140 ] && zenity --error $lauf_app_icon --title=${lauf_app_name} --text="Your tweet was $count characters, the maximum is 140 characters!\nYour TWEET was NOT sent!" && exit
        wget -qO - --post-data="status=${tweet}" --http-user="$tweet_user" --http-password="$tweet_pass" http://api.supertweet.net/statuses/update.xml
        lauf_notify "${lauf_app_name} - Twitter" "Status changed to: ${tweet}"
        return;;
    1)
        lauf_cancel;;
esac

