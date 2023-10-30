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
