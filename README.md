# Spark_Streaming_Pipeline

## Project Overview

The "Pipeline_using_spark_streaming" project demonstrates stream processing using Apache Spark Streaming in Python. It includes Docker configurations for setting up Kafka and Spark services, along with example scripts for producing and consuming data streams.

## Project Description

The project showcases the implementation of stream processing workflows using Apache Spark Streaming. It covers the following key aspects:

### Docker Setup

The Docker module includes Dockerfiles and docker-compose definitions to run Kafka and Spark in Docker containers. This facilitates the deployment of required services, ensuring easy setup and configuration for stream processing.

### Producer-Consumer Example

Example scripts for producing and consuming data streams are included. These scripts illustrate how to generate data streams (producer) and process them in real-time (consumer) using Apache Spark Streaming.

### Start Script

A `start.sh` script automates the setup process. It installs dependencies, creates Docker networks and volumes, builds Spark images, and starts Docker Compose for Spark and Kafka services.

## Architecture

The architecture of the project involves the following components:

### Docker Containers

Kafka and Spark services are deployed within Docker containers. Kafka serves as the message broker for streaming data, while Spark provides the stream processing capabilities.

### Producer

The producer script generates data streams, which are then sent to Kafka topics. These data streams may represent various types of real-time events or data sources.

### Consumer

The consumer script subscribes to Kafka topics and consumes the data streams. It processes the incoming data in real-time using Apache Spark Streaming, performing tasks such as data aggregation, filtering, or transformation.

### Spark Streaming

Apache Spark Streaming provides the core stream processing engine. It ingests data from Kafka topics, processes it in micro-batches, and produces the final results or output streams.

### Integration

Docker orchestration and containerization enable seamless integration and deployment of Kafka and Spark services. This ensures scalability, flexibility, and ease of management for stream processing workflows.

## Usage

To run the producer-consumer examples, execute the following commands:

```bash
# Start producer script
python3 ./pyspark_streamng/producer.py

# Start consumer script
python3 ./pyspark_streaming/consumer.py
```

Alternatively, you can run all scripts using the provided `start.sh` file:

```bash
./start.sh
```

## Running Spark and Kafka Clusters on Docker

### Build Required Images for running Spark

To build the required Spark images, follow the instructions in the blog post written by André Perez on [Medium blog - Towards Data Science](https://towardsdatascience.com/apache-spark-cluster-on-docker-ft-a-juyterlab-interface-418383c95445). Execute the following commands:

```bash
# Build Spark Images
./build.sh 
```

### Create Docker Network & Volume

Create the necessary Docker network and volume by running the following commands:

```bash
# Create Network
docker network create kafka-spark-network

# Create Volume
docker volume create --name=hadoop-distributed-file-system
```

### Run Services on Docker

Start the Docker services using the provided Docker Compose files. Execute the following commands within the Kafka and Spark folders:

```bash
# Start Docker-Compose (within the kafka and spark folders)
docker compose up -d
```

For a deeper understanding of Kafka Listeners, refer to the explanation provided in this [Confluent blog post](https://www.confluent.io/blog/kafka-listeners-explained/).

### Stop Services on Docker

Stop the Docker services using the following commands within the Kafka and Spark folders:

```bash
# Stop Docker-Compose (within the kafka and spark folders)
docker compose down
```

### Helpful Commands

Useful commands for managing Docker containers and volumes:

```bash
# Delete all Containers
docker rm -f $(docker ps -a -q)

# Delete all volumes
docker volume rm $(docker volume ls -q)
```

## Running PySpark Streaming

### Prerequisites

Ensure your Kafka and Spark services are up and running by following the [docker setup readme](./../../docker/README.md). Make sure to create the network and volume as described in the document. Verify that your volume and network are created correctly:

```bash
docker volume ls # should list hadoop-distributed-file-system
docker network ls # should list kafka-spark-network 
```

### Running Producer and Consumer

Run the Python scripts for the producer and consumer:

```bash
# Run producer
python3 producer.py

# Run consumer with default settings
python3 consumer.py

# Run consumer for a specific topic
python3 consumer.py --topic <topic-name>
```

### Running Streaming Script

The `spark-submit.sh` script ensures the installation of necessary JARs before running the `streaming.py` script. Execute the following command:

```bash
./spark-submit.sh streaming.py 
```

### Additional Resources

- [Structured Streaming Programming Guide](https://spark.apache.org/docs/latest/structured-streaming-programming-guide.html#structured-streaming-programming-guide)
- [Structured Streaming + Kafka Integration](https://spark.apache.org/docs/latest/structured-streaming-kafka-integration.html#structured-streaming-kafka-integration-guide-kafka-broker-versio)

Ensure you have installed the required Python packages by running:

```bash
pip install -r ../require.txt
```

Make the Spark build script executable:

```bash
chmod +x ../docker/spark/build.sh
```

Build the Spark images and start the Docker services:

```bash
../docker/spark/build.sh
docker-compose -f ../docker/docker-compose.yml up -d
```