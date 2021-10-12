FROM openjdk:8-jre-slim

ARG HIVE_VERSION=3.1.2
ARG HADOOP_VERSION=3.3.1

# install additional tools
RUN apt update && apt install -y bash wget procps

# TODO: remove the temp downloaded files
WORKDIR /tmp

# download and install hadoop
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}-aarch64.tar.gz \
    && tar -xzvf hadoop-${HADOOP_VERSION}-aarch64.tar.gz \
    && mv hadoop-${HADOOP_VERSION} /opt/hadoop

# download and install hive
RUN wget https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
    && tar -xzvf apache-hive-${HIVE_VERSION}-bin.tar.gz \
    && mv apache-hive-${HIVE_VERSION}-bin /opt/hive

RUN wget https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-8.0.25.tar.gz \
    && tar -xzvf mysql-connector-java-8.0.25.tar.gz \
    && mv mysql-connector-java-8.0.25/mysql-connector-java-8.0.25.jar /opt/hive/lib/mysql-connector-java-8.0.25.jar

# TODO: tidy up the location of the jar
RUN wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop3-latest.jar

COPY entrypoint.sh entrypoint.sh

EXPOSE 10000

RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["/bin/bash"]