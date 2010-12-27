########################################################
# Extract v0.2.0                                       #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Allows you to extract many different archive types.  #
# Usage:                                               #
# extract or extract FILE_NAME to DIRECTORY#############
# Dependencies:                                        #
# tar, binzip2, rar, gunzip, unzip, uncompress, 7z, xz #
########################################################
extract () {
    if [ -f "$1" ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1;;
        *.tar.gz)    tar xzf $1;;
        *.tar.lzma)  tar --lzma xf $1;;
        *.bz2)       bunzip2 $1;;
        *.rar)       rar x $1;;
        *.gz)        gunzip $1;;
        *.tar)       tar xf $1;;
        *.tbz2)      tar xjf $1;;
        *.tgz)       tar xzf $1;;
        *.zip)       unzip $1;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1;;
        *.xz)        xz x $1;;
        *)           zenity --error --window-icon="${lauf_app_icon}" \
                     --title="${lauf_app_name}" \
                     --text="$1 is not a valid archive";;
      esac
    fi
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ] && [ ${lauf_exec3:=unset} = "to" ] && [ ! ${lauf_exec4:=unset} = "unset" ]; then
    file=$lauf_exec2
    _file=$(basename $file)
    dir=$lauf_exec4
    cd $dir
    lauf_notify "Extracting $_file" "$_file to $dir"
    extract "$file"
    return
fi
########################################################
# GUI Code                                             #
########################################################
cd $HOME
file=$(zenity --window-icon="${lauf_app_icon}" --file-selection --title="${lauf_app_name} - Select an archive")
case $? in
0)
    dir=$(zenity --window-icon="${lauf_app_icon}" --file-selection --directory --title="${lauf_app_name} - Select directory to extract to") && cd $dir
    _file=$(basename $file)
    lauf_notify "Extracting $_file" "$_file to $dir"
    extract "$file"
    return
;;
1)
    lauf_cancel
;;
esac
