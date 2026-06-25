#!/bin/bash
set -e

llm=$1
embeddingmodel=$2

echo "Waiting for Ollama..."
until curl -s http://localhost:11434/api/tags; do
    sleep 2
done

echo "Pulling models..."
docker exec ollama ollama pull $llm
docker exec ollama ollama pull $embeddingmodel

echo "Done."