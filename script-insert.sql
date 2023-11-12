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
        ('Julia', '789.123.456-66', 'F', '1972-10-20');

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

insert into estado_conservacao (estado) 
values  ('bom'),
		('ok'),
		('ruim'),
		('péssimo');
 
INSERT INTO jogo (nome, codigo, tempo_manutencao, fk_ESTADO_CONSERVACAO)
VALUES 
  ('uno', '1729', '02:00:00', 1),
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
  ('scrabble', '7777', '06:30:00', 2);

insert into modo_cobranca (modo) 
values 	 ('T'),
		 ('J');
		 
insert into expansao (fk_JOGO_id, fk_EXPANSAO_id)
values (1, 2),
	   (1, 3),
	   (4, 5),
	   (4, 6),
	   (7, 8),
	   (7, 9),
	   (7, 10);
	
insert into comanda (qtd_pessoas, multas, horario_inicio, FK_CLIENTE_id, FK_MESA_Id, FK_MODO_COBRANCA_id)	
values  (4, 0.0, '2023-10-20 10:25:32', 1, 1, 1),
		(2, 10.0, '2023-10-20 15:12:39', 3, 2, 2),
		(5, 0.0, '2023-10-20 16:01:42', 7, 5, 2),
		(1, 0.0, '2023-10-20 23:00:00', 9, 4, 1),
		(8, 15.0, '2023-10-21 13:24:33', 10, 7, 2),
		(3, 0.0, '2023-10-21 13:51:57', 2, 6, 1),
		(4, 0.0, '2023-10-21 14:10:21', 5, 1, 1);

INSERT INTO jogo_jogado (fk_JOGO_id, fk_COMANDA_id) 
VALUES    (9, 4),
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
		  (5, 7),
		  (9, 7);