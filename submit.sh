allData=`nest.py --user $1 --password $2 show`
eco=`echo "$allData" | grep "eco\."`

targetTemp=`echo "$allData" | grep "target_temperature\." | egrep -o "[0-9]+\.[0-9]?"`
currentTemp=`echo "$allData" | grep "current_temperature\." | egrep -o "[0-9]+\.[0-9]?"`
heatingOn=`echo "$allData" | grep  "hvac_heater_state[\.]*:.*" | egrep -o "\s.*" | egrep -o "[A-Za-z]+"`

# if [[ $eco = *"schedule"* ]]; then
	
# el
if [[ $eco = *"auto-eco"* ]]; then
  targetTemp=`echo "$allData" | grep "away_temperature_low\." | egrep -o "[0-9]+\.[0-9]?"`
elif [[ $eco = *"manual-eco"* ]]; then
  targetTemp=`echo "$allData" | grep "away_temperature_low\." | egrep -o "[0-9]+\.[0-9]?"`
fi

currentField="entry.1120619444"
targetField="entry.23449027"
onField="entry.333433863"

curl https://docs.google.com/forms/d/$3/formResponse -d ifq -d $currentField=$currentTemp -d $targetField=$targetTemp -d $onField=$heatingOn -d submit=Submit

echo "target $targetTemp"
echo "heatingOn $heatingOn"
echo "currentTemp $currentTemp"
# current=`nest.py --user $1 --password $2 --celsius curtemp`
# target=`nest.py --user $1 --password $2 --celsius tartemp`
# eco=`nest.py --user $1 --password $2 --celsius eco`

# curl -X POST -H "Content-Type: application/json" -d '{"value1":"'${current}'","value2":"'${target}'"}' https://maker.ifttt.com/trigger/nest_temp/with/key/$3

