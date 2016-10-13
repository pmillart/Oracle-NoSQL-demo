TZ='Europe/Paris'; export TZ
#export JAVA_HOME=~/jdk1.8.0_60
#export PATH=$JAVA_HOME/bin:$PATH

export KVSTORE=kvdemo
export KVHOME=~/kv-4.2.2
export KVROOT=$HOME/kvroot
export KVDATA=$HOME/disk
export KVHOST=`uname -n`
export KVPORT=5000

alias KVadmin="java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST"
alias KVadmins="java -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST -security $KVROOT/security/adminlogin"
#alias KVadmins="java -Doracle.kv.security=$KVROOT/security/adminlogin -jar $KVHOME/lib/kvstore.jar runadmin -port $KVPORT -host $KVHOST -security $KVROOT/security/adminlogin"
alias KVstart="nohup java -jar $KVHOME/lib/kvstore.jar start -root $KVROOT >/dev/null 2>&1 </dev/null &"
alias KVstop="java -jar $KVHOME/lib/kvstore.jar stop -root $KVROOT"
alias KVping="java -jar $KVHOME/lib/kvstore.jar ping  -port $KVPORT -host $KVHOST"
alias KVpings="java -jar -Doracle.kv.security=$KVROOT/security/adminlogin $KVHOME/lib/kvstore.jar ping  -port $KVPORT -host $KVHOST"

alias KVSQL="java -jar $KVHOME/lib/sql.jar -helper-hosts $KVHOST:$KVPORT -store $KVSTORE"

#echo KVSTORE=$KVSTORE KVHOST=$KVHOST:$KVPORT
#env | grep KV
