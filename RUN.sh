#!/bin/zsh

# DATA_DIR=~/.open-webui
# uvx --python 3.11 open-webui@latest serve

docker run --name=open-webui \
  --hostname=open-webui.localdomain \
  --user=0:0 \
  --env=HOME=/root \
  --env=RAG_RERANKING_MODEL= \
  --env=TIKTOKEN_CACHE_DIR=/app/backend/data/cache/tiktoken \
  --env=HF_HOME=/app/backend/data/cache/embedding/models \
  --env=ENV=prod \
  --env=USE_OLLAMA_DOCKER=false \
  --env=SCARF_NO_ANALYTICS=true \
  --env=LANG=C.UTF-8 \
  --env=USE_EMBEDDING_MODEL_DOCKER=sentence-transformers/all-MiniLM-L6-v2 \
  --env=PYTHON_SHA256=2a9920c7a0cd236de33644ed980a13cbbc21058bfdc528febb6081575ed73be3 \
  --env=RAG_EMBEDDING_MODEL=sentence-transformers/all-MiniLM-L6-v2 \
  --env=USE_CUDA_DOCKER=false \
  --env=SENTENCE_TRANSFORMERS_HOME=/app/backend/data/cache/embedding/models \
  --env=OPENAI_API_BASE_URL= \
  --env=WHISPER_MODEL_DIR=/app/backend/data/cache/whisper/models \
  --env=PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  --env=TIKTOKEN_ENCODING_NAME=cl100k_base \
  --env=WEBUI_SECRET_KEY= \
  --env=WHISPER_MODEL=base \
  --env=PORT=9091 \
  --env=DOCKER=true \
  --env=GPG_KEY=A035C8C19219BA821ECEA86B64E628F8D684696D \
  --env=USE_RERANKING_MODEL_DOCKER= \
  --env=OLLAMA_BASE_URL=/ollama \
  --env=OPENAI_API_KEY= \
  --env=USE_CUDA_DOCKER_VER=cu121 \
  --env=WEBUI_AUTH=False \
  --env=DO_NOT_TRACK=true \
  --env=ANONYMIZED_TELEMETRY=false \
  --env=PYTHON_VERSION=3.11.11 \
  --env=WEBUI_BUILD_VERSION=e9d6ada25cd6ce84be067ba794af4c9d7116edc7 \
  --volume=open-webui-main_open-webui:/app/backend/data \
  --network=bridge \
  --workdir=/app/backend \
  -p 9091:9091 \
  --restart=always\
  --label='com.centurylinklabs.watchtower=true' \
  --label='org.opencontainers.image.created=2025-02-05T22:47:55.121Z' \
  --label='org.opencontainers.image.description=User-friendly AI Interface (Supports Ollama, OpenAI API, ...)' \
  --label='org.opencontainers.image.licenses=BSD-3-Clause' \
  --label='org.opencontainers.image.revision=e9d6ada25cd6ce84be067ba794af4c9d7116edc7' \
  --label='org.opencontainers.image.source=https://github.com/open-webui/open-webui' \
  --label='org.opencontainers.image.title=open-webui' \
  --label='org.opencontainers.image.url=https://github.com/open-webui/open-webui' \
  --label='org.opencontainers.image.version=main' \
  --runtime=runc \
  -d ghcr.io/open-webui/open-webui:latest
