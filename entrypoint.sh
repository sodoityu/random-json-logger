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
   "host":"reg-bkkkw0-001.apps.reg-mcp-001.xlcp.p1.openshiftapps.com.awsres.local",
   "status":"200",
   "remote_addr":"127.0.0.6",
   "remote_user":"",
   "request_method":"GET",
   "request_uri":"/event/v1/socket/?token=04C50EBB-CF75-4E61-98EF-3BA65B8927E8&EIO=4&transport=polling&t=PTxmv-e",
   "server_protocol":"HTTP/1.1",
   "body_bytes_sent":"118",
   "request_time":"0.001",
   "upstream_response_time":"0.001",
   "http_referer":"https://reg-bkkkw0-001.apps.reg-mcp-001.xlcp.p1.openshiftapps.com.awsres.local/business/61075874/preparing/additional",
   "http_user_agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0",
   "http_x_forwarded_for":"10.128.64.8",
   "http_x_forwarded_proto":"https"
}')
   
   case "$instruction" in
      "1") echo {\"level\":\"info\",\"ts\":\"2025-05-14T11:21:37.353Z\",\"logger\":\"controllers.GatewayCluster\",\"msg\":\"Cluster Status\",\"gatewaycluster"\":{\"name\":\"gwv6\",\"namespace\":\"xxxx\"},\"Condition:\":\"DeploymentReady\"}"
      ;;
      "2") echo "$JSON"
      ;;
      "3") echo "{\"@timestamp\": \"$d\", \"￥level\": \"WARN\", \"message2\": \"Jacob test to see if this can all be included.\"}"
      ;;
      "4") echo "{\"type\":\"liberty_message\",\"host\":\"xxxx\",\"ibm_userDir\":\"\/opt\/ibm\/wlp\/usr\/\",\"ibm_serverName\":\"defaultServer\",\"message\":\"sql_log 2025-05-09 11:33:04.348 SQL xxxx Default Executor-thread-425|559 xxxxxxx preparedStatement: jp.xxxx.wrapper.ConnectionWrapper@5bbbb63e: jp.xxxx.jdbc.internal.wrapper.PreparedStatementWrapper@xxxx:        SELECT      aaaa     ,xxxx    FROM     (      (      SELECT         1       ,aaa AS aaa       ,bbb AS bbb      FROM       ccc.ccc      WHERE       ddd >= 100      ORDER BY        bbb)      UNION ALL      (      SELECT        2       ,ccc AS ccc       ,lll AS lll      FROM       aaa.aaa      WHERE       ddd < 100      ORDER BY       sdn_list_id      )     ORDER BY      1     )      --aaaa\",\"ibm_threadId\":\"0000022f\",\"ibm_datetime\":\"2025-05-09T11:33:04.348+0900\",\"module\":\"SystemOut\",\"loglevel\":\"SystemOut\",\"ibm_methodName\":\"\",\"ibm_className\":\"\",\"ibm_sequence\":\"1746757984348_0000000006B66\",\"ext_appName\":\"aaaaa\",\"ext_thread\":\"Default Executor-thread-425\"}"
      ;;
   esac
done
