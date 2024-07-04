#!/bin/bash

# Verifica se o Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado. Instale o Docker antes de continuar."
    exit 1
fi

# Verifica se o Docker está em execução
if ! docker info &> /dev/null; then
    echo "Docker não está em execução. Iniciando Docker..."
    # Comando para iniciar o Docker (exemplo: sudo systemctl start docker)
    # Substitua pelo comando real de inicialização do Docker no seu sistema
fi

# Verifica se o Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose não está instalado. Instale o Docker Compose antes de continuar."
    exit 1
fi

# Roda o docker-compose.yml se todas as verificações passarem
if [ -f docker-compose.yml ]; then
    echo "Rodando Docker Compose..."
    docker-compose up -d
else
    echo "Arquivo docker-compose.yml não encontrado."
    exit 1
fi

# Mensagem de conclusão
echo "Ambiente Rundeck pronto para utilização."