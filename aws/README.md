<h1>Projeto Automatizado Completo - Etapa 3 CICD Deploy Aplicação</h1>

<h2>Passos do Terraform</h2>

<h2>Obs.: não esquecer de configurar o secrets aqui no github das credenciais por conta da pipeline</h2>

<h2>Obs.: não esquecer de pegar a AMI la na AWS de qual iamgem ec2 voce irá utilizar</h2>

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

<h3>1. Configuração do Workflow</h3>
<pre><code>.github/workflows/deploy.yml</code></pre>
<ul>
  <li>Definido para rodar em push na branch <code>main</code>.</li>
</ul>

<h3>2. Jobs do Workflow</h3>

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
  <li>Limpeza de imagens antigas no ECR</li>
</ul>