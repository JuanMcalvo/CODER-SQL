insert into TIPO_DE_AFILIADO (descripcion) values ('Voluntario');
insert into TIPO_DE_AFILIADO (descripcion) values ('Obligatorio');
insert into TIPO_DE_AFILIADO (descripcion) values ('Transito');
insert into TIPO_DE_AFILIADO (descripcion) values ('Reciprocidad');
select * from  tipo_de_afiliado;
-- crear tabla para alojar los datos del csv y posteriormente derivarlo a sus tablas
CREATE TABLE temp_data (
    PROVINCIA_DESCRIPCION VARCHAR(50),
    LOCALIDAD_DESCRIPCION VARCHAR(100)
);

INSERT IGNORE INTO PROVINCIA (DESCRIPCION)
SELECT DISTINCT PROVINCIA_DESCRIPCION FROM temp_data;

-- insertamos las localidades tomadas de la tabla creada e insertamos
INSERT INTO LOCALIDADES (DESCRIPCION, PROVINCIA_ID)
SELECT td.LOCALIDAD_DESCRIPCION, p.PROVINCIA_ID
FROM temp_data td
JOIN PROVINCIA p ON td.PROVINCIA_DESCRIPCION = p.DESCRIPCION;

select * from localidades where descripcion = "viedma";
select * from localidades where descripcion = "Chimpay";
select * from localidades where descripcion = "San Carlos de Bariloche";

-- Creacion de delegaciones
INSERT INTO DELEGACION (DESCRIPCION, LOCALIDAD_ID)
VALUES
  ('Delegacion Viedma', 19338),
  ('Delegacion Chimpay', 19341),
  ('Delegacion Bariloche', 19355);
  
  Select * from delegacion;
  
  -- Nombre de usuarios
  INSERT INTO USUARIO (DESCRIPCION, DELEGACION_ID)
VALUES
  ('lrodiguez', 1),
  ('jcalvo', 2),
  ('fgarcia', 3);
-- creacion de un cierre
INSERT INTO CIERRE (DELEGACION_ID, USUARIO_ID, TOTAL)
VALUES  
(2, 1, 0),
(1, 3, 0),
(3, 3, 0),
(1, 2, 0),
(2, 3, 0),
(3, 2, 0),
(2, 2, 0),
(3, 1, 0),
(2, 2, 0),
(1, 1, 0);

  
  -- metodos de pago
  INSERT INTO METODOS_DE_PAGO (DESCRIPCION)
VALUES
  ('Compromiso de pago'),
  ('Debito'),
  ('Transferencia Bancaria');
  select * from metodos_de_pago;
  -- agrupador de practicas
INSERT INTO AGRUPADOR (DESCRIPCION)
VALUES
  ('Grupo A');
  -- Nomenclador
INSERT INTO NOMENCLADOR (DESCRIPCION, CODIGO, COSEGURO, AGRUPADOR_ID)
VALUES
  ('Consulta en Consultorio', 420101, 200, 1),
  ('Consulta oftalmologica', 460101, 300,1),
  ('Ecodopler', 770055, 300, 1 );
  -- Corroborar id del nomenclador
  select * from nomenclador;
  
-- INSERSION DE PLANES
  INSERT INTO PLANES (DESCRIPCION)
VALUES
  ('Plan A'),
  ('Plan B'),
  ('Plan C');
  -- QUE PRACTICA PERTENECE A QUE PLAN
 INSERT INTO PLANES_PRACTICAS (PLANES_ID, NOMENCLADOR_ID,PORCENTAJE)
VALUES
  (1, 1, 30),
  (2,2, 20),
  (3,3, 100);
select * from AFILIADOS;
 USE COSEGUROS;
  -- Afiliados
INSERT INTO AFILIADOS (NOMBRE, APELLIDO, TIPO_DOCUMENTO, DOCUMENTO, SEXO_BIOLOGICO, FECHA_DE_NACIMIENTO, LOCALIDAD_ID, TIPO_DE_AFILIADO_ID)
VALUES
  ('Juan', 'Pérez', 'DNI', 12345678, 'Masculino', '1990-01-15',19338, 3),
  ('María', 'Gómez', 'LC', 12345678, 'Femenino', '1985-07-20',19355, 2),
  ('Luis', 'Martínez', 'Pasaporte', 54321987, 'Masculino', '1978-03-05',19341, 1);
  
  
INSERT INTO `coseguros`.`bono`
(`AFILIADO_ID`,`METODOS_DE_PAGO_ID`,`total`,`CIERRE_ID`,`USER_ID`)
VALUES
(1,1,null,NULL,1);
SELECT * FROM BONO;
INSERT INTO `coseguros`.`bono_item`
(`BONO_ID`,`NOMENCLADOR_ID`,`CANTIDAD`)
VALUES
(1,2,1),
 (1,1,2);


