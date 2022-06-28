DELIMITER $$
CREATE PROCEDURE sp_qtdTicketsPassageiro (
    IN p_idPassageiro INT
)
    SELECT passageiro.passageiro_nome, COUNT(ticket_id) as `Quantidade de Passagem por Passageiro` 
    FROM ticket_vendido INNER JOIN passageiro ON ticket_vendido.passageiro_id = passageiro.passageiro_id 
    WHERE passageiro.passageiro_id = p_idPassageiro GROUP BY passageiro.passageiro_nome; 

DELIMITER ;

CALL sp_qtdTicketsPassageiro(5);


/* view retorna passageiros com idade igual ou maior que 18 anos */
CREATE VIEW dadosCliente 
AS
SELECT passageiro_nome, passageiro_sobrenome FROM passageiro WHERE idade >= 18;

SELECT * FROM `dadosCliente`;