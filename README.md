## 1. Introdução

### 1.1 Equipe

Integrantes do grupo:

Aroldo Vargas: aroldovneto@gmail.com<br>
Emanuel Medeiros: 

### 1.2 Objetivo

Objetivo geral do trabalho é implementar um Data Warehouse utilizando a modelagem dimensional, a partir de banco de dados transacional existente. O banco de dados MySql utilizado está disponível [aqui](https://github.com/jpwhite3/northwind-MySQL). O trabalho será utilizado como avaliação na disciplina de Inteligência de Negócios, do curso de Sistemas de Informação do IFES. 

## 2. Modelagem

### 2.1 Preparando o Ambiente 

### 2.2 Projeto Dimensional

O modelo utilizado será o estrela (star schema), nesse modelo os dados são desnormalizados para evitar joins entre tabelas, diminuindo o tempo de consultas, no entanto devido a repetição de dados, utiliza mais espaço em disco. A vantagem desse modelo é a eficiência na extração de dados, o que é um grande diferencial em se tratando de um data warehouse.


#### 2.2.1 Processo de Negócio

O processo de negócio escolhido foi o controle de estoque dos produtos, segundo Viana (2002, p.108), os estoques representam componentes extremamente significativos, seja sob aspectos econômicos financeiros ou operacionais críticos. Diante desse cenário, os gestores de estoques se veem obrigados a atualizar seus conceitos e utilizar métodos estratégicos eficazes que apoiem a tomada de decisões. Para proporcionar informações exatas e atualizadas, é necessário que se faça a avaliação dos estoques utilizando métodos quantitativos, pelos seguintes motivos: 

- Compra e reposição de produtos;
- Reduzir a incidência de perdas por roubo ou por vencimento dos prazos de validade;
- Otimizar o espaço físico de armazenamento;
- Assegurar que estejam de acordo com a política da empresa;
- Acordar melhores condições de negociação com os fornecedores;
- Assegurar que o capital imobilizado em estoque seja o mínimo possível;

Segundo Moreira (2002), é necessário saber quanto a empresa planeja vender de seus produtos ou serviços no futuro, pois essa expectativa é o ponto de partida para praticamente todas as decisões

#### 2.2.2 Definição da granularidade

#### 2.2.3 Identificação das dimensões

- Dimensão Produto
- Dimensão Data
- Dimensão Cliente
- Dimensão Fornecedor
- Dimensão Localização
- Dimensão Pedido

#### 2.2.4 Identificação dos fatos

- Fato Inventário

### 2.3 Modelo Dimensional

Em alguns aspectos, a modelagem dimensional mostra-se mais simples, mais expressiva e fácil de compreender do que a modelagem relacional. Mas sendo um conceito relativamente novo e por hora, não possuindo uma definição mais firme, é preciso que sejam apresentadas sua metodologia, técnica e algumas pistas sobre seu uso. O conceito básico da modelagem dimensional apoia a sua técnica na visualização dos modelos de dados como conjuntos de medidas que são descritos pelos aspectos comuns dos negócios. Isto é um dos lados especialmente úteis nos processos de sumarização e re-arranjo, bem como na apresentação das visões dos dados que suportam as funções de análise. A modelagem dimensional, portanto, dá enfoque a dados numéricos, tais como valores, contas, pesos, balanços e ocorrências.

![Alt text](https://github.com/aroldovargas/Data-Warehouse/blob/master/Modelos/Modelo%20Dimensional.png)

### 2.4 Base de Dados
A base de dados utilizada para realizar as cargas na tabelas dimensionais definidas no passo anterior foram disponibilizadas pela orientadora,  o banco de dados utilizado foi o myWind, um banco de dados transacional MySQL, todas a base de dados foi carregada através dos dados disponíveis no Northwind, com exceção da dimensão data que foi carregada com os dados existentes em uma planilha - Kimball Group disponibilizada no AVA. Além do modelo, todos os scripts de criação das tabelas e inserção dos dados também foram disponibilizados, como podemos ver nas imagens a seguir:

## 3. ETL

A carga de dados foi realizado o Pentaho Community, sendo o principal passo do trabalho desenvolvido. Neste capítulo será descrito os passos do grupo até chegar ao ponto final na carga de dados, quais as dificuldades entradas e o motivo de tomar determinadas decisões que são apresentadas na sequência deste capítulo. No processo de ETL foi usado além da dimensão data, a dimensão fornecedor e produto.
O grupo realizou o processo de ETL de duas formas, na primeira, a criação das tabelas dimensão foi realizada fora do Pentaho, ou seja, diretamente no Workbench, já na segunda todo o processo foi realizado dentro do Pentaho. A seguir será descrito os passos realizados em cada um dos formatos de execução do ETL citado anteriormente.

### 3.1 Primeiro Formato

#### 3.1.1 Passo 1: Criação das tabelas
Criação das tabelas dimensão que serão utilizadas para realização das cargas no Pentaho, as tabelas selecionadas, como já dito anteriormente, foram as dimensões data, produto e fornecedor. As tabelas foram criadas através do Workbench, a seguir temos as imagens que representam as atividades realizadas nesse processo.

#### 3.1.1 Passo 2: Entrada dos dados
Após a criação das tabelas do modelo dimensional, iremos criar uma nova transformação dentro do Pentaho, ao total serão três transformações, uma para cada tabela a ser carregada. Após a criação, devemos inicialmente selecionar o input (entrada) de cada transformação, como os dados da tabela fornecedor e produto estão disponíveis na base de dados Northwind, iremos adicionar uma tabela como entrada, diferentemente dos dados da tabela data, que estão disponíveis em um arquivo no formato csv, o input da dimensão data será então um arquivo csv.

#### 3.1.1 Passo 3: Seleção das tabelas
Após determinar as tabelas de entrada, o próximo passo é selecionar quais colunas e dados serão utilizados em cada uma das transformações. Esses dados são selecionados com base no modelo dimensional do projeto, ou seja, a partir da base de dados Northwind elegemos apenas as colunas que estão diretamente ligadas ao modelo dimensional.
A seguir temos as imagens referentes ao processo de seleção dos dados em cada uma das tabelas utilizadas para desenvolvimento do trabalho.

#### 3.1.1 Passo 4: Saída dos dados
Nesse passo, devemos indicar o local onde os dados deverão ser inseridos, e a relação entre as colunas das tabelas de entrada e as colunas da tabela de saída. Primeiramente devemos adicionar o nome da base de dados e o nome da dimensão onde os dados serão inseridos, vale ressaltar que essa base de dados foi criada no passo 1, com base no modelo dimensional desenvolvido pelo grupo. Depois, basta indicar a equivalência entre as dados retirados do Northwind e as colunas das tabelas dimensão que receberão a carga.

#### 3.1.1 Passo 5: Executar a transformação
O passo final do nosso processo é a execução das transformações feitas através dos passos anteriores, além disso, realizamos uma verificação das tabelas dimensão com o objetivo de afirmar o preenchimento/carga correta das mesmas. A seguir, teremos então as imagens referentes a execução e as verificações utilizadas para consultar as tabelas na base de dados do nosso modelo dimensional.


### 3.2 Segundo Formato

#### 3.1.1 Passo 1: Criação das tabelas
A criação das tabelas foi realizada diretamente no Pentaho, ou seja, a dimensão fornecedor e produtos foi construída no momento da carga. Conforme foi dito anteriormente, a dimensão data foi criada diretamente no editor do MySQL Workbench. 

Uma das diferença para o primeiro formato, é que a saída usada foi a Dimension lookup/update, para utilizar essa saída foi preciso estruturar a dimensão produto e fornecedor de um modo, por isso a estrutura das tabelas foi criada diretamente no Pentaho antes de executar o processo de carga.

#### 3.1.1 Passo 2: Entrada dos dados
#### 3.1.1 Passo 3: Seleção das tabelas
#### 3.1.1 Passo 4: Saída dos dados
#### 3.1.1 Passo 5: Executar a transformação
As imagens referentes a execução nos  dois formatos são semelhantes, porém conforme foi falado anteriormente, foi usado um tipo de saída diferente para os dois casos, sendo a parte mais importante a ser demonstrada. Enquanto no primeiro formato foi usado o tipo de saída “Table output”, no segundo formato foi usado a saída “Dimension lookup/update”.
Enquanto a saída referente a table output apenas insere os dados no banco de dados normalmente, o segundo tipo de saída citado deixa os dados versionados, no caso é criado um controle de versão para os dados inseridos, onde estará referenciado a chave primário da dimensão. Nas imagens a seguir será possível comparar e verificar melhor a diferença entre os dois tipos de saída ao visualizar como os dados ficam armazenados no banco de dados.

