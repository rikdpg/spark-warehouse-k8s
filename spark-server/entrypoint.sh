#!/bin/bash

set -e

echo "Starting Spark Thriftserver..."
spark/sbin/start-thriftserver.sh \
    --master k8s://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT} \
    --hiveconf javax.jdo.option.ConnectionPassword=${HIVE_USER_PWD} \
    --conf spark.driver.host=$(hostname -I) \
    --packages com.google.cloud.bigdataoss:gcs-connector:hadoop3-2.2.0 

echo "Spark Thriftserver running at port 10000"

# TODO: change to elegant solution
tail -F /dev/null