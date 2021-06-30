CREATE TABLE IF NOT EXISTS banco (
	numero INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero)
);

CREATE TABLE IF NOT EXISTS agencia (
	numero_banco INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	nome VARCHAR(80) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero_banco, numero),
	FOREIGN KEY (numero_banco) REFERENCES banco (numero)
);

CREATE TABLE IF NOT EXISTS cliente (
	numero BIGSERIAL NOT NULL,
	nome VARCHAR(120) NOT NULL,
	email VARCHAR(250) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero)
);

CREATE TABLE IF NOT EXISTS conta_corrente (
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	cliente_numero BIGINT NOT NULL,
	numero BIGINT NOT NULL,
	digito SMALLINT NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
	PRIMARY KEY (banco_numero, agencia_numero, cliente_numero, numero, digito),
	FOREIGN KEY (banco_numero, agencia_numero) REFERENCES agencia (numero_banco, numero),
	FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
);

CREATE TABLE IF NOT EXISTS tipo_transacao (
	id 	SMALLSERIAL,
	nome VARCHAR(50) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cliente_transacoes (
	id BIGSERIAL NOT NULL,
	--transacao_id SMALLINT NOT NULL,
	banco_numero INTEGER NOT NULL, 
	agencia_numero INTEGER NOT NULL, 
	cliente_numero BIGINT NOT NULL,
	conta_corrente_numero BIGINT NOT NULL, 
	conta_corrente_digito SMALLINT NOT NULL,
	valor NUMERIC(15,2) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
	PRIMARY KEY (id),
	--FOREIGN KEY (transacao_id) REFERENCES tipo_transacao (id),
	FOREIGN KEY (banco_numero, agencia_numero, cliente_numero, conta_corrente_numero, conta_corrente_digito) REFERENCES conta_corrente (banco_numero, agencia_numero, cliente_numero, numero, digito)
);

ALTER TABLE cliente_transacoes
ADD transacao_id SMALLINT NOT NULL,
ADD FOREIGN KEY (transacao_id) REFERENCES tipo_transacao (id);








