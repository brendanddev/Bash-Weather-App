#!/bin/bash

# Script: weather.sh
# Author: Brendan Dileo
# Version v0.1
# Description: The purpose of this Bash script is to retreive current weather data, and display the weather data for the current locations weather using the OpenWeatherMap API. The script will fetch the IP address through the ipinfo API.


GREEN='\033[0;32m' # Color codes for corresponding colors
YELLOW='\033[0;33m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
REGULAR='\033[0m'

API_KEY="enter_openweathermap_api_key" # OpenWeatherMap API Key --> Replace with your own

LOCATION=$(curl -s https://ipinfo.io) # Fetches location data based on users ip, stores in json

if [[ -z "$LOCATION" ]]; then # Checks if the location variable is empty or not set
    echo "Uh Oh! We were unable to retreive your location data! Please ensure you have a valid internet connection!"
    exit 1
fi # End of conditional (if block)

# Uses jq to parse JSON
LAT=$(echo $LOCATION | jq -r '.loc' | cut -d ',' -f1) # Retreives latitude from location data
LON=$(echo $LOCATION | jq -r '.loc' | cut -d ',' -f2) # Retreives longitued from location

# Uses curl for data transfer from server to network protocols
WEATHER=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LON&appid=$API_KEY&units=metric") # Makes http request to API passing latitide, longitude, and API key as query params


CITY=$(echo $WEATHER | jq -r '.name') # Retreives name of the city from the weather data
TEMP=$(echo $WEATHER | jq -r '.main.temp') # Retreives current temperature
DESCRIPTION=$(echo $WEATHER | jq -r '.weather[0].description') # Retreives the weather description

if [[ "$DESCRIPTION" == "clear sky" ]]; then # Checks the value of the description var
    ICON="☀️" # Clear/sunny weather
elif [[ "$DESCRIPTION" == "few clouds" ]]; then
    ICON="☁️"  # cloudy
elif [[ "$DESCRIPTION" == "rain" || "$DESCRIPTION" == "light rain" || "$DESCRIPTION" == "moderate rain" || "$DESCRIPTION" == "heavy rain" ]]; then
    ICON="🌧️"  # rainy
elif [[ "$DESCRIPTION" == "snow" ]]; then
    ICON="❄️"  # snowy weather
elif [[ "$DESCRIPTION" == "thunderstorm" ]]; then
    ICON="⚡"  # stormy weather
else
    ICON="🌥️"  # default icon
fi # end conditional


if (( $(echo "$TEMP < 0" | bc -l) )); then # Check temp, use 'echo' to construct str
    TEMPICON="🧊"
elif (( $(echo "$TEMP >= 0 && $TEMP < 20" | bc -l) )); then
    TEMPICON="🌤️"
elif (( $(echo "$TEMP >= 20" | bc -l) )); then
    TEMPICON="🔥"
fi # end if
    
# Display weather info
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${YELLOW}Weather Script - Version 0.1${REGULAR}"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN} Weather for $CITY 🏙️"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE} Temperature: $TEMP °C $TEMPICON"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${PURPLE} Condition: $DESCRIPTION $ICON"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
