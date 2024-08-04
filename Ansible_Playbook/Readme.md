# Ansible Playbook

## Objetivo

Este playbook Ansible foi criado para substituir um job Rundeck que instala e configura Docker em várias máquinas Linux.

## Como Executar

1. **Pré-requisitos**:
   - Certifique-se de que as máquinas estão acessíveis via SSH.
   - Tenha o Ansible instalado na máquina de controle.

2. **Configurando o Inventário**:
   - Edite o arquivo `hosts` para incluir os endereços IP ou nomes de host das máquinas.

3. **Executando o Playbook**:
   - Execute o comando:
     ```bash
     ansible-playbook -i hosts playbook.yaml
     ```

## Estrutura do Projeto

- `playbook.yaml`: O playbook Ansible que realiza as ações descritas.
- `hosts`: Arquivo de inventário que lista as máquinas alvo.

## Tarefas do Playbook

- **Atualização de pacotes e instalação de dependências**:
  - Usa o módulo `yum` para instalar `yum-utils`.
- **Adição do repositório Docker**:
  - Usa o módulo `command` para adicionar o repositório Docker.
- **Instalação do Docker**:
  - Usa o módulo `yum` para instalar `docker-ce`, `docker-ce-cli`, e `containerd.io`.
- **Habilitação e início do serviço Docker**:
  - Usa o módulo `systemd` para habilitar e iniciar o serviço Docker.
- **Verificação do status do Docker**:
  - Usa o módulo `command` para verificar o status do serviço Docker.
    