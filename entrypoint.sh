#!/bin/sh
while [ 1 ]
do
   waitTime=$(shuf -i 1-5 -n 1)
   sleep $waitTime &
   wait $!
   instruction=$(shuf -i 0-4 -n 1)
   d=`date -Iseconds`
   JSON=$(jq -n -c '{
   "timestamp":"2025-06-17T11:41:47+09:00",
   "http_x_forwarded_proto":"https"
}')
   
   case "$instruction" in
      "1") echo {\"level\":\"info\",\"ts\":\"2025-05-14T11:21:37.353Z\",\"logger\":\"controllers.GatewayCluster\",\"msg\":\"Cluster Status\",\"gatewaycluster"\":{\"name\":\"gwv6\",\"namespace\":\"xxxx\"},\"Condition:\":\"DeploymentReady\"}"
      ;;
      "2") echo "$JSON"
      ;;
      "3") echo "{\"@timestamp\": \"$d\", \"￥level\": \"WARN\", \"message2\": \"Jacob test to see if this can all be included.\"}"
      ;;
      "4") echo "$JSON"
      ;;
   esac
done
