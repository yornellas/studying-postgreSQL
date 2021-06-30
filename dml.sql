INSERT INTO banco (numero, nome)
VALUES (33, 'Banco Santander (Brasil) S.A.');

INSERT INTO banco (numero, nome)
VALUES (779,'Banco Intermedium S.A.');

INSERT INTO banco (numero, nome)
VALUES (247,'Banco Itaú S.A.');

INSERT INTO banco (numero, nome)
VALUES (208,'Banco BTG Pactual S.A.');

INSERT INTO banco (numero, nome)
VALUES (341,'Itaú Unibanco S.A.');

DELETE FROM banco
WHERE numero = 247;

INSERT INTO agencia (numero_banco, numero, nome)
VALUES (33, 1, 'Agência número 1 do banco Banco Santander (Brasil) S.A.');

INSERT INTO agencia (numero_banco, numero, nome)
VALUES (33, 2, 'Agência número 2 do banco Banco Santander (Brasil) S.A.');

INSERT INTO agencia (numero_banco, numero, nome)
VALUES (779, 1, 'Agência número 1 do banco Intermedium S.A.');

INSERT INTO agencia (numero_banco, numero, nome)
VALUES (208, 1, 'Agência número 1 do banco Banco BTG Pactual S.A.');

INSERT INTO agencia (numero_banco, numero, nome)
VALUES (208, 2, 'Agência número 2 do banco Banco BTG Pactual S.A.');

INSERT INTO agencia (numero_banco, numero, nome)
VALUES (341, 1, 'Agência número 1 do banco Itaú Unibanco S.A.');

INSERT INTO cliente (nome, email) 
VALUES ('Yolanda Ornellas','yolanda@at.com.br');

INSERT INTO cliente (nome, email) 
VALUES ('Marina Araujo','marina@at.com.br');

INSERT INTO cliente (nome, email) 
VALUES ('Nayara Salomao','nayara@at.com.br');

INSERT INTO conta_corrente (banco_numero, agencia_numero, cliente_numero, numero, digito)
VALUES (33, 1, 1, 7786, 9);

INSERT INTO conta_corrente (banco_numero, agencia_numero, cliente_numero, numero, digito)
VALUES (779, 1, 1, 9899, 2);

INSERT INTO conta_corrente (banco_numero, agencia_numero, cliente_numero, numero, digito)
VALUES (33, 2, 3, 5666, 2);

INSERT INTO conta_corrente (banco_numero, agencia_numero, cliente_numero, numero, digito)
VALUES (208, 2, 2, 88765, 0);

INSERT INTO tipo_transacao (nome) 
VALUES ('Débito');

INSERT INTO tipo_transacao (nome) 
VALUES ('Crédito');

INSERT INTO tipo_transacao (nome) 
VALUES ('Transferência');

INSERT INTO cliente_transacoes (banco_numero, agencia_numero, cliente_numero, conta_corrente_numero, conta_corrente_digito, transacao_id, valor)
VALUES (33, 1, 1, 7786, 9, 2, 1000);

INSERT INTO cliente_transacoes (banco_numero, agencia_numero, cliente_numero, conta_corrente_numero, conta_corrente_digito, transacao_id, valor)
VALUES (208, 2, 2, 88765, 0, 3, 5000);

INSERT INTO cliente_transacoes (banco_numero, agencia_numero, cliente_numero, conta_corrente_numero, conta_corrente_digito, transacao_id, valor)
VALUES (33, 2, 3, 5666, 2, 1, 80);
