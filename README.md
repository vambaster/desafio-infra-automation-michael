# Documentação das Alterações e Abordagens

## 1. Introdução

O objetivo deste projeto foi converter um job do Rundeck, que instala e configura Docker em várias máquinas Linux, em um playbook Ansible. Além disso, foi criado um código Terraform para provisionar as máquinas na AWS, permitindo que o playbook Ansible seja executado nas novas instâncias.

## Abordagens Tomadas

### Parte 1: Rundeck para Ansible

#### Análise do Job Rundeck

- O job Rundeck original foi analisado para entender as tarefas que ele executa.
- Tarefas identificadas:
  - Conexão com várias máquinas Linux.
  - Instalação do Docker.
  - Configuração do Docker.

#### Criação do Playbook Ansible

- Um playbook Ansible foi criado para realizar as mesmas tarefas descritas no job Rundeck.
- O playbook foi organizado em tarefas sequenciais:
  - Atualização dos pacotes e instalação de dependências.
  - Adição do repositório Docker.
  - Instalação do Docker.
  - Habilitação e início do serviço Docker.
  - Verificação do status do serviço Docker.

#### Configuração do Inventário Ansible

- Um arquivo de inventário Ansible foi criado para listar as máquinas alvo.
- As máquinas são especificadas por nome ou endereço IP.

#### Documentação

- Foi criado um arquivo `README.md` explicando como executar o playbook Ansible e descrevendo a estrutura do projeto.

### Parte 2: Provisionamento com Terraform

#### Definição dos Recursos AWS

- Utilizou-se o Terraform para definir os recursos de infraestrutura na AWS.
- Recursos criados:
  - 10 instâncias EC2.
  - Configurações de rede associadas.

#### Instalação e Configuração Automática do Docker

- Um provisioner `remote-exec` foi utilizado no Terraform para executar comandos SSH nas instâncias EC2 recém-criadas.
- Comandos executados:
  - Atualização dos pacotes.
  - Instalação de dependências.
  - Adição do repositório Docker.
  - Instalação do Docker.
  - Configuração do Docker.

#### Outputs do Terraform

- Outputs foram definidos para capturar os endereços IP das instâncias EC2.
- Isso facilita a criação do arquivo de inventário Ansible com as novas máquinas.

#### Documentação

- Foi criado um arquivo `README.md` explicando como executar o Terraform para provisionar as instâncias e descrevendo a estrutura do projeto.

## Arquivos e Comandos

### Ansible

#### `playbook.yaml`

Este arquivo define as tarefas que serão executadas pelo Ansible.

- **Atualização de pacotes e instalação de dependências**: Usa o módulo `yum` para instalar `yum-utils`.
- **Adição do repositório Docker**: Usa o módulo `command` para adicionar o repositório Docker.
- **Instalação do Docker**: Usa o módulo `yum` para instalar `docker-ce`, `docker-ce-cli`, e `containerd.io`.
- **Habilitação e início do serviço Docker**: Usa o módulo `systemd` para habilitar e iniciar o serviço Docker.
- **Verificação do status do Docker**: Usa o módulo `command` para verificar o status do serviço Docker.

#### `hosts`

Arquivo de inventário que lista as máquinas alvo onde o playbook será executado.

#### `README.md`

Documentação que explica como executar o playbook Ansible.

### Terraform

#### `main.tf`

Arquivo principal que define a infraestrutura AWS.

- **`provider "aws"`**: Configura a região da AWS.
- **`resource "aws_instance" "docker_hosts"`**: Cria 10 instâncias EC2.
  - **`provisioner "User_data"`**: Executa comandos SSH para instalar e configurar o Docker nas instâncias.
  - **`connection`**: Define a conexão SSH usando a chave privada especificada.

#### `variables.tf`

Define variáveis usadas na configuração do Terraform.

#### `outputs.tf`

Define os outputs da configuração do Terraform.

#### `README.md`

Documentação que explica como executar o Terraform para provisionar as instâncias e descreve a estrutura do projeto.

## Conclusão

O projeto foi dividido em duas partes principais: a conversão do job Rundeck em um playbook Ansible e a criação de um código Terraform para provisionar as máquinas na AWS. Ambas as partes foram cuidadosamente documentadas para garantir que as instruções de uso sejam claras e que as melhores práticas sejam seguidas. Isso permite uma configuração automatizada e gerenciável da infraestrutura de TI.

project/
│
├── Terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── README.md
│
└── Ansible_Playbook/
    ├── playbook.yaml
    ├── hosts
    ├── README.md
├── Documentação/
    ├── README.md
