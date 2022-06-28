# Banco de Dados 1

Nesse modelo de banco de dados, simulamos a criação de um sistema ferroviário.

## Entidades
Trem;
Passageiro;
Ticket_Vendido;
Ticket_Cancelado;
Classe do Trem;
Estação

## Relacionamentos
Trem - Estação (1.N);
Passageiro - Ticket (1.N);
Trem - Trem Classe (1.N);
Ticket vendido - Ticket cancelado (1.1);


## Procedure
Retorna quantas passagens um passageiro comprou, passando o ID do passageiro como parâmetro

## View
Retorna quais passageiros são menores de 18 anos


## Alter Table
Aleramos a tabela Ticket_Cancelado adicionando o campo 'motivo_do_cancelamento'

## CRUD
Atualizamos o campo 'motivo_do_cancelamento', inserindo dados nesse campo
Retornamos os motivos de cancelamento onde o dado foi preenchido e onde não foi (null)
Deletamos os dados onde não foi preenchido motivo de cancelamento
