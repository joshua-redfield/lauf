########################################################
# Lauf.Help                                            #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
if [ ${lauf_exec2:=unset} = "with" ]; then
    manual=$lauf_exec3
    test=$(man $manual)
    if [ ! -z "$test" ]; then
        man ${manual} | zenity $lauf_app_options --text-info --width=$(($lauf_height+200)) --height=${lauf_height}
    else
        info ${manual} | zenity $lauf_app_options --text-info --width=$(($lauf_height+200)) --height=${lauf_height}
    fi
    return
fi
zenity $lauf_app_options --text-info --width=$(($lauf_height+200)) --height=${lauf_height} --title="${lauf_app_name}" --filename="${lauf_app_dir}/README.txt"
if [ $? = 0 ]; then
    lauf_cancel
else
    return
fi
