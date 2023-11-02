# TRABALHO 01:  Luderia
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Filipe Moura: filipemoura.pessoal@gmail.com<br>
João Spinassé: jpspinasse@gmail.com<br>
Marllon Ribeiro: marllon.ribeiro027@gmail.com<br>
Samuel Ferreira: samuel.ferralves@gmail.com<br>


### 2.MINI-MUNDO<br>
> Uma luderia está se preparando para abrir e solicitou o desenvolvimento de um sistema para apoiar algumas de suas atividades. Luderia é um local onde grupos podem se divertir com jogos de tabuleiro, cartas e RPG enquanto podem comer e beber, como um bar. A luderia em questão precisará de auxílio em alguns campos específicos, como catálogo de  jogos, manutenção dos jogos e controle de comandas. Há duas formas de usufruir dos serviços da luderia. Na primeira, os clientes pagam por um período de tempo e podem jogar quantos jogos desejarem, além de suas expansões, respeitando que só deve haver na mesa um jogo por vez. Na segunda forma, os clientes pagam por um jogo específico, mas precisam pagar um valor extra por cada expansão que desejarem, e caso queiram jogar outro jogo, deverão pagar pelo mesmo. Quando os clientes escolhem uma mesa, deve ser gerada uma comanda única, onde devem constar o número da mesa, funcionário responsável pela mesa, o modo de cobrança, os jogos utilizados e, para o modo de cobrança por tempo, o tempo total gasto pelos clientes da mesa. Deve haver uma forma de exibir os jogos disponíveis aos clientes. Os jogos precisam de manutenção quando a luderia os adquire, e também passam por uma manutenção periódica. A Luderia pode possuir mais de uma unidade de alguns dos jogos. Deve haver uma forma de exibir ao funcionário todos os jogos, a quantidade de cada um e permitir que ele informe sobre a disponibilidade de cada exemplar de cada jogo. Um jogo estará disponível caso haja uma unidade que não esteja necessitando de manutenção e não esteja em uso. Um funcionário da luderia é quem retira os jogos do estoque e entrega na mesa. Após a devolução de um jogo, o funcionário verifica se está tudo certo. Caso haja algum dano, uma multa será aplicada e o jogo separado para manutenção. A luderia deseja fornecer aos clientes uma forma de consultar o cardápio de alimentos de forma digital. Ainda é necessário possibilitar que os clientes recebam informações sobre promoções, sendo necessário que forneçam alguma forma de contato. 

### 3.PERGUNTAS A SEREM RESPONDIDAS<br>
A empresa da luderia precisa inicialmente dos seguintes relatórios:
* Relatório que mostre os jogos disponíveis aos clientes.<br>
* Relatório que mostre a lotação da luderia em certos horários com base nos clientes e mesas.<br>
* Relatório que mostre os produtos mais consumidos na luderia durante um período especificado.<br>
* Relatório que mostre a frequência de clientes em um período de tempo específico.<br>
* Relatório que mostre o valor recebido no dia.<br>

### 5.MODELO CONCEITUAL<br>

#### A) Modelo conceitual (Feito utilizando o BRModelo)


![modelo-conceitual](https://github.com/JP-76/TrabalhoBD1/assets/101228980/cd587737-41da-4e13-930e-95ad9ac4ad5a)


#### B) As entidades mais importantes são:
* COMANDA
* JOGO
* MESA
#### C) Principais fluxos de informação/entidades do sistema são:<br>
* JOGO → COMANDA
* MESA → COMANDA
* MODO_COBRANCA → COMANDA
* CLIENTE → COMANDA
    
#### 5.1 Validação do Modelo Conceitual
	Grupo 09: Erick Komati, Jhonata Polito
	Grupo 02: Bruno Plazzi, Filipe Suhett, Giovanna Scalfoni, Caio Daniel

#### 5.2 Descrição dos dados 
	CLIENTE: Tabela que armazena as informações relativas ao cliente.
	NOME: campo que armazena o nome de cada cliente da luderia.
	CPF: campo que armazena o número de Cadastro de Pessoa Física para cada cliente da luderia.
 	SEXO: campo que armazena o sexo do cliente.
  	IDADE: campo que armazena a idade do cliente.
	
	MESA: Tabela que armazena todas as mesas da luderia.
	NUMERO_MESA: campo que armazena o identificador da mesa.
	CAPACIDADE: campo que armazena a capacidade de cada mesa.
	
	COMANDA: Tabela que armazena todas as comandas da luderia.
	QTD_PESSOAS: campo que armazena a quantidade de pessoas utilizando cada comanda.
	TEMPO_GASTO: campo que armazena o tempo gasto pelo cliente responsável pela comanda na luderia.
	MULTAS: campo que armazena as multas (se houver) a serem pagas pelo responsável pela comanda.

	MODO_COBRANCA: tabela que armazena o modo de cobrança escolhido pelo cliente responsável pela comanda.
 	MODO: campo que armazena o modo de cobrança escolhido pelo cliente.
 
	JOGO: Tabela que armazena os jogos disponíveis.
	NOME: campo que armazena o nome do jogo (ex.: uno).
	CODIGO: campo que armazena o código identificador do jogo.
	TEMPO_MANUTENCAO: campo que armazena o tempo que o jogo demora na manutenção.

 	ESTADO_CONSERVACAO: tabela que armazena o estado de conservação dos jogos.
  	ESTADO: campo que armazena o estado de conservação dos jogos.

### 6	MODELO LÓGICO<br>

![logico](https://github.com/JP-76/TrabalhoBD1/assets/116752185/b2eeeb03-75ea-4084-90e1-40bcdd7dd957)


### 7	[MODELO FÍSICO](script-create.sql)
        
	DROP TABLE IF EXISTS cliente cascade;
	DROP TABLE IF EXISTS jogo cascade;
	DROP TABLE IF EXISTS comanda cascade;
	DROP TABLE IF EXISTS mesa cascade;
	DROP TABLE IF EXISTS modo_cobranca cascade;
	DROP TABLE IF EXISTS estado_conservacao cascade;
	DROP TABLE IF EXISTS expansao cascade;
	DROP TABLE IF EXISTS jogos_jogados cascade;
	DROP TABLE IF EXISTS Conservacao_Jogo cascade;
	
	
	CREATE TABLE CLIENTE (
	    id SERIAL PRIMARY KEY,
	    nome VARCHAR,
	    cpf VARCHAR,
	    sexo CHAR,
	    idade INT
	);
	
	CREATE TABLE JOGO (
	    id SERIAL PRIMARY KEY,
	    nome VARCHAR,
	    codigo VARCHAR,
	    tempo_manutencao TIME
	);
	
	CREATE TABLE COMANDA (
	    id SERIAL PRIMARY KEY,
	    qtd_pessoas INT,
	    multas FLOAT,
	    tempo_gasto TIMESTAMP,
	    FK_CLIENTE_id SERIAL,
	    FK_MESA_Id SERIAL,
	    FK_MODO_COBRANCA_id SERIAL
	);
	
	
	
	CREATE TABLE MESA (
	    Id SERIAL PRIMARY KEY,
	    capacidade INT,
	    numero_mesa VARCHAR
	);
	
	CREATE TABLE MODO_COBRANCA (
	    id SERIAL PRIMARY key,
		modo CHAR
	);
	
	CREATE TABLE ESTADO_CONSERVACAO (
	    id SERIAL PRIMARY key,
		estado VARCHAR
	    
	);
	
	CREATE TABLE Expansao (
	    fk_JOGO_id SERIAL,
	    fk_EXPANSAO_id SERIAL
	);
	
	CREATE TABLE Jogos_Jogados (
	    fk_JOGO_id SERIAL,
	    fk_COMANDA_id SERIAL
	);
	
	CREATE TABLE Conservacao_Jogo (
	    fk_ESTADO_CONSERVACAO_id SERIAL,
	    fk_JOGO_id SERIAL
	);
	 
	ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_2
	    FOREIGN KEY (FK_CLIENTE_id)
	    REFERENCES CLIENTE (id);
	 
	ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_3
	    FOREIGN KEY (FK_MESA_Id)
	    REFERENCES MESA (Id);
	 
	ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_4
	    FOREIGN KEY (FK_MODO_COBRANCA_id)
	    REFERENCES MODO_COBRANCA (id);
	 
	ALTER TABLE Expansao ADD CONSTRAINT FK_Expansao_1
	    FOREIGN KEY (fk_JOGO_id)
	    REFERENCES JOGO (id);
	 
	ALTER TABLE Expansao ADD CONSTRAINT FK_Expansao_2
	    FOREIGN KEY (fk_EXPANSAO_id)
	    REFERENCES JOGO (id);
	 
	ALTER TABLE Jogos_Jogados ADD CONSTRAINT FK_Jogos_Jogados_1
	    FOREIGN KEY (fk_JOGO_id)
	    REFERENCES JOGO (id);
	 
	ALTER TABLE Jogos_Jogados ADD CONSTRAINT FK_Jogos_Jogados_2
	    FOREIGN KEY (fk_COMANDA_id)
	    REFERENCES COMANDA (id);
	 
	ALTER TABLE Conservacao_Jogo ADD CONSTRAINT FK_Possui_1
	    FOREIGN KEY (fk_ESTADO_CONSERVACAO_id)
	    REFERENCES ESTADO_CONSERVACAO (id);
	 
	ALTER TABLE Conservacao_Jogo ADD CONSTRAINT FK_Possui_2
	    FOREIGN KEY (fk_JOGO_id)
	    REFERENCES JOGO (id);

      
### 8	[INSERT APLICADO NAS TABELAS DO BANCO DE DADOS](script-insert.sql)

	insert into cliente (nome, cpf, sexo, idade) 
	values  ('Fabiano', '123.456.789-55', 'M', 45),
		('Marcelo', '565.486.789-55', 'M', 34),
		('Tatiane', '723.456.289-55', 'F', 29),
		('Clara', '165.417.895-95', 'F', 23),
		('João', '546.848.955-47', 'M', 69),
		('Thiago', '987.654.321-11', 'M', 27),
		('Lucianne', '654.987.955-23', 'F', 50),
	        ('Renata', '456.789.123-77', 'F', 32),
	        ('Pedro', '321.654.987-44', 'M', 41),
	        ('Julia', '789.123.456-66', 'F', 25);
	
	insert into mesa (capacidade, numero_mesa) 
	values (4, '1'),
	       (2, '2'),
	       (4, '3'),
	       (2, '4'),
	       (6, '5'),
	       (4, '6'),
	       (8, '7'),
	       (6, '8'),
	       (4, '9'),
	       (2, '10');
	
	insert into jogo (nome, codigo, tempo_manutencao)
	values ('uno', '1729', '02:00:00'),
	       ('truco', '2489', '10:00:00'),
	       ('pokemon tcg black white', '8008', '12:00:00'),
	       ('pokemon tcg emerald', '3030', '20:00:00'),
	       ('dominó', '4567', '01:30:00'),
	       ('xadrez', '9876', '05:00:00'),
	       ('monopoly', '1234', '08:00:00'),
	       ('war', '4321', '15:00:00'),
	       ('magic the gathering', '6789', '18:00:00'),
	       ('jogo da vida', '8765', '03:00:00');
	
	insert into modo_cobranca (modo) 
	values  ('T'),
		('J');
			 
	insert into expansao (fk_JOGO_id, fk_EXPANSAO_id)
	values (3,4);
	
	insert into estado_conservacao (estado) 
	values  ('bom'),
		('ok'),
		('ruim'),
		('péssimo');
		
	insert into comanda (qtd_pessoas, multas, tempo_gasto, FK_CLIENTE_id, FK_MESA_Id, FK_MODO_COBRANCA_id)	
	values  (4, 0.0, '2023-10-20 10:25:32', 1, 1, 1),
		(2, 10.0, '2023-10-20 15:12:39', 3, 2, 2),
		(5, 0.0, '2023-10-20 16:01:42', 7, 5, 2),
		(1, 0.0, '2023-10-20 23:00:00', 9, 4, 1),
		(8, 15.0, '2023-10-21 13:24:33', 10, 7, 2),
		(3, 0.0, '2023-10-21 13:51:57', 2, 6, 1),
		(4, 0.0, '2023-10-21 14:10:21', 5, 1, 1);
			
	insert into Conservacao_Jogo (fk_ESTADO_CONSERVACAO_id, fk_JOGO_id) 
	values  (3, 1),
		(2, 2),
		(3, 4),
		(1, 2),
	        (4, 5),
	        (2, 6),
	        (3, 7),
	        (1, 8),
	        (4, 9),
	        (2, 10);
	
	insert into jogos_jogados (fk_JOGO_id, fk_COMANDA_id) 
	values  (1, 1),
		(2, 1),
		(3, 2),
		(3, 2),
		(4, 2),
		(7, 5),
		(10, 5),
		(9, 4),
		(3, 2),
		(7, 1);

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    Link do trabalho no colab: https://colab.research.google.com/drive/1VzZKK79uiF8zsrykRxGWxu_4Gr6L57TB?usp=sharing
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas)


![cliente](https://github.com/JP-76/TrabalhoBD1/assets/116752185/afbaed85-e319-4242-8fa6-d8cfd0f0711c)

![jogo](https://github.com/JP-76/TrabalhoBD1/assets/116752185/2480e8f4-26f6-415d-b334-f9ad388f39a2)

![comanda](https://github.com/JP-76/TrabalhoBD1/assets/116752185/3e3c8b2d-18e7-4603-8a12-9329d417fa0f)

![mesa](https://github.com/JP-76/TrabalhoBD1/assets/116752185/bff92a3a-2b48-4504-befa-f69fe714d421)

![modo_cobranca](https://github.com/JP-76/TrabalhoBD1/assets/116752185/48f47bca-0f7a-468f-b093-a52aec0d5fb0)

![estado_conservacao](https://github.com/JP-76/TrabalhoBD1/assets/116752185/4bc0e8e2-3778-4a87-a60c-55db83a54a67)

![conservacao_jogo](https://github.com/JP-76/TrabalhoBD1/assets/116752185/4706b0a2-0553-4b2f-ab11-d39bce52624e)

![jogos_jogados](https://github.com/JP-76/TrabalhoBD1/assets/116752185/d32cd7ba-1149-4936-86ed-b85c801e533c)

![expansao](https://github.com/JP-76/TrabalhoBD1/assets/116752185/72c00dff-c1f3-4cb8-9249-cff24ae1db08)

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)

![jogo](https://github.com/JP-76/TrabalhoBD1/assets/116752185/e84259e9-da79-428a-a6cb-b4fecf3e46e7)<br>
	SELECT * FROM jogo WHERE codigo = '8008'

![masculino](https://github.com/JP-76/TrabalhoBD1/assets/116752185/3717e942-b507-4468-b337-3edf0038d5ce)<br>
	SELECT * FROM cliente WHERE sexo = 'M'

![menos30](https://github.com/JP-76/TrabalhoBD1/assets/116752185/916db566-cf5a-4fec-a220-b21c63d29f9b)<br>
	SELECT * FROM cliente WHERE idade <= 30

![feminino](https://github.com/JP-76/TrabalhoBD1/assets/116752185/2d7b57e2-a670-497a-ab62-bbff8cfe3b82)<br>
	SELECT * FROM cliente WHERE sexo = 'F'

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)


##### 9.3.1 Consultas com operadores lógicos

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/1b989728-53db-44db-85f8-84c0d9e6a8cb)<br>
	SELECT * FROM comanda WHERE fk_mesa_id = 1 AND fk_modo_cobranca_id = 1

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/b8247592-9270-4831-8c48-dfeb1581aae9)<br>
	SELECT * FROM mesa WHERE (capacidade > 3 And numero_mesa = '3')

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/a883a236-0a55-4731-a507-1073b02e61c0)<br>
	SELECT * FROM comanda WHERE multas < 2 and fk_mesa_id = 1

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/80fea8d4-0b9d-4bda-b030-dd788bb8e55a)<br>
	SELECT * FROM cliente WHERE not idade > 25

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/e9126338-4ba4-47e0-a162-a9cb7c318ae1)<br>
	SELECT * FROM estado_conservacao WHERE not estado = 'bom'


##### 9.3.2 Consultas com operadores aritméticos

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/92ee171e-2b50-4b9f-b442-85bd8000d060)<br>
	SELECT capacidade + 2 AS "capacidade mais dois" FROM mesa

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/2452ecba-0e67-4787-bed6-d890c6e7fd73)<br>
	SELECT capacidade / 2 AS "capacidade dividido por 2" FROM mesa

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/9354ec95-819c-4699-8ba8-bd3cdf93e713)<br>
	SELECT qtd_pessoas / 2 AS "quant pessoas por 2" FROM comanda

 
##### 9.3.3 Consultas com campos/tabelas renomeadas

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/c6d9e6c1-903c-475e-b345-5bfd638dd110)<br>
	SELECT nome, codigo as id FROM jogo

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/550a0ac8-6625-4e42-99fd-2b09034f1496)<br>
	SELECT nome, cpf as identidade FROM cliente

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/307a0c42-2be3-41fd-bad8-4271a25bf81f)<br>
	SELECT estado as condicao FROM estado_conservacao


#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12)

##### 9.4.1 Consultas com LIKE/ILIKE

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/ea05d7ae-0e97-4281-9197-03ed626914b1)<br>
	SELECT * FROM cliente WHERE nome LIKE '%a%' or nome LIKE 'A%' or nome LIKE '%a'
 
![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/3e27812d-15bd-42bc-a433-7b055ec262d5)<br>
	SELECT * FROM cliente WHERE nome ILIKE '%o%' or nome ILIKE 'o%' or nome ILIKE '%o'

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/e74977dd-3cd4-4c76-8816-3f1b34191a23)<br>
	SELECT * FROM jogo WHERE nome ILIKE '%o'

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/bb0a22fd-5f8b-4b83-b37c-9a89b1acd478)<br>
	SELECT * FROM jogo WHERE nome ILIKE '%tcg%'
 
![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/d09e236f-dc9b-4527-b290-563d853eab7e)<br>
	SELECT nome, cpf FROM cliente WHERE cpf ILIKE '%5_'


##### 9.4.2 Consultas com funções de data

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/1bf15610-c075-4d3b-9610-45af1a557d6f)<br>
	SELECT nome, date_part('year', current_date) - idade AS data_de_nascimento FROM cliente

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/402f16df-a2b6-45a0-9ff7-b58ffb3e90c2)<br>
	SELECT fk_mesa_id as mesa, (date_part('hour', current_time) - 3) - date_part('hour', tempo_gasto) AS horas_passadas FROM comanda

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/b7c1cd00-b807-44b9-ae4b-5bb9a2bd400f)<br>
	SELECT fk_mesa_id as mesa, date_part('hour', tempo_gasto) - (date_part('hour', current_time) - 3) AS horas_passadas FROM comanda

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/f4315833-fef6-4060-aef5-8b78e684d78e)<br>
	SELECT fk_mesa_id as mesa, date_part('hour', tempo_gasto) - (date_part('hour', now()) - 3) AS horas_passadas FROM comanda

![image](https://github.com/JP-76/TrabalhoBD1/assets/116752185/c31e2b8c-467c-4f3c-bdad-7881d9da9ffc)<br>
	SELECT fk_mesa_id as mesa, extract('hour' from tempo_gasto) - (extract('hour' from now()) - 3) AS horas_passadas FROM comanda
 

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

># Marco de Entrega 03: Do item 9.2 até o ítem 9.10 (10 PTS)<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 04: Itens 10 e 11 (20 PTS) <br>
<br>
<br>




### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


