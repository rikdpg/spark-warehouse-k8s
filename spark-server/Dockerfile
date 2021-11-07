FROM openjdk:8-jre-slim

ARG HIVE_VERSION=3.1.2
ARG HADOOP_VERSION=3.3.1
ARG SPARK_VERSION=3.2.0

# install additional tools
RUN apt update && apt install -y bash wget procps

WORKDIR /opt

RUN wget -qO- https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
    | tar -xvz --one-top-level=hive --strip-components 1

RUN wget -qO- https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}-aarch64.tar.gz \
    | tar -xvz --one-top-level=hadoop --strip-components 1

RUN wget -qO- https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.2.tgz \
    | tar -xzv --one-top-level=spark --strip-components 1

RUN wget -qO- https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-8.0.26.tar.gz \
    | tar -xzv -C /opt/hive/lib --strip-components 1 mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar

RUN wget -P /tmp https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop3-latest.jar

# RUN wget -P /opt/hive/lib https://jdbc.postgresql.org/download/postgresql-42.3.1.jar

# download and install hadoop
# RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}-aarch64.tar.gz \
    # && tar -xzvf hadoop-${HADOOP_VERSION}-aarch64.tar.gz \
    # && mv hadoop-${HADOOP_VERSION} /opt/hadoop

# download and install hive
# RUN wget https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
    # && tar -xzvf apache-hive-${HIVE_VERSION}-bin.tar.gz \
    # && mv apache-hive-${HIVE_VERSION}-bin /opt/hive


COPY entrypoint.sh entrypoint.sh
COPY conf /opt/conf

EXPOSE 10000

RUN chmod +x ./entrypoint.sh
# ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["/bin/bash"]