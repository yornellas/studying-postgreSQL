WITH tbl_temp_banco AS (
	SELECT NUMERO, NOME
	FROM banco
)

SELECT numero, nome --referenciam ao statement
FROM tbl_temp_banco;

WITH params AS (
	SELECT 779 AS numero_banco),
	tbl_temp_banco AS (
	SELECT NUMERO, NOME
	FROM banco
	JOIN params
		ON params.numero_banco= banco.numero
)

SELECT numero, nome
FROM tbl_temp_banco;
	
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
			tipo_transacao.nome AS transacao_nome,
			cliente_transacoes.valor AS transacao_valor
	FROM cliente_transacoes
	JOIN cliente 
		ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao
		ON 	tipo_transacao.id = cliente_transacoes.transacao_id
)

SELECT cliente_nome, transacao_nome, transacao_valor
FROM clientes_e_transacoes;

WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
			tipo_transacao.nome AS transacao_nome,
			cliente_transacoes.valor AS transacao_valor
	FROM cliente_transacoes
	JOIN cliente 
		ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao
		ON 	tipo_transacao.id = cliente_transacoes.transacao_id
	JOIN banco
		ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Santander%'
)

SELECT cliente_nome, transacao_nome, transacao_valor
FROM clientes_e_transacoes;
	