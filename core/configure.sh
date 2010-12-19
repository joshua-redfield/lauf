########################################################
# Configuration                                        #
# (c) 2010 hunterm.haxxr@gmail.com                     #
########################################################
if [ -f "${lauf_app_dir}/lauf.cfg" ];then
    continue #lauf.cfg exists, continue as normal
else
    # file doesen't exist, create a lauf.cfg.
cat <<EOF
#SETTINGS
## MAIN::
#   lauf_width = Default application width
#   Note: This may not change various external plugin dimentions
#
#   lauf_height = Default application height
#   Note: This may not change various external plugin dimentions
#
#   lauf_notify_style = Style of notification
#   Valid options: notify-osd, message
#
#   lauf_notify_timeout = How long to display notifications
#   use seconds for time
#
#   lauf_app_timeout = When to close window for activity
#   0 = keep open
#   use seconds for time
#
#   lauf_app_tips = Show tips with application windows
#   0 = False, 1 = True
#
## GMAIL PLUGIN::
#   gmail_username = your gmail username, basename
#   ex. gmail_username="hunterm.haxxr"
#   gmail_password = your gmail password
#   ex. gmail_password="blahblahblah"
#
## TWEET PLUGIN::
#   tweet_user = your twitter username
#   ex. tweet_user="hablabla"
#   tweet_pass = your twitter password
#   ex. tweet_pass="lolololo"
#
## ROOT PLUGIN::
#   sudo_command = command to use when launching commands as root
#   ex. sudo_command="gksudo"
lauf_width="400"
lauf_height="400"
lauf_notify_style="notify-osd"
lauf_notify_timeout="10"
lauf_app_timeout="0"
lauf_app_tips="0"

gmail_username=""
gmail_password=""

tweet_user=""
tweet_pass=""

sudo_command="gksudo"
EOF
fi

zenity ${lauf_app_options} --no-wrap --info --text="`cat "${lauf_app_dir}/lauf.cfg" | grep -v "^$" | grep '#' \
| sed 's/## /<b>/;s/::/<\/b>/;s/#//g;s/# //;s/SETTINGS/<big>Configuration Help<\/big>/'\
| grep -v '^$'`\nNow move me to the side of the screen so you can start editing" &

helpcfg=$(cat "${lauf_app_dir}/lauf.cfg" | grep '#')
cfgtemp="/tmp/lauf.$RANDOM" # generate random filename
> "$cfgtemp" # make the file

cat "${lauf_app_dir}/lauf.cfg" | grep -v '#' | zenity ${lauf_app_options} --width=${lauf_width} --height=${lauf_height} $lauf_app_options --text-info --editable 1>"$cfgtemp"

printf "$helpcfg" >"${lauf_app_dir}/lauf.cfg"
echo >>"${lauf_app_dir}/lauf.cfg"
cat "$cfgtemp" >>"${lauf_app_dir}/lauf.cfg"
echo >>"${lauf_app_dir}/lauf.cfg"

rm -f "$cfgtemp"

case $? in
    0)
        return
        ;;
    1)
        exec $0
esac
return
