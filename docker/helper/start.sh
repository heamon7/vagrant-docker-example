/usr/hdp/current/zookeeper-server/bin/zkServer.sh start
/usr/hdp/current/hadoop-client/sbin/hadoop-daemon.sh start zkfc
#su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/bin/hdfs namenode -format"
if [[ -x "/tmp/helper/hdfs_folder_preparation.sh" ]]
then 
    /bin/bash /tmp/helper/hdfs_folder_preparation.sh
    chmod 400 /tmp/helper/hdfs_folder_preparation.sh
else 
    su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode"
    su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-secondarynamenode/../hadoop/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode"
    su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-datanode/../hadoop/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode"
fi
#configure yarn and mr on hdfs
#su - $HDFS_USER -c "hdfs dfs -mkdir -p /hdp/apps/2.2.4.2/mapreduce/"
#su - $HDFS_USER -c "hdfs dfs -put /usr/hdp/current/hadoop-client/mapreduce.tar.gz /hdp/apps/2.2.4.2/mapreduce/"
#su - $HDFS_USER -c "hdfs dfs -chown -R hdfs:hadoop /hdp"
#su - $HDFS_USER -c "hdfs dfs -chmod -R 555 /hdp/apps/2.2.4.2/mapreduce"
#su - $HDFS_USER -c "hdfs dfs -chmod -R 444 /hdp/apps/2.2.4.2/mapreduce/mapreduce.tar.gz"

#start resourcemanager, nodemanager
su -l yarn -c "/usr/hdp/current/hadoop-yarn-resourcemanager/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager"
su -l yarn -c "/usr/hdp/current/hadoop-yarn-nodemanager/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager"

#configurate history on hdfs
#su -l $HDFS_USER -c "hdfs dfs -mkdir -p /mr-history/tmp;"
#su -l $HDFS_USER -c "hdfs dfs -chmod -R 1777 /mr-history/tmp"
#su -l $HDFS_USER -c "hdfs dfs -mkdir -p /mr-history/done"
#su -l $HDFS_USER -c "hdfs dfs -chmod -R 1777 /mr-history/done"
#su -l $HDFS_USER -c "hdfs dfs -chown -R $MAPRED_USER:$HDFS_USER /mr-history"
#su -l $HDFS_USER -c "hdfs dfs -mkdir -p /app-logs"
#su -l $HDFS_USER -c "hdfs dfs -chmod -R 1777 /app-logs"
#su -l $HDFS_USER -c "hdfs dfs -chown $YARN_USER /app-logs"

#start history server
su -l yarn -c "/usr/hdp/current/hadoop-mapreduce-historyserver/sbin/mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver"

#start hbase
su -l hbase -c "/usr/hdp/current/hbase-master/bin/hbase-daemon.sh start master; sleep 25"
su -l hbase -c "/usr/hdp/current/hbase-regionserver/bin/hbase-daemon.sh start regionserver" 

#start ssh
/etc/init.d/sshd start
tail -f /var/log/hadoop/hdfs/hadoop-hdfs-namenode-hdp-master.crayondata.com.log
