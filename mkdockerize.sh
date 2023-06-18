#!/bin/bash

IMAGE_NAME="mkdocs-docker"
PROJECT_DIR=$1
ACTION=$2

# Build Docker image
docker build -t $IMAGE_NAME .

case $ACTION in
produce)
    # Create a new MkDocs project
    docker run -v $PROJECT_DIR:/app $IMAGE_NAME mkdocs new woven-challenge
    # Change PROJECT_DIR to the new project directory
    PROJECT_DIR="${PROJECT_DIR}/woven-challenge"
    # Run the Docker image with the produce command
    docker run -v $PROJECT_DIR:/app $IMAGE_NAME mkdocs build
    # Create a tar.gz file from the site folder
    docker run -v $PROJECT_DIR:/app $IMAGE_NAME tar -czvf site.tar.gz site
    ;;
serve)
    # Extract the tar.gz file to the site folder
    docker run -v $PROJECT_DIR:/app $IMAGE_NAME tar -xzvf site.tar.gz
    # Start serving the website
    PROJECT_DIR="${PROJECT_DIR}/woven-challenge"
    docker run -p 8000:8000 -v $PROJECT_DIR:/app $IMAGE_NAME mkdocs serve -a 0.0.0.0:8000
    ;;
*)
    echo "Invalid option. Use produce or serve."
    ;;
esac

