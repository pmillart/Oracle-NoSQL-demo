. ~/Oracle-NoSQL-demo/env.sh
echo Starting at `date`
jps -m | grep $KVROOT

nohup java -jar $KVHOME/lib/kvstore.jar start -root $KVROOT >/dev/null 2>&1 </dev/null &
sleep 3
echo Started
jps -m | grep $KVROOT
echo netstat -ntpl | grep $KVPORT

