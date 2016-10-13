cat $HOME/Oracle-NoSQL-demo/get_rmvTable.ksv
java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST load -file $HOME/Oracle-NoSQL-demo/get_rmvTable.ksv
