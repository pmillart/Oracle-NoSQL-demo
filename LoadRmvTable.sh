. ~/NoSQLdemo/env.sh
cd $KVHOME
javac -cp $KVHOME/lib/kvclient.jar:examples examples/hadoop/hive/table/LoadRmvTable.java

java -cp $KVHOME/lib/kvclient.jar:examples \
hadoop.hive.table.LoadRmvTable -store kvdemo -host nosql1 -port 5000 -nops 10000

# create index / request / drop index
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host nosql1 load -file ~/NoSQLdemo/LoadRmvTable.kvs

