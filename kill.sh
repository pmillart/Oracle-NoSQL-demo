. ~/Oracle-NoSQL-demo/env.sh
#echo Running
#jps -m | grep $KVROOT
echo -----------------------------------------------
echo killing at `date`
pkill -f $KVROOT
sleep 5
jps -m | grep $KVROOT
echo netstat -ntpl | grep 5000
