-- creaciones de tablas log
CREATE TABLE Afiliados_Log (
    Log_ID INT PRIMARY KEY AUTO_INCREMENT,
    Afiliado_ID INT,
    Descripcion VARCHAR(255),
    Accion VARCHAR(20),
    Usuario VARCHAR(50),
    Fecha TIMESTAMP
);

CREATE TABLE Coseguros_Log (
    Log_ID INT PRIMARY KEY AUTO_INCREMENT,
    Coseguro_ID INT,
    Descripcion VARCHAR(255),
    Accion VARCHAR(20),
    Usuario VARCHAR(50),
    Fecha TIMESTAMP
);
-- TABLA DE AFILIADOS LOG
DELIMITER //
CREATE TRIGGER afiliados_modificacion
AFTER UPDATE ON Afiliados
FOR EACH ROW
BEGIN
    INSERT INTO Afiliados_Log (Afiliado_ID, Descripcion, Accion, Usuario, Fecha)
    VALUES (OLD.Afiliados_ID, 'Modificación', 'Actualizacion', USER(), NOW());
END;
//
DELIMITER ;
select * from afiliados_log;
UPDATE Afiliados SET apellido = 'martinez' WHERE afiliados_id = 1;
DELIMITER //
CREATE TRIGGER afiliados_insercion
AFTER INSERT ON Afiliados
FOR EACH ROW
BEGIN
    INSERT INTO Afiliados_Log (Afiliado_ID, Descripcion, Accion, Usuario, Fecha)
    VALUES (NEW.Afiliados_ID, 'Inserción', 'Inserción', USER(), NOW());
END;
//
DELIMITER ;


-- TABLA DE COSEGUROS

DELIMITER //
CREATE TRIGGER coseguros_modificacion
BEFORE UPDATE ON Bono
FOR EACH ROW
BEGIN
    INSERT INTO Coseguros_Log (Coseguro_ID, Descripcion, Accion, Usuario, Fecha)
    VALUES (OLD.bono_ID, 'Modificación', 'Modificación', USER(), NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER coseguros_eliminacion
BEFORE DELETE ON bono
FOR EACH ROW
BEGIN
    INSERT INTO Coseguros_Log (Coseguro_ID, Descripcion, Accion, Usuario, Fecha)
    VALUES (OLD.bono_id, 'Eliminación', 'Eliminación', USER(), NOW());
END;
//
DELIMITER ;