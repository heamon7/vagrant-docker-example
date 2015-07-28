#!/bin/sh

#
# Directories Script
#
# 1. To use this script, you must edit the TODO variables below for your environment.
#
# 2. Warning: Leave the other parameters as the default values. Changing these default values will require you to
#    change values in other configuration files.
#

#
# Hadoop Service - HDFS
#

# Space separated list of directories where NameNode will store file system image. For example, /grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn
DFS_NAME_DIR="/hadoop/hdfs/namenode" \
DFS_DATA_DIR="/hadoop/hdfs/data" \
FS_CHECKPOINT_DIR="/hadoop/hdfs/namesecondary" \
HDFS_LOG_DIR="/var/log/hadoop/hdfs" \
HDFS_PID_DIR="/var/run/hadoop/hdfs" \
HADOOP_CONF_DIR="/etc/hadoop/conf" \
YARN_LOCAL_DIR="/hadoop/yarn/local" \
YARN_LOG_DIR="/var/log/hadoop-yarn" \ 
YARN_LOCAL_LOG_DIR="/hadoop/yarn/log" \
YARN_PID_DIR="/var/run/hadoop-yarn" \
MAPRED_LOG_DIR="/var/log/hadoop/mapred" \
MAPRED_PID_DIR="/var/run/hadoop/mapred" \
HADOOP_MAPRED_PID_DIR="/var/run/hadoop-mapreduce"
HADOOP_MAPRED_LOG_DIR="/var/log/hadoop-mapreduce"
HIVE_CONF_DIR="/etc/hive/conf" \
HIVE_LOG_DIR="/var/log/hive" \
HIVE_PID_DIR="/var/run/hive" \
WEBHCAT_CONF_DIR="/etc/hcatalog/conf/webhcat" \
WEBHCAT_LOG_DIR="var/log/webhcat" \
WEBHCAT_PID_DIR="/var/run/webhcat" \
HBASE_CONF_DIR="/etc/hbase/conf" \
HBASE_LOG_DIR="/var/log/hbase" \
HBASE_PID_DIR="/var/run/hbase" \
ZOOKEEPER_DATA_DIR="/hadoop/zookeeper" \
ZOOKEEPER_CONF_DIR="/etc/zookeeper/conf" \
ZOOKEEPER_LOG_DIR="/var/log/zookeeper" \
ZOOKEEPER_PID_DIR="/var/run/zookeeper" \
PIG_CONF_DIR="/etc/pig/conf" \
PIG_LOG_DIR="/var/log/pig" \
PIG_PID_DIR="/var/run/pig" \


OOZIE_CONF_DIR="/etc/oozie/conf"

# Directory to store the Oozie data.
OOZIE_DATA="/var/db/oozie"

# Directory to store the Oozie logs.
OOZIE_LOG_DIR="/var/log/oozie"

# Directory to store the Oozie process ID.
OOZIE_PID_DIR="/var/run/oozie"

# Directory to store the Oozie temporary files.
OOZIE_TMP_DIR="/var/tmp/oozie"

#
# Hadoop Service - Sqoop
#
SQOOP_CONF_DIR="/etc/sqoop/conf"

export HADOOP_LIBEXEC_DIR=/usr/hdp/current/hadoop-client/libexec
