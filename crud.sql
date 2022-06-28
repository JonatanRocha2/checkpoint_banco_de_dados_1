/* atualize a tabela ticket_cancelado inserindo o campo motivo de cancelamento */
UPDATE ticket_cancelado SET motivo_cancelamento = 'Término de namoro do passageiro' WHERE ticket_id = 7;
UPDATE ticket_cancelado SET motivo_cancelamento = 'Posse ilegal de armas' WHERE ticket_id = 9;
UPDATE ticket_cancelado SET motivo_cancelamento = 'Compra por engano menor de idade' WHERE ticket_id = 5;
UPDATE ticket_cancelado SET motivo_cancelamento = 'Hackearam o sistema' WHERE ticket_id = 14;


/* Retorne motivo do cancelamento e seu respectivo id */
SELECT motivo_cancelamento, ticket_id FROM ticket_cancelado WHERE motivo_cancelamento IS NOT NULL;
SELECT motivo_cancelamento, ticket_id FROM ticket_cancelado WHERE motivo_cancelamento IS NULL;

/* deletar todos os tickets cancelados que nao tiverem motivos de cancelamento descritos */
DELETE FROM ticket_cancelado WHERE motivo_cancelamento IS NULL;