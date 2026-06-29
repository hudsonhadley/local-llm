#!/bin/bash
set -e

cd "$(dirname "$0")"
source "../.env"

echo "Waiting for Ollama..."
until curl -s http://localhost:11434/api/tags > /dev/null 2>&1; do
    sleep 2
done

echo "Pulling models..."
docker exec ollama ollama pull $LLM_MODEL
docker exec ollama ollama pull $EMBEDDING_MODEL

echo "Done."