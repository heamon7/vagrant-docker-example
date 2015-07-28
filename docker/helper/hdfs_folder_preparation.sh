su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/bin/hdfs namenode -format"
su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode"
su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-secondarynamenode/../hadoop/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode"
su - $HDFS_USER -c "/usr/hdp/current/hadoop-hdfs-datanode/../hadoop/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode"

#configure yarn and mr on hdfs
su - $HDFS_USER -c "hdfs dfs -mkdir -p /hdp/apps/2.2.4.2/mapreduce/"
su - $HDFS_USER -c "hdfs dfs -put /usr/hdp/current/hadoop-client/mapreduce.tar.gz /hdp/apps/2.2.4.2/mapreduce/"
su - $HDFS_USER -c "hdfs dfs -chown -R hdfs:hadoop /hdp"
su - $HDFS_USER -c "hdfs dfs -chmod -R 555 /hdp/apps/2.2.4.2/mapreduce"
su - $HDFS_USER -c "hdfs dfs -chmod -R 444 /hdp/apps/2.2.4.2/mapreduce/mapreduce.tar.gz"

#configurate history on hdfs
su -l $HDFS_USER -c "hdfs dfs -mkdir -p /mr-history/tmp;"
su -l $HDFS_USER -c "hdfs dfs -chmod -R 1777 /mr-history/tmp"
su -l $HDFS_USER -c "hdfs dfs -mkdir -p /mr-history/done"
su -l $HDFS_USER -c "hdfs dfs -chmod -R 1777 /mr-history/done"
su -l $HDFS_USER -c "hdfs dfs -chown -R $MAPRED_USER:$HDFS_USER /mr-history"
su -l $HDFS_USER -c "hdfs dfs -mkdir -p /app-logs"
su -l $HDFS_USER -c "hdfs dfs -chmod -R 1777 /app-logs"
su -l $HDFS_USER -c "hdfs dfs -chown $YARN_USER /app-logs"


