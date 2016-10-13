. ~/Oracle-NoSQL-demo/env.sh
cd $KVHOME
java -classpath lib/kvclient.jar:examples \
hadoop.table.LoadVehicleTable  \
-store kvdemo -host $KVHOST -port $KVPORT  \
-nops 1000
cd -
java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST -file $HOME/Oracle-NoSQL-demo/loadtable.kvs
