# Use a Python 3.12 base image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install dependencies for Firefox and Geckodriver
RUN apt-get update && apt-get install -y \
    firefox-esr \
    wget \
    curl \
    unzip \
    && apt-get clean

# Install a stable version of Geckodriver (e.g., v0.33.0)
RUN wget -q "https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux64.tar.gz" -O /tmp/geckodriver.tar.gz && \
    tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin && \
    rm /tmp/geckodriver.tar.gz

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Define Args during the build phase
ARG TWITTER_USERNAME_ARG
ARG TWITTER_PASSWORD_ARG

# Set Credentials based on the passed in Arguments
ENV TWITTER_USERNAME=$TWITTER_USERNAME_ARG
ENV TWITTER_PASSWORD=$TWITTER_PASSWORD_ARG