DELIMITER $$
CREATE PROCEDURE sp_qtdTicketsPassageiro (
    IN p_idPassageiro INT
)
    SELECT COUNT(ticket_id) as `Quantidade de Passagem por Passageiro` 
    FROM ticket_vendido INNER JOIN passageiro ON ticket_vendido.passageiro_id = passageiro.passageiro_id 
    WHERE passageiro.passageiro_id = p_idPassageiro; 

DELIMITER ;

CALL sp_qtdTicketsPassageiro(9);



CREATE VIEW dadosCliente 
AS
SELECT passageiro_nome, passageiro_sobrenome FROM passageiro WHERE idade >= 18;

SELECT * FROM `dadosCliente`;