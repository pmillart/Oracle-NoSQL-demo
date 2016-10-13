. ~/NoSQLdemo/env.sh
cd $KVHOME
java -classpath lib/kvclient.jar:examples \
hadoop.table.LoadVehicleTable  \
-store kvdemo -host nosql1 -port 5000  \
-nops 1000
cd -
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host nosql1 load -file ~/NoSQLdemo/loadtable.kvs
