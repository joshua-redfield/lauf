########################################################
# Lauf.Plugins                                         #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Arguements for skipping GUI                          #
# plugins + <plugin>                                   #
# plugins - <plugin>                                   #
########################################################
_plugin="${lauf_plugin_dir}/$lauf_exec3.sh"
if [ ${lauf_exec2:=unset} = "-" ] && [ ! ${lauf_exec3:=unset} = "unset" ]; then
    chmod a-x "${_plugin}"
    lauf_notify "Plugin Deactivated:" "${_plugin}"
    return
elif [ ${lauf_exec2:=unset} = "+" ] && [ ! ${lauf_exec3:=unset} = "unset" ]; then
    chmod a+x "${_plugin}"
    lauf_notify "Plugin Activated:" "${_plugin}"
    return
elif [ ${lauf_exec2:=unset} = "--" ]; then
    cd $lauf_plugin_dir
    chmod a-x *.*
    lauf_notify "Plugin Deactivated:" "All plugins"
    return
elif [ ${lauf_exec2:=unset} = "++" ]; then
    cd $lauf_plugin_dir
    chmod a+x *.*
    lauf_notify "Plugin Activated:" "All plugins"
    return
fi
########################################################
# GUI Code                                             #
########################################################
com1='zenity '$lauf_app_options' --title="'${lauf_app_name}' - Plugins" --text="Select plugins to activate or deactivate" --height='${lauf_height}' --width='${lauf_width}' --list --separator=" & " --radiolist --column=" " --column="Plugin" --column="Active"'
########################################################
# Get all plugins from the plugin directory            #
########################################################
for app in ${lauf_plugin_dir}/*
do
    if [ -x $app ]; then
       active="Yes"
    else
        active="No"
    fi 
    com2=" \"\" \"$app\" \"$active\""
    com1=$com1$com2
done

test=$(eval "$com1")
########################################################
# Check to see if plugin is activated already or not   #
# If the plugin is, ask to deactivate. Else, Ask to    #
# activate.                                            #
########################################################
case $? in
0)
summ=$(head -n5 $test | tail -n1 | tr -d '#') # get line 5 of plugin.sh
usage=$(head -n7 $test | tail -n1 | tr -d '#')
depends=$(head -n9 $test | tail -n1 | tr -d '#') # get line 8 of plugin.sh
plugin_name=$(basename $test | cut -d'.' -f1) # output filename without extension
if [ -x $test ]; then
    deactivate=$(zenity $lauf_app_options --title="${lauf_app_name} - Plugins"  --question --text "$plugin_name is active, Would you like to deactivate?")
    if [ $? = 0 ]; then
        chmod a-x $test
        lauf_notify "Plugin Deactivated:" "${plugin_name}"
        lauf_cancel
    else
        lauf_cancel
    fi
else
    activate=$(zenity $lauf_app_options --title="${lauf_app_name} - Plugins" --question --text "$plugin_name:$summ\n\nDependencies:$depends\n\nUsage:$usage\n\nThis plugin is not active, Would you like to activate?")
    if [ $? = 0 ]; then
    chmod a+x $test
    lauf_notify "Plugin Activated:" "${plugin_name}"
    lauf_cancel
    else
       lauf_cancel
    fi
fi
;;
1)
lauf_cancel
;;
esac

