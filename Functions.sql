CREATE OR REPLACE FUNCTION soma(arg1 INTEGER, arg2 INTEGER)
RETURNS INTEGER
SECURITY DEFINER
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT COALESCE(arg1, 0) + COALESCE(arg2, 0); --COALESCE: Se algum arg inserido for null, substitui ele por 0
$$;

SELECT soma(3, 5);
SELECT soma(3, null);
-----------------------------------
CREATE OR REPLACE FUNCTION bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
	DECLARE variavel_id INTEGER;
	BEGIN
		IF p_numero IS NULL OR p_nome IS NULL OR p_ativo IS NULL THEN
			RETURN 0;
		END IF;
		
		SELECT INTO variavel_id numero
		FROM banco
		WHERE numero = p_numero;
		
		IF variavel_id IS NULL THEN
			INSERT INTO banco(numero, nome, ativo)
			VALUES(p_numero, p_nome, p_ativo);
		ELSE
			RETURN variavel_id;
		END IF;
		
		SELECT INTO variavel_id numero
		FROM banco
		WHERE numero = p_numero;
		
		RETURN variavel_id;
	END;
$$;

SELECT bancos_add(2486, 'Banco Blablabla', true);
SELECT bancos_add(2487, 'Banco 1234', true);
SELECT bancos_add(247, 'Banco Uai', true);
SELECT numero, nome, ativo FROM banco;