#!/bin/sh
while [ 1 ]
do
   waitTime=$(shuf -i 1-5 -n 1)
   sleep $waitTime &
   wait $!
   instruction=$(shuf -i 0-4 -n 1)
   d=`date -Iseconds`
   case "$instruction" in
      "1") echo "{\"@timestamp\": \"$d\", \"level\": \"ERROR\", \"message\": \"something happened in this execution.\"}"
      ;;
      "2") echo "{\"@timestamp\": \"$d\", \"level\": \"INFO\", \"message\": \"takes the value and converts it to string.\"}"
      ;;
      "3") echo "{\"@timestamp\": \"$d\", \"level\": \"WARN\", \"message2\": \"Jacob test to see if this can all be included.\"}"
      ;;
      "4") echo "{\"type\":\"liberty_message\",\"host\":\"reg001bkscs0\",\"ibm_userDir\":\"\/opt\/ibm\/wlp\/usr\/\",\"ibm_serverName\":\"defaultServer\",\"message\":\"sql_log 2025-05-09 11:33:04.348 SQL reg001bkscs0 Default Executor-thread-425|559 b2f93e63-c3ce-4329-a51f-f3d04c01a963 gIfYhbvs0L3_0Iz_p4nSVvG preparedStatement: jp.mufg.bk.darwin.core.jdbc.internal.wrapper.ConnectionWrapper@5bbbb63e: jp.mufg.bk.darwin.core.jdbc.internal.wrapper.PreparedStatementWrapper@be96d20b:        SELECT      listname     ,sdnlistid    FROM     (      (      SELECT         1       ,sdn_list_id AS sdnlistid       ,sdn_list_name AS listname      FROM       GAI1SCHM.tmlq_sdnlst_mst      WHERE       sdn_list_id >= 100      ORDER BY        sdn_list_name)      UNION ALL      (      SELECT        2       ,sdn_list_id AS sdnlistid       ,sdn_list_name AS listname      FROM       GAI1SCHM.tmlq_sdnlst_mst      WHERE       sdn_list_id < 100      ORDER BY       sdn_list_id      )     ORDER BY      1     )      --12ea42ee\",\"ibm_threadId\":\"0000022f\",\"ibm_datetime\":\"2025-05-09T11:33:04.348+0900\",\"module\":\"SystemOut\",\"loglevel\":\"SystemOut\",\"ibm_methodName\":\"\",\"ibm_className\":\"\",\"ibm_sequence\":\"1746757984348_0000000006B66\",\"ext_appName\":\"fcaon\",\"ext_thread\":\"Default Executor-thread-425\"}"
      ;;
   esac
done
