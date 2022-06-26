-- CHECKPOINT 3

CREATE DATABASE SistemaFerroviario;

USE SistemaFerroviario;

CREATE TABLE trem(
	num_trem INT NOT NULL AUTO_INCREMENT,
    qtd_vagoes TINYINT,
    PRIMARY KEY(num_trem)
);

CREATE TABLE trem_classe(
	num_trem INT NOT NULL AUTO_INCREMENT,
    classe VARCHAR(45),
    capacidade_maxima TINYINT,
    PRIMARY KEY(num_trem),
    CONSTRAINT FK_trem_classe_trem FOREIGN KEY(num_trem) REFERENCES trem(num_trem)
);

CREATE TABLE estacao(
	estacao_id INT NOT NULL AUTO_INCREMENT,
    estacao_nome VARCHAR(45),
    PRIMARY KEY(estacao_id)
);

CREATE TABLE estacao_trem(
	estacao_id INT NOT NULL AUTO_INCREMENT,
    num_trem INT,
    nome_origem VARCHAR(45),
    nome_destino VARCHAR(45),
    PRIMARY KEY(estacao_id),
    CONSTRAINT FK_estacao_trem_trem FOREIGN KEY(num_trem) REFERENCES trem(num_trem),
    CONSTRAINT FK_estacao_trem_estacao FOREIGN KEY(estacao_id) REFERENCES estacao(estacao_id)
);
CREATE TABLE passageiro(
	passageiro_id INT NOT NULL AUTO_INCREMENT,
    passageiro_nome VARCHAR(45),
    passageiro_sobrenome VARCHAR(45),
    idade TINYINT,
    PRIMARY KEY(passageiro_id)
);

CREATE TABLE ticket_vendido(
	ticket_id INT NOT NULL AUTO_INCREMENT,
    preco DECIMAL(3,2),
    num_trem INT,
    data_viagem date,
    passageiro_id INT,
    PRIMARY KEY(ticket_id),
    CONSTRAINT FK_ticket_vendido_trem FOREIGN KEY(num_trem) REFERENCES trem(num_trem),
    CONSTRAINT FK_ticket_vendido_passageiro FOREIGN KEY(ticket_id) REFERENCES passageiro(passageiro_id)
);

CREATE TABLE ticket_cancelado(
	cancelamento_id INT NOT NULL AUTO_INCREMENT,
    ticket_id INT,
    passageiro_id INT,
    PRIMARY KEY(cancelamento_id),
    CONSTRAINT FK_ticket_cancelado_ticket_vendido FOREIGN KEY(ticket_id) REFERENCES ticket_vendido(ticket_id),
    CONSTRAINT FK_ticket_cancelado_passageiro FOREIGN KEY(passageiro_id) REFERENCES passageiro(passageiro_id)
);












