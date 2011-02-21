#~/usr/bin/env sh

sp=$1
dp=$2
p=$3
w=$4

curl --data-urlencode "" "http://127.2.0.3:8003/api?sp=$sp&dp=$dp&p=$p&w=$w" &

curl --data-urlencode "" "http://statusongae.appspot.com/api?sp=$sp&dp=$dp&p=$p&w=$w" &
