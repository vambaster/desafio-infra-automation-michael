# Desafio de Automação de Infraestrutura

## Objetivo

O objetivo deste desafio é avaliar suas habilidades em Rundeck e Ansible. Você precisará converter um job complexo do Rundeck, que interage com diversas máquinas Linux para instalar e configurar Docker, em um playbook Ansible.

## Estrutura do Projeto

```plaintext
desafio-infra-automation-davi/
├── ansible/
│   ├── playbook.yaml        # Playbook Ansible
│   └── roles/               # Papéis Ansible se necessário
├── rundeck/
│   └── job.yaml             # Job do Rundeck
├── terraform/
│   ├── main.tf              # Arquivo principal do Terraform
│   ├── variables.tf         # Variáveis do Terraform
│   └── outputs.tf           # Outputs do Terraform
├── .env
├── scripts/
│   ├── setup_rundeck.sh     # Script para configurar o Rundeck
│   └── start_environment.sh # Script para iniciar o ambiente (Docker, Vagrant, etc.)
└── README.md                # Documentação do projeto