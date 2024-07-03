#!/bin/bash

# Script para configurar o Rundeck

# Baixar a imagem do Docker do Rundeck
docker pull rundeck/rundeck:latest

# Rodar o container do Rundeck
docker run -d --name rundeck \
  -p 4440:4440 \
  -v /path/to/rundeck/data:/home/rundeck/server/data \
  rundeck/rundeck:latest

echo "Rundeck está sendo executado na porta 4440"