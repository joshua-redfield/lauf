########################################################
# tweet v0.3.0                                         #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Update twitter status ################################
# Usage:                                               #
# twitter, or twitter STATUS_UPDATE ####################
# Dependencies:                                        #
# tar, binzip2, rar, gunzip, unzip, uncompress, 7z, xz #
########################################################
if [ "$tweet_user" = "" ]; then
    zenity --error --text="Username has not been set in script"
    exec $0;
    elif [ "$tweet_pass" = "" ]; then
        zenity --error --text="Password has not been set in script"
        exec $0
fi
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! $lauf_exec2 = "" ]; then
    tweet=${@#"tweet "}
    count=$(echo "$tweet" | wc -m)
    [ $count -gt 140 ] && zenity --error $lauf_app_icon --title=${lauf_app_name} --text="Your tweet was $count characters, the maximum is 140 characters!\nYour TWEET was NOT sent!" && return
    lauf_notify "${lauf_app_name} - Twitter" "Status changed to: ${tweet}"
    curl -u $tweet_user:$tweet_pass -d status="$tweet" http://twitter.com/statuses/update.xml -# -o /dev/null
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
        lauf_notify "${lauf_app_name} - Twitter" "Status changed to: ${tweet}"
        curl -u $tweet_user:$tweet_pass -d status="$tweet" http://twitter.com/statuses/update.xml -# -o /dev/null
        return;;
    1)
        exec $0;;
esac
