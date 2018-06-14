. ~/Oracle-NoSQL-demo/env.sh

 #INIT
 
echo ---------------------------------------------------
echo remove KVROOT and data
[ -n "$KVROOT" ] && rm -r $KVROOT
[ -n "${KVDATA}" ] && rm -r ${KVDATA}1 
[ -n "${KVDATA}" ] && rm -r ${KVDATA}2
[ -n "${KVDATA}" ] && rm -r ${KVDATA}3

mkdir -p $KVROOT
mkdir -p ${KVDATA}1
mkdir -p ${KVDATA}2
mkdir -p ${KVDATA}3

echo java  -jar \$KVHOME/lib/kvstore.jar makebootconfig -root $KVROOT -port 5000 ...
java -jar $KVHOME/lib/kvstore.jar makebootconfig \
-root $KVROOT \
-port $KVPORT \
-admin $(($KVPORT+1)) \
-host $KVHOST \
-harange $(($KVPORT+10)),$(($KVPORT+20)) \
-servicerange $(($KVPORT+21)),$(($KVPORT+49)) \
-store-security none \
-capacity 1 \
-storagedir ${KVDATA}1 \
-storagedir ${KVDATA}2 \
-storagedir ${KVDATA}3 \
-mgmt jmx

ls -l  $KVROOT/config.xml

cat $KVROOT/config.xml
