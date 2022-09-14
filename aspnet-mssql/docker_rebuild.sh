#!/bin/bash

# Rebuild
docker compose build
docker compose up -d --force-recreate

# Run Test suite
sleep 10
echo "Website health check"
curl -I "http://127.0.0.1:80" 2>&1 | awk '/HTTP\// {print $2}'
