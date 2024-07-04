# Automação com terraform + AWS e Pipeline CI/CD github Actions

## CONFIG TERRAFORM

### Instalação do Terraform
Deixei o **Terraform install ZIP** caso ainda não tenha instalado. Descompacte no disco C (você pode renomear a pasta se quiser).

1. Abra as variáveis de ambiente no Windows (no menu iniciar, digite `variáveis de ambiente`).
2. Ao abrir, clique novamente em variáveis de ambiente.
3. Clique em `Path` e no botão `Novo`.
4. Clique em `Procurar` e selecione sua pasta Terraform que está no disco C.
5. Clique em `OK` e pronto para abrir o seu VSCode.
6. *Obs.:* Não esquecer de configurar o usuário no IAM dentro da AWS e pegar a AMI na AWS da imagem EC2 que você irá utilizar (exemplo: Ubuntu, Windows, Linux, etc.).
7. Obs.: não esquecer de configurar o secrets aqui no github das credenciais criados na AWS por conta da pipeline

<h3>1. Configuração do Provedor AWS</h3>
<pre><code>providers.tf</code></pre>
<ul>
  <li>Define o provedor AWS com variáveis de acesso.</li>
</ul>


<h3>2. Definição dos Recursos</h3>
<pre><code>main.tf</code></pre>
<ul>
  <li>Cria 10 instâncias EC2 com uma AMI específica.</li>
</ul>

<h3>3. Variáveis</h3>
<pre><code>variables.tf</code></pre>
<ul>
  <li>Define variáveis como chaves de acesso, região, AMI ID e tipo de instância.</li>
</ul>

<h3>4. Valores das Variáveis</h3>
<pre><code>terraform.tfvars</code></pre>
<ul>
  <li>Especifica os valores para as variáveis definidas em <code>variables.tf</code>.</li>
</ul>

<h3>5. Outputs</h3>
<pre><code>outputs.tf</code></pre>
<ul>
  <li>Define outputs para visualizar IDs e IPs públicos das instâncias criadas.</li>
</ul>

<h3>6. Comandos Terraform</h3>
<ul>
  <li>Inicializar: <code>terraform init</code></li>
  <li>Aplicar: <code>terraform apply -auto-approve</code></li>
</ul>

<h2>Pipeline CI/CD no GitHub Actions</h2>

Na pipeline deixei o apply e o destroy, quando for fazer o apply tem que estar DESCOMENTADO:

```sh
      - name: Aplicar Terraform
        run: terraform apply -auto-approve
        working-directory: Terraform_IaC
```

E caso for destruir, comentar o codigo acima do apply e deixar DESCOMENTADO esse trecho da pipeline:

```sh
      - name: Destruir Terraform
        run: terraform destroy -auto-approve
        working-directory: Terraform_IaC
```

<h3>1. Configuração do Workflow</h3>
<pre><code>.github/workflows/deploy.yml</code></pre>
<ul>
  <li>Definido para rodar em push na branch então ao fazer git push ativara a pipeline dentro da branch</li>
</ul>

<h3>2. Jobs do Workflow CICD</h3>

<h4>Deploy</h4>
<ul>
  <li>Checkout do repositório</li>
  <li>Configuração das credenciais AWS</li>
  <li>Configuração do Terraform</li>
  <li>Inicialização e aplicação do Terraform</li>
</ul>

<h4>Provisionamento terraform e AWS EC2</h4>
<ul>
  <li>Build e push de 10 imagens pra EC2</li>
</ul>

3. Caso quiser destruir tudo da AWS, vai na pipeline, comene o stage de apply e descomente o de destroy e rode o commit assim ele fara a função de destruir todo o ambiente na aws