current=`nest.py --user $1 --password $2 --celsius curtemp`
target=`nest.py --user $1 --password $2 --celsius tartemp`

curl -X POST -H "Content-Type: application/json" -d '{"value1":"'${current}'","value2":"'${target}'"}' https://maker.ifttt.com/trigger/nest_temp/with/key/$3