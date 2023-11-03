-- REGISTRO DE AFILIADO NO EXISTENTE.
DELIMITER $$
CREATE PROCEDURE CrearAfiliado(
    IN p_tipo_documento VARCHAR(15),
    IN p_documento INT,
    IN p_nombre_afiliado VARCHAR(50),
    IN p_apellido_afiliado VARCHAR(50),
    IN p_sexo_biologico VARCHAR(10),
    IN p_fecha_nacimiento VARCHAR(50),
    IN p_localidad_id INT,
    IN p_tipo_afiliado_id INT
)
BEGIN
    DECLARE afiliado_id INT;

    -- Verificar si el afiliado ya existe en la base de datos
    SELECT AFILIADOS_ID INTO afiliado_id
    FROM AFILIADOS
    WHERE TIPO_DOCUMENTO = p_tipo_documento
    AND DOCUMENTO = p_documento
    LIMIT 1;

    IF afiliado_id IS NOT NULL THEN
        -- Afiliado existente, generar informe
        SELECT CONCAT('Afiliado con Tipo de Documento "', p_tipo_documento, '" y Número de Documento ', p_documento, ' ya existe, no se ha agregado') AS 'Informe';
    ELSE
        -- Afiliado no existe, agregar a la base de datos
        INSERT INTO AFILIADOS (NOMBRE, APELLIDO, TIPO_DOCUMENTO, DOCUMENTO, SEXO_BIOLOGICO, FECHA_DE_NACIMIENTO, LOCALIDAD_ID, TIPO_DE_AFILIADO_ID)
        VALUES (p_nombre_afiliado, p_apellido_afiliado, p_tipo_documento, p_documento, p_sexo_biologico, p_fecha_nacimiento, p_localidad_id, p_tipo_afiliado_id);
        SELECT 'Nuevo afiliado agregado' AS 'Informe';
    END IF;
END $$

DELIMITER ;

-- USO DE PROCEDURE
CALL CrearAfiliado('DNI', 1222333, 'Juan', 'Pérez', 'Masculino', '1990-01-15', '16392',1);
  

-- PROCEDURE DE CONSULTA DE PLANES DE UN AFILIADO, SE PASA POR PARAMETRO EL ID.
DELIMITER $$
CREATE PROCEDURE ConsultarPlanesDeAfiliado2(
    IN afiliado_id INT
)
BEGIN
    -- Consultar todos los planes que posee el afiliado
    SELECT P.PLANES_ID, P.DESCRIPCION
    FROM PLANES AS P
    INNER JOIN AFILIADOS_PLANES AS AP ON P.PLANES_ID = AP.PLAN_ID
    WHERE AP.AFILIADO_ID = afiliado_id;
END $$

DELIMITER ;

-- USO DE PROCEDURE
CALL ConsultarPlanesDeAfiliado2(3); 



