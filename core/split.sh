########################################################
# Lauf.Split                                           #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
########################################################
# Functions                                            #
########################################################
_split() {
        size=$(cksum "$file" | cut -d" " -f2)
        value=$(($size/2))
        split=$(zenity $lauf_app_options --scale --text="Split file into peices/nTip: This only shows bytes for sizes" --value=$value --max-value=$size --min-value="1")
        dir=$(dirname "$file")
        base=$(basename "$file")
        cd $dir
        split --bytes=$split "$file" "$base."
}
########################################################
# Arguements for skipping GUI                          #
# split file into amount                               #
########################################################
if [ ! $lauf_exec2 = "" ]; then
   cd $HOME
   file="$lauf_exec2"
   _split
   return
fi
########################################################
# GUI Code                                             #
########################################################
file=$(zenity $lauf_app_options --file-selection)
case $? in
    0)
        cd $HOME
        _split
        return
        ;;
    *)
        exec $0
esac
