# Spark_Streaming_Pipeline

# Running Spark and Kafka Clusters on Docker

## Build Required Images for running Spark

To build the required Spark images, follow the instructions in the blog post written by André Perez on [Medium blog - Towards Data Science](https://towardsdatascience.com/apache-spark-cluster-on-docker-ft-a-juyterlab-interface-418383c95445). Execute the following commands:

```bash
# Build Spark Images
./build.sh 
```

## Create Docker Network & Volume

Create the necessary Docker network and volume by running the following commands:

```bash
# Create Network
docker network create kafka-spark-network

# Create Volume
docker volume create --name=hadoop-distributed-file-system
```

## Run Services on Docker

Start the Docker services using the provided Docker Compose files. Execute the following commands within the Kafka and Spark folders:

```bash
# Start Docker-Compose (within the kafka and spark folders)
docker compose up -d
```

For a deeper understanding of Kafka Listeners, refer to the explanation provided in this [Confluent blog post](https://www.confluent.io/blog/kafka-listeners-explained/).

## Stop Services on Docker

Stop the Docker services using the following commands within the Kafka and Spark folders:

```bash
# Stop Docker-Compose (within the kafka and spark folders)
docker compose down
```

## Helpful Commands

Useful commands for managing Docker containers and volumes:

```bash
# Delete all Containers
docker rm -f $(docker ps -a -q)

# Delete all volumes
docker volume rm $(docker volume ls -q)
```

# Running PySpark Streaming

## Prerequisites

Ensure your Kafka and Spark services are up and running by following the [docker setup readme](./../../docker/README.md). Make sure to create the network and volume as described in the document. Verify that your volume and network are created correctly:

```bash
docker volume ls # should list hadoop-distributed-file-system
docker network ls # should list kafka-spark-network 
```

## Running Producer and Consumer

Run the Python scripts for the producer and consumer:

```bash
# Run producer
python3 producer.py

# Run consumer with default settings
python3 consumer.py

# Run consumer for a specific topic
python3 consumer.py --topic <topic-name>
```

## Running Streaming Script

The `spark-submit.sh` script ensures the installation of necessary JARs before running the `streaming.py` script. Execute the following command:

```bash
./spark-submit.sh streaming.py 
```

## Additional Resources

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