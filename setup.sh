#!/bin/bash

set -e

docker compose up -d

echo "Waiting for Virtuoso to be ready..."
until curl -s http://localhost:8090/sparql | grep -q "Virtuoso"; do
    echo -n "."
    sleep 2
done
echo -e "\nVirtuoso is up!"

echo "📥 Inserting triple..."
curl -s --data-urlencode 'update=INSERT DATA { <http://example.org/subject> <http://example.org/predicate> "hello world" }' \
  http://localhost:8090/sparql

echo "Fetching triple..."
curl -s  --data-urlencode 'query=SELECT * WHERE { <http://example.org/subject> <http://example.org/predicate> ?o }' \
  http://localhost:8090/sparql
