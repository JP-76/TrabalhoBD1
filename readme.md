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

	insert into mesa (capacidade, numero_mesa) values (4, '1');
	insert into mesa (capacidade, numero_mesa) values (2, '2');
	insert into mesa (capacidade, numero_mesa) values (4, '3');
	insert into mesa (capacidade, numero_mesa) values (2, '4');
	
	insert into jogo (nome, codigo, tempo_manutencao) values ('uno', '1729', '24:00:00');
	insert into jogo (nome, codigo, tempo_manutencao) values ('truco', '2489', '24:00:00');
	insert into jogo (nome, codigo, tempo_manutencao) values ('pokemon tcg black white', '8008', '24:00:00');
	insert into jogo (nome, codigo, tempo_manutencao) values ('pokemon tcg esmerald', '3030', '24:00:00');
	
	insert into expansao (fk_JOGO_id, fk_EXPANSAO_id) values (3,4);
	
	insert into estado_conservacao (estado) 
	values  ('bom'),
			('ok'),
			('ruim'),
			('péssimo');
			
	insert into Conservacao_Jogo (fk_ESTADO_CONSERVACAO_id, fk_JOGO_id) 
	values  (3, 1),
			(2, 2),
			(3, 4),
			(1, 2);
			
	insert into cliente (nome, cpf, sexo, idade) 
	values  ('Fabiano', '12345678955', 'M', 45),
			('Marcelo', '56548678955', 'M', 34),
			('Tatiane', '72345628955', 'F', 29),
			('Clara', '16541789595', 'F', 23),
			('João', '54684895547', 'M', 69),
			('Thiago', '98765432111', 'M', 27),
			('Lucianne', '65498795523', 'F', 50);
		
		
	insert into modo_cobranca (modo) 
	values 	 ('T'),
			 ('J');
		
		
	insert into comanda (qtd_pessoas, multas, tempo_gasto, FK_CLIENTE_id, FK_MESA_Id, FK_MODO_COBRANCA_id)	
	values  (4, 0.0, '2023-10-20 10:25:32', 1, 1, 1),
			(2, 10.0, '2023-10-20 15:12:39', 3, 2, 2);
			
	insert into jogos_jogados (fk_JOGO_id, fk_COMANDA_id) 
	values  (1, 1),
			(2, 1),
			(3, 2),
			(3, 2);

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    Link do trabalho no colab: https://colab.research.google.com/drive/1VzZKK79uiF8zsrykRxGWxu_4Gr6L57TB?usp=sharing<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas)

![cliente](https://github.com/JP-76/TrabalhoBD1/assets/116752185/485fbaee-f6e6-47aa-83f1-3377d8825c36)

![jogo](https://github.com/JP-76/TrabalhoBD1/assets/116752185/4ed87138-60c0-4f19-8a25-77144be7ce29)

![comanda](https://github.com/JP-76/TrabalhoBD1/assets/116752185/c2ad7769-7946-4534-ac5c-2f3bf2089a0b)

![mesa](https://github.com/JP-76/TrabalhoBD1/assets/116752185/105eba2e-1756-47ee-a010-ae697bfb2036)

![modo_cobranca](https://github.com/JP-76/TrabalhoBD1/assets/116752185/4d87531d-b386-4a88-8a63-59730d304998)

![estado_conservacao](https://github.com/JP-76/TrabalhoBD1/assets/116752185/1fd01630-74c1-40f3-8531-b4db4378e567)

![conservacao_jogo](https://github.com/JP-76/TrabalhoBD1/assets/116752185/d457dc31-388a-4b10-b2ee-e35f755365d8)

![jogos_jogados](https://github.com/JP-76/TrabalhoBD1/assets/116752185/24f3d5e0-5990-4aba-92d0-c96f9dc91a40)

![expansao](https://github.com/JP-76/TrabalhoBD1/assets/116752185/85520860-ccf7-4afc-a4c9-ee84dbb06b98)

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

># Marco de Entrega 02: Do item 6. até o item 9.1 (5 PTS) <br>

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


