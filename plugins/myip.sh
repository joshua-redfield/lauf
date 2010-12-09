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
MyIp=$(curl http://www.whatismyip.com/automation/n09230945.asp)
wait
notify-send "${lauf_app_name} - MyIp" "Your IP Address is: ${MyIp}" -i "${lauf_app_icon}"
return
