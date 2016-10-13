. ~/NoSQLdemo/env.sh
echo Modify configutation in all storage nodes 

java -Xmx256m -Xms256m -jar $KVHOME/lib/kvstore.jar securityconfig \
config add-security -root $KVROOT -secdir security
