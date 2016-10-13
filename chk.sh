. .bash_profile
. Oracle-NoSQL-demo/env.sh
echo Check
jps -m | grep $KVSTORE
netstat -ntpl | grep $KVPORT
netstat -ntpl | grep $(($KVPORT+1))
