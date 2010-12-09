########################################################
# Lauf.About                                           #
# (c) 2010 joshua.redfield(AT)gmail.com                #
########################################################
plugins=$(ls $lauf_plugin_dir) #get $lauf_plugin_dir contents
core=$(ls $lauf_core_dir) #get $lauf_core_dir contents
#Count total plugins in plugin folder
plugin_count=0
for amount in $plugins
do
plugin_count=$(($plugin_count+1))
done
#Count total core plugins in core folder
core_count=0
for amount in $core
do
core_count=$(($core_count+1))
done
#Add up total core+plugins+3 +3=Bultin plugins
total_plugins=$((3+$core_count+$plugin_count))
#Add up total lines in lauf
line_count=$(wc -l "$lauf_app_dir/lauf" | tr -d '[:alpha:]' | tr -d '[:space:]' | tr -d '[=/=]' | tr -d '[=.=]' | tr -d '[=~=]')
#Add up total lines in plugins
for file in $(ls $lauf_plugin_dir)
do
line_number=$(wc -l "$lauf_plugin_dir/$file" | tr -d '[:alpha:]' | tr -d '[:space:]' | tr -d '[=/=]' | tr -d '[=.=]' | tr -d '[=~=]')
line_count=$(($line_count+$line_number))
done
#Add up total lines in core
for file in $(ls $lauf_core_dir)
do
line_number=$(wc -l "$lauf_core_dir/$file" | tr -d '[:alpha:]' | tr -d '[:space:]' | tr -d '[=/=]' | tr -d '[=.=]' | tr -d '[=~=]')
line_count=$(($line_count+$line_number)) #Total Amount Of Lines
done

message="$lauf_app_name
${lauf_app_motto}
(c) 2010 Joshua Redfield
http://code.google.com/p/lauf\n
Amount of plugins: $total_plugins
Total lines of code: $line_count"

plugin=$(echo "$message" | zenity $lauf_app_options --text-info --title="About" --width=$lauf_width --height=$(($lauf_height-150)))
