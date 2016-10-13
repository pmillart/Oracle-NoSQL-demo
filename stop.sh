. ~/NoSQLdemo/env.sh
#echo Running
#jps -m | grep $KVROOT
echo -----------------------------------------------
echo Stopping at `date`
java -jar $KVHOME/lib/kvstore.jar stop -root $KVROOT
sleep 5
jps -m | grep $KVROOT
echo netstat -ntpl | grep 5000
