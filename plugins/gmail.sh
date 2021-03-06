########################################################
# gmail v0.2.0                                         #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Check gmail account for new e-mails. #################
# Usage:                                               #
# gmail\nMust define username and password in script ###
# Dependencies:                                        #
# wget #################################################
########################################################
if [ "$gmail_username" = "" ]; then
    zenity --error --text="Username has not been set in lauf.cfg"
    lauf_cancel;
    elif [ "$gmail_password" = "" ]; then
        zenity --error --text="Password has not been set in lauf.cfg"
        lauf_cancel
fi
gmail=$(wget -T 3 -t 1 -q --secure-protocol=TLSv1 \
 --no-check-certificate \
 --user=${gmail_username} --password=${gmail_password} \
 https://mail.google.com/mail/feed/atom -O - \
 | wc -l)
wait
if [ $gmail -gt "8" ]; then
 lauf_notify "${lauf_app_name} - Gmail" "You have new mail waiting"
 return
else
 lauf_notify "${lauf_app_name} - Gmail" "You have no unread mail"
 return
fi
