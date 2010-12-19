########################################################
# Stats v0.2.0                                         #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Shows some basic user and computer information #######
# Usage:                                               #
# stats ################################################
########################################################
shawk () {
  cut -d" " -f$1
}
_computername=`uname -n`
_uptime=$(uptime | shawk '2')
_uptime="${_uptime} hrs"
_memory_total=`free -m | grep Mem: | awk '{ print $2 }'`
_memory_total="${_memory_total} MiB"
_memory_used=`free -m | grep buffers/cache: | awk '{ print $3 }'`
_swap_total=`free -m | grep Swap: | awk '{ print $2 }'`
_swap_total="${_swap_total} MiB"
_swap_used=`free -m | grep Swap: | awk '{ print $3 }'`
_kernel=`uname -sr`
_user=`whoami`
_model=`cat /proc/cpuinfo |grep -m1 "model name" | cut -d' ' -f3-`
notify-send "${lauf_app_name} - Statistics" \
    "Kernel: ${_kernel}
    Host Name: ${_computername}
    Username: ${_user}
    Processor: ${_model}
    Total uptime: ${_uptime}
    Memory: ${_memory_used} / ${_memory_total}
    Swap: ${_swap_used} / ${_swap_total}" \
    -i "${lauf_app_icon}"
return
