#!/bin/bash

# Defina as variáveis
RUNDECK_URL="http://localhost:4440"
API_TOKEN="YOUR_API_TOKEN"
PROJECT_NAME="YOUR_PROJECT_NAME"

# Importe os jobs
curl -X POST "${RUNDECK_URL}/api/14/project/${PROJECT_NAME}/jobs/import" \
  -H "Content-Type: application/x-yaml" \
  -H "X-Rundeck-Auth-Token: ${API_TOKEN}" \
  --data-binary @/home/rundeck/server/data/imported/jobs/job.yaml

# Importe os nós
curl -X POST "${RUNDECK_URL}/api/14/project/${PROJECT_NAME}/resources" \
  -H "Content-Type: application/xml" \
  -H "X-Rundeck-Auth-Token: ${API_TOKEN}" \
  --data-binary @/home/rundeck/server/data/nodes/nodes.xml
