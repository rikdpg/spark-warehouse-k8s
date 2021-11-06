#!/bin/bash

set -e
echo "Setting Env variables"

# set hive and hadoop standards
export HIVE_HOME="/opt/hive"
export HADOOP_HOME="/opt/hadoop"
export HIVE_CONF_DIR="/opt/conf"
export HADOOP_CLASSPATH="$HADOOP_CLASSPATH:/tmp/gcs-connector-hadoop3-latest.jar"

export PATH="$HIVE_HOME/bin:$HADOOP_HOME:$PATH"

echo "Validating metastore schema..."
schema_validation=$(schematool -validate -dbType postgres)

if ! schema_validation; then
    echo "Initializing db with schema..."
    schematool -initSchema -dbType postgres
else
    echo "Valid metastore schema..."

fi

exec "$@"