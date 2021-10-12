#!/bin/bash

# TODO: set condition on init metastore schema

set -e
echo "Setting Env variables"

# set hive and hadoop standards
export HIVE_HOME="/opt/hive"
export HADOOP_HOME="/opt/hadoop"
export HIVE_CONF_DIR="/opt/conf"
export HADOOP_CLASSPATH="$HADOOP_CLASSPATH:/tmp/gcs-connector-hadoop3-latest.jar"

export PATH="$HIVE_HOME/bin:$HADOOP_HOME:$PATH"

exec "$@"