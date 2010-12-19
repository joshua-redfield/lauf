########################################################
# Configuration                                        #
# (c) 2010 hunterm.haxxr@gmail.com                     #
########################################################
zenity ${lauf_app_options} --no-wrap --info --text="`cat "${lauf_app_dir}/lauf.cfg" | grep -v "^$" | grep '#' \
| sed 's/## /<b>/;s/::/<\/b>/;s/#//g;s/# //;s/SETTINGS/<big>Configuration Help<\/big>/'\
| grep -v '^$'`\nNow move me to the side of the screen so you can start editing" &

helpcfg=$(cat "${lauf_app_dir}/lauf.cfg" | grep '#')
cfgtemp=$(mktemp)

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
