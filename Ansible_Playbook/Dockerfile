# FROM joshbeard/ansible:latest

# USER root
# RUN apt-get update && apt-get install -y sudo

# WORKDIR /ansible
# COPY . /ansible


# Use a imagem base do Python
FROM python:latest

# Defina o usuário para root para instalar pacotes
USER root

# Atualize o repositório de pacotes e instale sudo
RUN apt-get update && apt-get install -y sudo

# Instale Ansible usando pip
RUN pip install ansible

# Defina o diretório de trabalho
WORKDIR /ansible

# Copie o conteúdo atual para o diretório de trabalho no contêiner
COPY . /ansible

# Comando padrão ao iniciar o contêiner
CMD ["bash"]
