readonly lauf_app_dir=$(dirname $0) #Application Directory
readonly lauf_app_icon="${lauf_app_dir}/icons/lauf.png" #Application Icon
readonly lauf_core_dir="${lauf_app_dir}/core" #Core Plugin Directory
readonly lauf_plugin_dir="${lauf_app_dir}/plugins" #Plugin Directory
cd "$lauf_core_dir"
rm -f *~*
cd "$lauf_plugin_dir"
rm -f *~*
cd "$lauf_app_dir"
rm -f *~*
tar czf "$lauf_app_dir"
