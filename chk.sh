. .bash_profile
. Oracle-NoSQL-demo/env.sh
echo Check
jps -m | grep $KVSTORE
netstat -ntpl | grep 5000
netstat -ntpl | grep 5001
