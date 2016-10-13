. ~/Oracle-NoSQL-demo/env.sh
cd $KVHOME
javac -cp $KVHOME/lib/kvclient.jar:examples examples/hadoop/hive/table/LoadRmvTable.java

java -cp $KVHOME/lib/kvclient.jar:examples \
hadoop.hive.table.LoadRmvTable -store kvdemo -host $KVHOST -port $KVPORT -nops 10000

# create index / request / drop index
java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST load -file $HOME/Oracle-NoSQL-demo/LoadRmvTable.kvs

