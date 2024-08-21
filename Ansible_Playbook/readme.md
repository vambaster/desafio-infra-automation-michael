Explicação:
Hosts: Defini os hosts no campo hosts com os mesmos nomes das máquinas no filtro do Rundeck.

become: yes: Isso permite que as tasks sejam executadas com privilégios de superusuário, semelhante ao sudo no Rundeck.

Tasks:

A primeira task instala o pacote yum-utils.
A segunda task adiciona o repositório do Docker usando o módulo command.
A terceira task instala o Docker e seus componentes usando o módulo yum.
A quarta task adiciona o usuário atual ao grupo docker.
A última task habilita e inicia o serviço Docker usando o módulo systemd.
Para executar:
Salve este conteúdo em um arquivo YAML, por exemplo docker-setup.yml, e execute o playbook usando o comando:

ansible-playbook docker-setup.yml -u <user>
