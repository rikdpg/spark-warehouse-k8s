# Spark Thrifterver on Kubernetes
Executes SparkSql queries through thriftserver on Kubernetes. A generic setup used throughout personal data projects.

## Description

An apprach to run (my) SparkSql workload in a containerized way on Kubernetes. The setup follows a popular convention to leverage cloud object storage as storage layer. In addition, the Hive metastore runs as a separate service on the cluster and is accessible for any Spark application.

Objectives of this project
1. Create reusable implementation for any data engineering projects.
2. Consolidate implementation knowledge in a single place for others to use.

Most of the personal projects and prototypes share a common infrastructure/process where you want to avoid repeating yourself in the setup. Maintaining that infrastructure and imposing some form of convention will surely help improve iteration speed of any project. Furthermore, the contents of this repository and documentation can be useful to share with the general public.

## Prerequisites
To run this setup local machine
1. Dependencies installed: Docker, Minikube.
2. Spark distribution of >= 2.3.

When using GCS as storage layer, a service account (JSON) needs to be provided. See secrets section below. 

## Getting Started

### 1. Setting secrets
Use Kubernetes secrets to provide service account and password settings

Google Cloud Platform:

`$ kubectl create secret generic google-credentials --from-file=credentials.json=/path/to/gcp/credentials.json`

Set up the root user password for MySQL

`$ kubectl create secret generic mysql --from-literal=password=some-secret-password`

Set up the password for the Hive user.

`$ kubectl create secret generic hive --from-literal=password=some-secret-password`

### 2. Build Spark base image
Spark ships with a Dockerfile used by this setup found in the `kubernetes/dockerfiles` directory. It also ships with a tool to create the required Docker images.
 
```$ /path/to/spark/bin/docker-image-tool.sh -p kubernetes/dockerfiles/spark/bindings/python/Dockerfile -t 1.0.0 -u root build```

## Contributing
Suggestions, improvemnts and/or bug findings are more than welcome. Please create a branch and PR or issue where we can discuss proposed changes.
