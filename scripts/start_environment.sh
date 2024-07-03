#!/bin/bash

# Script para iniciar o ambiente Docker e Ansible

# Verificar se o Docker está instalado
if ! [ -x "$(command -v docker)" ]; then
  echo 'Erro: Docker não está instalado.' >&2
  exit 1
fi

# Iniciar o Rundeck
./scripts/setup_rundeck.sh

# Configurar o ambiente Ansible
docker run -d --name ansible \
  -v $(pwd)/ansible:/ansible/playbook \
  ansible/ansible:latest

echo "Ambiente Ansible configurado e pronto para uso"