FROM centos:centos6.6
MAINTAINER Robin Chen (cjcrobin@gmail.com)

#=========================================#
#===prepare the installation for hadoop===#
#=========================================#
RUN yum install -y wget tar ntp
RUN wget -nv http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.2.4.2/hdp.repo -O /etc/yum.repos.d/hdp.repo

#Set up the ntp to sync the clock to ensure the cluster running in the right behaviour
RUN chkconfig ntpd on && \
    /etc/init.d/ntpd start && \
    echo "server hdp-master.crayondata.com" >> /etc/ntp.conf

#Turn off the iptables
#RUN chkconfig iptables off && \
#    service iptables stop

#Change working directory
WORKDIR /tmp

#Add Dependent files
ADD helper /tmp/helper

#Java Installation
RUN mkdir /usr/java && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz && \
    cp jdk-7u67-linux-x64.tar.gz /usr/java/ && \
    cd /usr/java/ && \
    tar zxvf jdk-7u67-linux-x64.tar.gz && \
    ln -s /usr/java/jdk1.7.0_67 /usr/java/default && \
    export JAVA_HOME=/usr/java/default && \
    export PATH=$JAVA_HOME/bin:$PATH && \
    echo "export JAVA_HOME=/usr/java/default" >> /etc/profile && \
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile && \
    echo "export JAVA_HOME=/usr/java/default" >> /etc/bashrc && \
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> /etc/bashrc
ENV JAVA_HOME=/usr/java/default PATH=$JAVA_HOME/bin:$PATH 

#Initialize the environment
ENV DFS_NAME_DIR="/hadoop/hdfs/namenode" \
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
    HADOOP_MAPRED_PID_DIR="/var/run/hadoop-mapreduce" \
    HADOOP_MAPRED_LOG_DIR="/var/log/hadoop-mapreduce" \
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
    HDFS_USER="hdfs" \
    YARN_USER="yarn" \
    MAPRED_USER="mapred" \
    PIG_USER="pig" \
    HIVE_USER="hive" \
    WEBHCAT_USER="hcat" \
    HBASE_USER="hbase" \
    ZOOKEEPER_USER="zookeeper" \
    OOZIE_USER="oozie" \
    HADOOP_GROUP="hadoop" \
    HADOOP_LIBEXEC_DIR="/usr/hdp/current/hadoop-client/libexec" 

#=========================================#
#=====Hadoop, Hbase, Pig Installation=====#
#=========================================#
#Libarary Installation
RUN yum install -y hadoop hadoop-hdfs hadoop-libhdfs hadoop-yarn hadoop-mapreduce hadoop-client openssl && \
    yum install -y snappy snappy-devel && \
    yum install -y lzo lzo-devel hadooplzo hadooplzo-native && \
    yum install -y zookeeper && \
    yum install -y hbase && \
    yum install -y pig 

#Create the folder for HDFS, MapReduce and Yarn, and Set the permissions
RUN mkdir -p $DFS_NAME_DIR && chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR && chmod -R 755 $DFS_NAME_DIR; \
    mkdir -p $FS_CHECKPOINT_DIR && chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR && chmod -R 755 $FS_CHECKPOINT_DIR; \
    mkdir -p $DFS_DATA_DIR && chown -R $HDFS_USER:$HADOOP_GROUP $DFS_DATA_DIR && chmod -R 750 $DFS_DATA_DIR; \
    mkdir -p $YARN_LOCAL_DIR && chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_DIR && chmod -R 755 $YARN_LOCAL_DIR; \
    mkdir -p $YARN_LOCAL_LOG_DIR && chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOCAL_LOG_DIR && chmod -R 755 $YARN_LOCAL_LOG_DIR; \
    mkdir -p $HDFS_LOG_DIR && chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_LOG_DIR && chmod -R 755 $HDFS_LOG_DIR; \
    mkdir -p $YARN_LOG_DIR && chown -R $YARN_USER:$HADOOP_GROUP $YARN_LOG_DIR && chmod -R 755 $YARN_LOG_DIR; \
    mkdir -p $HDFS_PID_DIR && chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR && chmod -R 755 $HDFS_PID_DIR; \
    mkdir -p $YARN_PID_DIR && chown -R $YARN_USER:$HADOOP_GROUP $YARN_PID_DIR && chmod -R 755 $YARN_PID_DIR; \
    mkdir -p $MAPRED_LOG_DIR && chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR && chmod -R 755 $MAPRED_LOG_DIR; \
    mkdir -p $MAPRED_PID_DIR && chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR && chmod -R 755 $MAPRED_PID_DIR; \
    mkdir -p $HADOOP_MAPRED_PID_DIR && chown -R $YARN_USER:$HADOOP_GROUP $HADOOP_MAPRED_PID_DIR && chmod -R 755 $HADOOP_MAPRED_PID_DIR; \
    mkdir -p $HADOOP_MAPRED_LOG_DIR && chown -R $YARN_USER:$HADOOP_GROUP $HADOOP_MAPRED_LOG_DIR && chmod -R 755 $HADOOP_MAPRED_LOG_DIR; 

#Create the folder for zookeeper, and set the permissions
RUN mkdir -p $ZOOKEEPER_LOG_DIR && chmod -R 755 $ZOOKEEPER_LOG_DIR; \
    mkdir -p $ZOOKEEPER_PID_DIR && chmod -R 755 $ZOOKEEPER_PID_DIR; \
    mkdir -p $ZOOKEEPER_DATA_DIR && chmod -R 755 $ZOOKEEPER_DATA_DIR; 


#Create the folder for Hbase, and set the permissions
RUN mkdir -p $HBASE_LOG_DIR && chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_LOG_DIR && chmod -R 755 $HBASE_LOG_DIR; \
    mkdir -p $HBASE_PID_DIR && chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_PID_DIR && chmod -R 755 $HBASE_PID_DIR;

#Link one particular version to the current version
RUN /usr/bin/hdp-select set all 2.2.4.2-2

#Configurate zookeeper
RUN echo "1" >> $ZOOKEEPER_DATA_DIR/myid
RUN rm -rf $ZOOKEEPER_CONF_DIR/*
RUN cp /tmp/helper/configuration_files/zookeeper/* $ZOOKEEPER_CONF_DIR/
RUN chmod a+x $ZOOKEEPER_CONF_DIR/
RUN chmod -R 755 $ZOOKEEPER_CONF_DIR/../
ENV ZOOCFGDIR="/usr/hdp/current/zookeeper-server/conf" ZOOCFG="zoo.cfg" ZOO_LOG_DIR="/var/log/zookeeper" ZOOPIDFILE="/var/run/zookeeper/zookeeper_server.pid" SERVER_JVMFLAGS="" 

#Configurate hdfs, yarn and mapreduce
RUN rm -rf $HADOOP_CONF_DIR/* && \
    cp /tmp/helper/configuration_files/core_hadoop/* $HADOOP_CONF_DIR/ && \
    chown -R $HDFS_USER:$HADOOP_GROUP $HADOOP_CONF_DIR/../ && \
    chmod -R 755 $HADOOP_CONF_DIR/../
RUN chown root:hadoop /etc/hadoop/conf/container-executor.cfg && \
    chmod 400 /etc/hadoop/conf/container-executor.cfg && \
    chown root:hadoop /usr/hdp/2.2.4.2-2/hadoop-yarn/bin/container-executor && \
    chmod 6050 /usr/hdp/2.2.4.2-2/hadoop-yarn/bin/container-executor && \
    chown -R root:hadoop /usr/hdp/current/hadoop-yarn-client/bin/container-executor && \
    chmod -R 650 /usr/hdp/current/hadoop-yarn-client/bin/container-executor

#Configurate hbase
RUN rm -rf $HBASE_CONF_DIR/* && \
    cp /tmp/helper/configuration_files/hbase/* $HBASE_CONF_DIR/ && \
    chmod a+x $HBASE_CONF_DIR/ && \
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_CONF_DIR/../ && \
    chmod -R 755 $HBASE_CONF_DIR/../

#Configurate pig
RUN rm -rf $PIG_CONF_DIR/* && \
    cp /tmp/helper/configuration_files/pig/* $PIG_CONF_DIR/ && \
    chmod -R 755 $PIG_CONF_DIR

#Install Avro
RUN wget http://mirror.nus.edu.sg/apache/avro/avro-1.7.7/py/avro-1.7.7.tar.gz && \
    tar xvf avro-1.7.7.tar.gz && \
    cd avro-1.7.7 && \
    python setup.py install

#Install Kite
RUN curl http://central.maven.org/maven2/org/kitesdk/kite-tools/0.17.1/kite-tools-0.17.1-binary.jar -o kite-dataset && \
    chmod +x kite-dataset

#=========================================#
#=============SSH installation============#
#=========================================#
RUN yum -y install openssh-server openssh-clients
RUN chkconfig sshd on && service sshd start
RUN mkdir /root/.ssh && cat /tmp/helper/id_rsa.pub >> /root/.ssh/authorized_keys
RUN echo "-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT" >> /etc/sysconfig/iptables-config

EXPOSE 50070 8088 8085 60000 60010 60020 60030 22

ENTRYPOINT ["/bin/bash"]
CMD ["/tmp/helper/start.sh"]
