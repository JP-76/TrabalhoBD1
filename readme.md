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
> Uma luderia está se preparando para abrir e solicitou o desenvolvimento de um sistema para apoiar algumas de suas atividades. Luderia é um local onde grupos podem se divertir com jogos de tabuleiro, cartas e RPG enquanto podem comer e beber, como um bar. A luderia em questão precisará de auxílio em alguns campos específicos, como catálogo de  jogos, manutenção dos jogos e controle de comandas. Há duas formas de usufruir dos serviços da luderia. Na primeira, os clientes pagam por um período de tempo e podem jogar quantos jogos desejarem, além de suas expansões, respeitando que só deve haver na mesa um jogo por vez. Na segunda forma, os clientes pagam por um jogo específico, mas precisam pagar um valor extra por cada expansão que desejarem, e caso queiram jogar outro jogo, deverão pagar pelo mesmo. Quando os clientes escolhem uma mesa, deve ser gerada uma comanda única, onde devem constar o número da mesa, o modo de cobrança, os jogos utilizados e, para o modo de cobrança por tempo, o tempo total gasto pelos clientes da mesa. Deve haver uma forma de exibir os jogos disponíveis aos clientes. Os jogos precisam de manutenção quando a luderia os adquire, e também passam por uma manutenção periódica. A Luderia pode possuir mais de uma unidade de alguns dos jogos. Deve haver uma forma de exibir ao funcionário todos os jogos, a quantidade de cada um e permitir que ele informe sobre a disponibilidade de cada exemplar de cada jogo. Um jogo estará disponível caso haja uma unidade que não esteja necessitando de manutenção e não esteja em uso. Um funcionário da luderia é quem retira os jogos do estoque e entrega na mesa. Após a devolução de um jogo, o funcionário verifica se está tudo certo. Caso haja algum dano, uma multa será aplicada e o jogo separado para manutenção. Ainda é necessário possibilitar que os clientes recebam informações sobre promoções, sendo necessário que forneçam alguma forma de contato. 

### 3.PERGUNTAS A SEREM RESPONDIDAS<br>
A empresa da luderia precisa inicialmente dos seguintes relatórios:
* Relatório que mostre os jogos mais jogados na luderia.<br>
* Relatório que mostre os jogos jogados por um cliente específico.<br>
* Relatório que mostre a lotação da luderia em certos horários com base nos clientes e mesas.<br>
* Relatório que mostre o estado de conservação dos jogos.<br>
* Relatório que mostre o tempo de uso médio de cada jogo.<br>

### 5.MODELO CONCEITUAL<br>

#### A) Modelo conceitual (Feito utilizando o BRModelo)

![modelo-conceitual](https://github.com/JP-76/TrabalhoBD1/assets/116752185/8fb03ff0-8d11-4a65-af54-5b8e0f12e7b8)

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
  	DT_NASC: campo que armazena a data de nascimento do cliente.
	
	MESA: Tabela que armazena todas as mesas da luderia.
	NUMERO_MESA: campo que armazena o identificador da mesa.
	CAPACIDADE: campo que armazena a capacidade de cada mesa.
	
	COMANDA: Tabela que armazena todas as comandas da luderia.
	QTD_PESSOAS: campo que armazena a quantidade de pessoas utilizando cada comanda.
	HORARIO_INICIO: campo que armazena o horário que o cliente responsável pela comanda chegou na luderia.
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

![logico](https://github.com/JP-76/TrabalhoBD1/assets/116752185/5e23617c-1a5b-44ee-8e37-eff983aefb78)



### 7	[MODELO FÍSICO](script-create.sql)
        
	DROP TABLE IF EXISTS cliente cascade;
	DROP TABLE IF EXISTS jogo cascade;
	DROP TABLE IF EXISTS comanda cascade;
	DROP TABLE IF EXISTS mesa cascade;
	DROP TABLE IF EXISTS modo_cobranca cascade;
	DROP TABLE IF EXISTS estado_conservacao cascade;
	DROP TABLE IF EXISTS expansao cascade;
	DROP TABLE IF EXISTS jogo_jogado cascade;


	CREATE TABLE CLIENTE (
    	id SERIAL PRIMARY KEY,
    	nome VARCHAR,
    	cpf VARCHAR,
    	sexo CHAR,
    	dt_nasc DATE
	);

	CREATE TABLE JOGO (
    	id SERIAL PRIMARY KEY,
    	nome VARCHAR,
    	codigo VARCHAR,
    	tempo_manutencao TIME,
    	fk_ESTADO_CONSERVACAO SERIAL
	);

	CREATE TABLE COMANDA (
    	id SERIAL PRIMARY KEY,
    	qtd_pessoas INT,
    	multas FLOAT,
    	horario_inicio TIMESTAMP,
    	horario_fim TIMESTAMP,
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

	CREATE TABLE Jogo_Jogado (
    	fk_JOGO_id SERIAL,
    	fk_COMANDA_id SERIAL
	);


	ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_1
    	FOREIGN KEY (FK_CLIENTE_id)
    	REFERENCES CLIENTE (id);
 
	ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_2
    	FOREIGN KEY (FK_MESA_Id)
    	REFERENCES MESA (Id);
 
	ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_3
    	FOREIGN KEY (FK_MODO_COBRANCA_id)
    	REFERENCES MODO_COBRANCA (id);
 
	ALTER TABLE Expansao ADD CONSTRAINT FK_Expansao_1
    	FOREIGN KEY (fk_JOGO_id)
    	REFERENCES JOGO (id);
 
	ALTER TABLE Expansao ADD CONSTRAINT FK_Expansao_2
    	FOREIGN KEY (fk_EXPANSAO_id)
    	REFERENCES JOGO (id);
 
	ALTER TABLE Jogo_Jogado ADD CONSTRAINT FK_Jogo_Jogado_1
    	FOREIGN KEY (fk_JOGO_id)
    	REFERENCES JOGO (id);
 
	ALTER TABLE Jogo_Jogado ADD CONSTRAINT FK_Jogo_Jogado_2
    	FOREIGN KEY (fk_COMANDA_id)
    	REFERENCES COMANDA (id);
 
	ALTER TABLE Jogo ADD CONSTRAINT FK_Conservacao_1
    	FOREIGN KEY (fk_ESTADO_CONSERVACAO)
    	REFERENCES ESTADO_CONSERVACAO (id);
      
### 8	[INSERT APLICADO NAS TABELAS DO BANCO DE DADOS](script-insert.sql)

	insert into cliente (nome, cpf, sexo, dt_nasc) 
	values  ('Fabiano', '123.456.789-55', 'M', '1985-07-12'),
		('Marcelo', '565.486.789-55', 'M', '1992-04-26'),
		('Tatiane', '723.456.289-55', 'F', '1977-09-03'),
		('Clara', '165.417.895-95', 'F', '2001-11-18'),
		('João', '546.848.955-47', 'M', '1988-02-09'),
		('Thiago', '987.654.321-11', 'M', '1975-06-30'),
		('Lucianne', '654.987.955-23', 'F', '1999-08-22'),
	        ('Renata', '456.789.123-77', 'F', '1982-12-15'),
	        ('Pedro', '321.654.987-44', 'M', '1990-05-07'),
	        ('Julia', '789.123.456-66', 'F', '1972-10-20'),
	 	('Ana Silva', '123.456.789-09', 'F', '1990-01-15'),
		('Carlos Oliveira', '234.567.890-12', 'M', '1985-03-22'),
		('Fernanda Santos', '345.678.901-23', 'F', '2002-07-05'),
		('Gustavo Pereira', '456.789.012-34', 'M', '1978-09-11'),
		('Isabela Lima', '567.890.123-45', 'F', '1995-11-28'),
		('Joaquim Souza', '678.901.234-56', 'M', '1987-04-04'),
		('Luciana Rocha', '789.012.345-67', 'F', '2000-06-17'),
		('Marcelo Costa', '890.123.456-78', 'M', '1973-08-30'),
		('Natália Oliveira', '901.234.567-89', 'F', '1993-10-09'),
		('Paulo Martins', '012.345.678-90', 'M', '1980-12-25'),
		('Rafaela Pereira', '123.456.789-01', 'F', '1991-02-18'),
		('Sérgio Silva', '234.567.890-12', 'M', '1976-05-03'),
		('Vanessa Santos', '345.678.901-23', 'F', '1983-11-14'),
		('Antônio Oliveira', '456.789.012-89', 'M', '1995-07-12'),
		('Beatriz Lima', '567.890.123-34', 'F', '1988-04-26'),
		('César Souza', '678.901.234-67', 'M', '1977-09-03'),
		('Daniela Pereira', '789.012.345-45', 'F', '2001-11-18'),
		('Eduardo Martins', '890.123.456-23', 'M', '1988-02-09'),
		('Fernanda Silva', '901.234.567-99', 'F', '1975-06-30'),
		('Gabriel Costa', '012.345.678-22', 'M', '1999-08-22'),
		('Helena Rocha', '123.456.789-77', 'F', '1982-12-15'),
		('Ícaro Santos', '234.567.890-44', 'M', '1990-05-07'),
		('Juliana Oliveira', '345.678.901-66', 'F', '1972-10-20'),
		('Kauã Pereira', '456.789.012-11', 'M', '1994-03-05'),
		('Laura Lima', '567.890.123-88', 'F', '1986-01-28'),
		('Miguel Souza', '678.901.234-55', 'M', '2003-09-14'),
		('Natalia Martins', '789.012.345-33', 'F', '1979-07-07'),
		('Otávio Silva', '890.123.456-66', 'M', '1997-02-01'),
		('Paula Costa', '901.234.567-22', 'F', '1984-08-24'),
		('Quiteria Rocha', '012.345.678-44', 'F', '1992-06-10'),
		('Ricardo Oliveira', '123.456.789-55', 'M', '1981-04-02'),
		('Sofia Lima', '234.567.890-77', 'F', '2000-10-12'),
		('Thiago Pereira', '345.678.901-99', 'M', '1974-03-18'),
		('Vanessa Oliveira', '456.789.012-01', 'F', '1998-07-22'),
		('William Lima', '567.890.123-45', 'M', '1989-04-14'),
		('Ximena Souza', '678.901.234-89', 'F', '1976-11-07'),
		('Yago Pereira', '789.012.345-12', 'M', '2001-01-31'),
		('Zara Costa', '890.123.456-78', 'F', '1987-09-25'),
		('Alexandre Martins', '901.234.567-34', 'M', '1993-06-18'),
		('Bruna Silva', '012.345.678-56', 'F', '1982-02-10'),
		('Carlos Oliveira', '123.456.789-67', 'M', '1996-10-04'),
		('Diana Lima', '234.567.890-89', 'F', '1974-03-29'),
		('Eduardo Rocha', '345.678.901-23', 'M', '2002-08-15');
		
	insert into mesa (capacidade, numero_mesa) 
	values  (4, '1'),
		(2, '2'),
		(4, '3'),
		(2, '4'),
		(6, '5'),
		(4, '6'),
		(8, '7'),
		(6, '8'),
		(4, '9'),
		(2, '10'),
		(4, '11'),
		(2, '12'),
		(4, '13'),
		(2, '14'),
		(6, '15'),
		(4, '16'),
		(8, '17'),
		(6, '18'),
		(4, '19'),
		(2, '20'),
		(6, '21'),
		(8, '22'),
		(4, '23'),
		(2, '24'),
		(4, '25'),
		(6, '26'),
		(8, '27'),
		(2, '28'),
		(4, '29'),
		(6, '30'),
		(2, '31'),
		(4, '32'),
		(6, '33'),
		(8, '34'),
		(4, '35'),
		(2, '36'),
		(6, '37'),
		(4, '38'),
		(2, '39'),
		(8, '40'),
		(4, '41'),
		(6, '42'),
		(2, '43'),
		(4, '44'),
		(6, '45'),
		(8, '46'),
		(2, '47'),
		(4, '48'),
		(6, '49'),
		(4, '50');
	
	insert into estado_conservacao (estado) 
	values  ('bom'),
		('ok'),
		('ruim'),
		('péssimo');
	 
	INSERT INTO jogo (nome, codigo, tempo_manutencao, fk_ESTADO_CONSERVACAO)
	VALUES	  ('uno', '1729', '02:00:00', 1),
		  ('uno versão deluxe', '1730', '03:30:00', 2),
		  ('uno extremo', '1731', '04:15:00', 3),
		  ('truco', '2489', '10:00:00', 1),
		  ('truco gaúcho', '2490', '11:30:00', 4),
		  ('truco paulista', '2491', '09:45:00', 1),
		  ('pokemon tcg classic', '1001', '23:30:00', 3),
		  ('pokemon tcg black and white', '8008', '12:00:00', 1),
		  ('pokemon tcg emerald', '3030', '20:00:00', 4),
		  ('pokemon tcg red', '1252', '18:00:00', 3),
		  ('dominó', '4567', '01:30:00', 2),
		  ('xadrez', '9876', '05:00:00', 1),
		  ('monopoly', '1234', '08:00:00', 1),
		  ('war', '4321', '15:00:00', 1),
		  ('magic the gathering', '6789', '18:00:00', 1),
		  ('jogo da vida', '8765', '03:00:00', 3),
		  ('catan', '5555', '04:30:00', 1),
		  ('carcassonne', '9999', '02:45:00', 2),
		  ('risk', '1111', '14:00:00', 1),
		  ('scrabble', '7777', '06:30:00', 2),
		  ('xadrez 3D', '3256', '04:45:00', 2),
		  ('risk estratégico', '9876', '13:30:00', 3),
		  ('scrabble deluxe', '6543', '07:15:00', 4),
		  ('monopoly edição especial', '1122', '09:30:00', 2),
		  ('dominó duplo 9', '4444', '02:00:00', 1),
		  ('uno selvagem', '5511', '03:45:00', 1),
		  ('trilha estelar', '9898', '06:00:00', 1),
		  ('magic the gathering - modern', '7771', '19:00:00', 3),
		  ('pokemon tcg gold', '8888', '10:30:00', 2),
		  ('jogo da vida eletrônico', '3333', '04:15:00', 1),
		  ('catan - cidades e cavaleiros', '2222', '05:30:00', 2),
		  ('carcassonne inns & cathedrals', '1112', '03:45:00', 3),
		  ('truco argentino', '6771', '11:00:00', 2),
		  ('uno attack', '3456', '05:30:00', 3),
		  ('war - edição mundial', '2345', '18:30:00', 1),
		  ('pokemon tcg platinum', '9999', '16:00:00', 2),
		  ('ticket to ride - europe', '8765', '07:30:00', 1),
		  ('risk global domination', '1113', '12:45:00', 3),
		  ('clue - versão mistério', '4567', '08:15:00', 2),
		  ('settlers of catan', '8899', '06:45:00', 1);
	
	insert into modo_cobranca (modo) 
	values 	('T'),
		('J');
			 
	insert into expansao (fk_JOGO_id, fk_EXPANSAO_id)
	values (1, 2),
	       (1, 3),
	       (4, 5),
	       (4, 6),
	       (7, 8),
	       (7, 9),
	       (7, 10);
		
 	insert into comanda (qtd_pessoas, multas, horario_inicio, horario_fim, FK_CLIENTE_id, FK_MESA_Id, FK_MODO_COBRANCA_id)
 	values  (4, 0.0, '2023-10-20 10:25:32', '2023-10-20 12:25:32', 1, 1, 1),
		(2, 10.0, '2023-10-20 15:12:39', '2023-10-20 18:12:39', 3, 2, 2),
		(5, 0.0, '2023-10-20 16:01:42', '2023-10-20 19:01:42', 7, 5, 2),
		(1, 0.0, '2023-10-20 23:00:00', '2023-10-21 01:00:00', 9, 4, 1),
		(8, 15.0, '2023-10-21 13:24:33', '2023-10-21 18:24:33', 10, 7, 2),
		(3, 0.0, '2023-10-21 13:51:57', '2023-10-21 15:51:57', 2, 6, 1),
		(4, 0.0, '2023-10-21 14:10:21', '2023-10-21 16:10:21', 5, 1, 1),
		(2, 5.0, '2023-10-21 15:30:45', '2023-10-21 17:30:45', 6, 3, 1),
		(6, 0.0, '2023-10-21 16:45:12', '2023-10-21 18:45:12', 8, 8, 2),
		(3, 0.0, '2023-10-22 12:10:30', '2023-10-22 14:10:30', 4, 2, 1),
		(7, 8.0, '2023-10-22 14:20:18', '2023-10-22 22:20:18', 1, 5, 2),
		(5, 0.0, '2023-10-22 18:30:50', '2023-10-22 20:30:50', 9, 9, 1),
		(4, 0.0, '2023-10-23 11:15:05', '2023-10-23 13:15:05', 7, 4, 1),
		(1, 0.0, '2023-10-23 13:40:22', '2023-10-23 15:40:22', 3, 7, 2),
		(2, 3.0, '2023-10-23 16:55:37', '2023-10-23 18:55:37', 10, 6, 2),
		(8, 0.0, '2023-10-24 09:00:10', '2023-10-24 12:00:10', 2, 1, 1),
		(3, 0.0, '2023-10-24 11:20:30', '2023-10-24 13:20:30', 5, 10, 1),
		(6, 12.0, '2023-10-24 14:40:45', '2023-10-24 17:40:45', 8, 3, 2),
		(4, 0.0, '2023-10-25 17:05:58', '2023-10-25 19:05:58', 2, 5, 1),
		(2, 0.0, '2023-10-25 19:30:12', '2023-10-25 21:30:12', 6, 9, 1),
		(5, 0.0, '2023-10-25 21:55:25', '2023-10-25 23:55:25', 1, 7, 2),
		(1, 0.0, '2023-10-26 10:10:40', '2023-10-26 12:10:40', 9, 2, 1),
		(7, 10.0, '2023-10-26 12:35:55', '2023-10-26 22:35:55', 4, 4, 2),
		(3, 0.0, '2023-10-26 15:00:08', '2023-10-26 17:00:08', 10, 8, 1),
		(6, 0.0, '2023-10-27 17:25:20', '2023-10-27 19:25:20', 3, 6, 1),
		(4, 0.0, '2023-10-27 19:50:32', '2023-10-27 21:50:32', 7, 1, 2),
		(2, 8.0, '2023-10-27 22:15:47', '2023-10-27 23:15:47', 5, 10, 2);
    

	
	INSERT INTO jogo_jogado (fk_JOGO_id, fk_COMANDA_id) 
	VALUES  (9, 4),
		(7, 5),
		(10, 5),
		(2, 3),
		(2, 1),
		(3, 2),
		(6, 3),
		(1, 6),
		(7, 1),
		(4, 2),
		(5, 3),
		(7, 1),
		(3, 2),
		(10, 6),
		(8, 7),
		(9, 8),
		(1, 4),
		(4, 5),
		(5, 6),
		(6, 7),
		(3, 8),
		(2, 9),
		(10, 10),
		(7, 11),
		(1, 12),
		(9, 13),
		(4, 14),
		(5, 15),
		(6, 16),
		(3, 17),
		(2, 18),
		(10, 19),
		(7, 20),
		(1, 21),
		(8, 22),
		(9, 23),
		(1, 24),
		(4, 25),
		(5, 26),
		(6, 27),
		(3, 1),
		(2, 2),
		(10, 3),
		(7, 4),
		(1, 5),
		(9, 6),
		(4, 7),
		(5, 8),
		(6, 9),
		(3, 10),
		(2, 11),
		(10, 12),
		(7, 13),
		(1, 14),
		(9, 15),
		(4, 16),
		(5, 17),
		(6, 18),
		(3, 19),
		(2, 20);

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    
Todas as consultas (9.1 a 9.10) estão presentes no colab, disponível pelo url a seguir:

[Luderia - Google Colaboratory](https://colab.research.google.com/drive/1VzZKK79uiF8zsrykRxGWxu_4Gr6L57TB?usp=sharing)

	9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS
	9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE
	9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS
	9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS
	9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS
	9.6	CONSULTAS COM INNER JOIN E ORDER BY
	9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO
	9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN
	9.9	CONSULTAS COM SELF JOIN E VIEW
	9.10	SUBCONSULTAS

### 10 RELATÓRIOS E GRÁFICOS

Todos os relatórios com seus respectivos gráficos estão disponíveis no link a seguir:

[Relatórios - Google Colaboratory](https://colab.research.google.com/drive/1eNFRiWXf1ggMT6o-r2QcJnJvVFWmh6qC?usp=sharing)

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

Link de acesso aos slides: [Slides Pecha Kucha Luderia](https://docs.google.com/presentation/d/11dno_jRLEVtu5WiSvhsk4EX1Icg-ACdjO2u0OETqN4I/edit?usp=sharing)

Link de acesso ao vídeo: [Vídeo Pecha Kucha Luderia]()

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
