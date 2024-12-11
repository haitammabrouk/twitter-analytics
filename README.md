# data-eng-pipeline

This project consists of a Twitter scraper implemented with Selenium and integrated with a Kafka cluster for real-time tweet streaming and processing. The scraper continuously fetches tweets and sends them to a Kafka topic.

## Project Structure

- **scraper/**: Contains the Python scraper code.
- **kafka-cluster/**: Docker Compose configuration for the Kafka cluster (Zookeeper and three Kafka brokers).
- **tweets/**: to save Scrapped tweets as csv files
- **Dockerfile**: Used to build the scraper image.
- **requirements.txt**: Python dependencies for the scraper.

## Prerequisites

1. Install Docker and Docker Compose on your system.
2. Set up environment variables for Twitter credentials:

   ```bash
   export TWITTER_USERNAME="<your_twitter_username>"
   export TWITTER_PASSWORD="<your_twitter_password>"
   ```

   ### 1. Build the Scraper Docker Image

Run the following command to build the Docker image for the scraper:

```bash
docker build --build-arg TWITTER_USERNAME_ARG=${TWITTER_USERNAME} --build-arg TWITTER_PASSWORD_ARG=${TWITTER_PASSWORD} -t tweets-scraper .
```

### 2. Start the Kafka Cluster and Scraper

Navigate to the `kafka-cluster` directory and start the cluster along with the scraper:

```bash
docker-compose -f kafka-cluster/kafka-cluster.yml up -d
```

This command will:
- Start a Zookeeper instance.
- Start three Kafka brokers.
- Start the scraper container.
