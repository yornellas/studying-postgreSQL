SELECT numero, nome, ativo FROM banco ORDER BY numero;

UPDATE banco SET ativo = false WHERE numero = 33;

BEGIN;
UPDATE banco SET ativo = false WHERE numero = 208;
SELECT numero, nome, ativo FROM banco WHERE numero = 208;
ROLLBACK;

BEGIN;
UPDATE banco SET ativo = false WHERE numero = 208;
COMMIT;

BEGIN;
UPDATE banco SET ativo = false WHERE numero = 339;
SAVEPOINT sp_active;
UPDATE banco SET ativo = true WHERE numero = 339;
ROLLBACK TO sp_active;
UPDATE banco SET ativo = false WHERE numero = 341;
COMMIT;

