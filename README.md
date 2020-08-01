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

## 3. ETL

