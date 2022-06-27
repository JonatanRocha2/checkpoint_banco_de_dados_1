CREATE DATABASE SistemaFerroviarioDB;

USE SistemaFerroviarioDB;

CREATE TABLE trem(
	num_trem INT NOT NULL AUTO_INCREMENT,
    qtd_vagoes TINYINT(100),
    PRIMARY KEY (num_trem)
);

CREATE TABLE trem_classe(
	num_trem INT NOT NULL AUTO_INCREMENT,
    classe VARCHAR(45),
    capacidade_maxima TINYINT NOT NULL,
    PRIMARY KEY(num_trem),
    CONSTRAINT FK_trem_classe_trem FOREIGN KEY (num_trem) REFERENCES trem(num_trem)
);

CREATE TABLE estacao(
	estacao_id INT NOT NULL AUTO_INCREMENT,
    estacao_nome VARCHAR(45) NOT NULL,
    num_trem INT NOT NULL,
    PRIMARY KEY (estacao_id),
    CONSTRAINT FK_estacao_trem FOREIGN KEY (num_trem) REFERENCES trem (num_trem)
);

CREATE TABLE passageiro(
	passageiro_id INT NOT NULL AUTO_INCREMENT,
    passageiro_nome VARCHAR(45) NOT NULL,
    passageiro_sobrenome VARCHAR(45) NOT NULL,
    idade TINYINT(3),
    PRIMARY KEY(passageiro_id)
);

CREATE TABLE ticket_vendido(
	ticket_id INT NOT NULL AUTO_INCREMENT,
    preco DECIMAL(10,2),
    num_trem INT NOT NULL,
    data_viagem DATE NOT NULL,
    nome_origem VARCHAR(45),
    nome_destino VARCHAR(45),
    passageiro_id INT NOT NULL,
    PRIMARY KEY(ticket_id),
    CONSTRAINT FK_ticket_vendido_trem FOREIGN KEY(num_trem) REFERENCES trem(num_trem),
    CONSTRAINT FK_ticket_vendido_passageiro FOREIGN KEY(passageiro_id) REFERENCES passageiro(passageiro_id)
);

CREATE TABLE ticket_cancelado(
	cancelamento_id INT NOT NULL AUTO_INCREMENT,
    ticket_id INT NOT NULL,
    passageiro_id INT NOT NULL,
    PRIMARY KEY(cancelamento_id),
    CONSTRAINT FK_ticket_cancelado_ticket_vendido FOREIGN KEY(ticket_id) REFERENCES ticket_vendido(ticket_id),
    CONSTRAINT FK_ticket_cancelado_passageiro FOREIGN KEY(passageiro_id) REFERENCES passageiro(passageiro_id)
);

INSERT INTO passageiro (passageiro_nome, passageiro_sobrenome, idade) 
VALUES 
('Monkey D.', 'Luffy', 17),
('Jonatan', 'Rocha', 27),
('Antonio', 'Mesquita', 36),
('Gabriel', 'Holz', 21), 
('Joana', 'Dark', 40),
('Anny', 'Santos', 31),
('Naruto', 'Uzumaki', 33),
('Vitoria', 'Silva', 19 ),
('Carina',  'Duarte', 22),
('Vitor', 'Santos', 31);

INSERT INTO trem (qtd_vagoes)
VALUES
(10),
(20),
(30),
(40),
(50),
(60),
(70),
(80),
(90),
(100);

INSERT INTO trem_classe (classe, capacidade_maxima)
VALUES
('1ª Classe', 10),
('2ª Classe', 50),
('3ª Classe', 100);

INSERT INTO estacao (estacao_nome, num_trem)
VALUES
('Vicentina', 2),
('Moacir Franco', 5),
('Franca', 8),
('Antoniela da II', 7),
('Dom Pedro I', 1),
('Jucelino Kubicheck', 3),
('São José da IX', 9),
('Beira Rio', 8),
('Padre Pelágio', 4),
('José Hermano', 5);

INSERT INTO ticket_vendido (preco, num_trem, data_viagem, nome_origem, nome_destino, passageiro_id)
VALUES 
(10, 1, '2020-01-01', 'Dom Pedro I', 'Beira Rio', 1),
(20, 2, '2022-06-25', 'Padre Pelágio', 'Moacir Franco', 4),
(30, 3, '2021-05-23', 'Franca', 'Franca', 7),
(15, 4, '2022-02-03','Franca', 'Beira Rio', 9),
(12, 5, '2022-02-01','Dom Pedro I', 'São Jose da IX', 2),
(20, 6, '2022-02-05','Moacir Franco', 'Vicentina', 8),
(29, 7, '2022-02-07','Dom Pedro I', 'Franca', 3),
(31, 8, '2022-02-01','Moacir Franco', 'Franca', 5),
(44, 9, '2022-02-09','Vicentina', 'Franca', 6),
(40, 10, '2019-04-12', 'São Jose da IX', 'Beira Rio', 4),
(30, 6, '2021-05-23', 'Franca', 'Franca', 7),
(15, 4, '2022-02-03','Franca', 'Beira Rio', 1),
(12, 9, '2022-06-01','Dom Pedro I', 'São Jose da IX', 3),
(20, 2, '2022-02-05','Moacir Franco', 'Vicentina', 9),
(29, 7, '2022-02-07','Dom Pedro I', 'Franca', 3),
(12, 8, '2022-02-01','Moacir Franco', 'Franca', 6),
(20, 2, '2022-06-25', 'Padre Pelágio', 'Moacir Franco', 4),
(30, 3, '2021-05-23', 'Franca', 'Franca', 7),
(15, 4, '2022-02-03','Franca', 'Beira Rio', 9);

INSERT INTO ticket_cancelado (ticket_id, passageiro_id)
VALUES 
(9, 6),
(4, 9),
(7, 3),
(2, 4),
(5, 2),
(8, 5),
(19, 9),
(16, 6),
(14, 9),
(12, 1);
