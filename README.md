# Spark on Kubernetes
Repositories contains Spark on Kubernetes implementation.

## Spark base image
Scheduling pods with a Spark image
`/opt/spark/sbin/docker-image-tool.sh -t 1.0.0 -p /path/to/python/dockerfile`

## Hiveserver2 configuration
The hiveserver2 is exposed through port 10000. Use DBeaver to connect.

```
spark/sbin/start-thriftserver.sh \
    --master k8s://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT} \ 
    --conf spark.kubernetes.container.image=spark:1.0.0 \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=default \
    --conf spark.driver.extraClassPath=/opt/hive/lib/mysql-connector-java-8.0.26.jar \
    --hiveconf javax.jdo.option.ConnectionPassword=${HIVE_USER_PWD} \
    --conf spark.driver.host=$(hostname -I) \
    --conf spark.sql.warehouse.dir=/opt/spark-warehouse
```