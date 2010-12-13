########################################################
# myip v0.2.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Shows your internet ip address in a notify bubble    #
# Usage:                                               #
# myip #################################################
# Dependencies:                                        #
# curl #################################################
########################################################
MyIp=$(wget -qO - http://www.whatismyip.com/automation/n09230945.asp)
MyLocalIp=$(ip route | sed 's/.*src //' -e 's/ .*//' | head -1)
wait
notify-send "${lauf_app_name} - MyIp" "Your online IP Address is: ${MyIp}\nYour local IP Address is: ${MyLocalIp}" -i "${lauf_app_icon}"
return
