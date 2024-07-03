desafio-infra-automation-davi/
│
├── ansible/
│   ├── playbook.yaml        # Playbook Ansible
│   └── roles/               # Papéis Ansible se necessário
│
├── rundeck/
│   └── job.yaml             # Job do Rundeck
│
├── terraform/
│   ├── main.tf              # Arquivo principal do Terraform
│   ├── variables.tf         # Variáveis do Terraform
│   └── outputs.tf           # Outputs do Terraform
│
├── .env
│
├── scripts/
│   ├── setup_rundeck.sh     # Script para configurar o Rundeck
│   └── start_environment.sh # Script para iniciar o ambiente (Docker, Vagrant, etc.)
│
└── README.md                # Documentação do projeto