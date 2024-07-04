#!/bin/bash

# Script para executar o playbook Ansible dentro do container Docker

docker exec -it ansible ansible-playbook /ansible/playbook/playbook.yaml -i /ansible/playbook/hosts