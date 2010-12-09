########################################################
# Extract v0.2.0                                       #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Check gmail account for new e-mails. #################
# Usage:                                               #
# gmail\nMust define username and password in script ###
# Dependencies:                                        #
# wget #################################################
########################################################
user_name=""
pass_word=""
if [ "$user_name" = "" ]; then
    zenity --error --text="Username has not been set in script"
    exec $0;
    elif [ "$pass_word" = "" ]; then
        zenity --error --text="Password has not been set in script"
        exec $0
fi
gmail=$(wget -T 3 -t 1 -q --secure-protocol=TLSv1 \
 --no-check-certificate \
 --user=${user_name} --password=${pass_word} \
 https://mail.google.com/mail/feed/atom -O - \
 | wc -l)
wait
if [ $gmail -gt "8" ]; then
 notify-send "${lauf_app_name} - Gmail" "You have new mail waiting" -i "${lauf_app_icon}"
 return
else
 notify-send "${lauf_app_name} - Gmail" "You have no unread mail" -i "${lauf_app_icon}"
 return
fi

