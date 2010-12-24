########################################################
# Weather v0.1.0                                          #
# (c) 2010 joshua.redfield(AT)gmail.com                #
# Summary:                                             #
# Interested in knowing your local weather? #######################
# Usage:                                               #
# weather, weather ZIPCODE
# Dependencies:                                        #
# wget, sed, grep #################################################
########################################################
# Functions #
#############
weather () {
    weather_url="http://www.google.com/ig/api?weather=$weather_zipcode&hl=en"
    weather_wget=$(wget -q $weather_url -O -)
    weather_xml=$(echo "$weather_wget" | sed 's/<forecast_conditions>.*//')
    weather=$(echo "$weather_xml" | sed 's/></>\n</g')
    weather_city=$(echo "$weather" | grep -e '<city' | sed -e 's/<city data="//' -e 's/"\/>//')
    weather_condition=$(echo "$weather" | grep -e '<condition' | sed -e 's/<condition data="//' -e 's/"\/>//')
    weather_temp_f=$(echo "$weather" | grep -e '<temp_f' | sed -e 's/<temp_f data="//' -e 's/"\/>//')
    weather_temp_c=$(echo "$weather" | grep -e '<temp_c' | sed -e 's/<temp_c data="//' -e 's/"\/>//')
    weather_humidity=$(echo "$weather" | grep -e '<humidity' | sed -e 's/<humidity data="//' -e 's/"\/>//')
    weather_wind=$(echo "$weather" | grep -e '<wind' | sed -e 's/<wind_condition data="//' -e 's/"\/>//')
     lauf_notify "$weather_city" "Condition: $weather_condition 
    Temperature: $weather_temp_f f / $weather_temp_c c
    $weather_humidity 
    $weather_wind"
    return
}
########################################################
# Arguements for skipping GUI                          #
########################################################
if [ ! ${lauf_exec2:=unset} = "unset" ]; then
    weather_zipcode=$lauf_exec2
    weather
   return
fi
########################################################
# GUI Code                                             #
########################################################
weather_zipcode=$(zenity --entry --width=${lauf_width} --window-icon=$lauf_app_icon --title="${lauf_app_name}" --text="Enter your 5-Digit zip code $_master?")
case $? in
    0)
    weather
    ;;
    *)
        return
    ;;
esac
