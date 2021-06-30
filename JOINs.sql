--INNER JOIN
SELECT banco.numero, agencia.nome
FROM banco
JOIN agencia
	ON agencia.numero_banco = banco.numero;
	
--LEFT JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia
	ON agencia.numero_banco = banco.numero;
	
--FULL JOIN
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia
	ON agencia.numero_banco = banco.numero;
	
--JOIN ENTRE MAIS DE DUAS TABELAS
SELECT  banco.nome,
		agencia.nome,
		conta_corrente.numero,
		conta_corrente.digito,
		cliente.nome,
		tipo_transacao.nome,
		cliente_transacoes.id,
		cliente_transacoes.valor
FROM banco
JOIN agencia
	ON agencia.numero_banco = banco.numero
JOIN conta_corrente
	--ON conta_corrente.banco_numero = agencia.numero_banco
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero
JOIN cliente_transacoes
	ON 	cliente_transacoes.cliente_numero = conta_corrente.cliente_numero
JOIN tipo_transacao
	ON tipo_transacao.id = cliente_transacoes.transacao_id;