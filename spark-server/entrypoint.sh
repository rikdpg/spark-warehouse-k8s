#!/bin/bash

# set -e
echo "Setting Env variables"

# set hive and hadoop standards
export HIVE_HOME="/opt/hive"
export HADOOP_HOME="/opt/hadoop"
# export HADOOP_CLASSPATH="$HADOOP_CLASSPATH:/opt/spark/jars"

export PATH="$HIVE_HOME/bin:$HADOOP_HOME:$PATH"

exec "$@"