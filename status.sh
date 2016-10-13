. ~/NoSQLdemo/env.sh
echo status at `date`
jps -m | grep $KVROOT
netstat -ntpl | grep $KVPORT

