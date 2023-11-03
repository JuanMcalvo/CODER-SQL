-- CREACION DE FUNCION, PARA CALCULAR EL TOTAL DEL PRECIO DE UN BONO.
DELIMITER //
CREATE FUNCTION CalcularTotalBono(bonoId INT)
RETURNS float
NOT DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE total FLOAT;
  SELECT SUM(N.CANTIDAD * M.COSEGURO) INTO total
  FROM BONO_ITEM N
  INNER JOIN NOMENCLADOR M ON N.NOMENCLADOR_ID = M.NOMENCLADOR_ID
  WHERE N.BONO_ID = bonoId;
  RETURN total;
END;
//
DELIMITER ;
SELECT CalcularTotalBono(1);

-- CANTIDAD DE BONOS POR AFILIADOS.
DELIMITER //
CREATE FUNCTION ContarBonosPorAfiliado(afiliadoId INT) 
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE cantidad INT;
  SELECT COUNT(*) INTO cantidad
  FROM BONO
  WHERE AFILIADO_ID = afiliadoId;
  RETURN cantidad;
END;
//
DELIMITER ;
SELECT ContarBonosPorAfiliado(1);