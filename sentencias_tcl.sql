USE estadisticas_basquet;

SET @@autocommit = 0;

-- 1: Eliminación de registros de la tabla estadisticas_individuales donde id = 89
-- (juadora que no jugó ni un segundo).
START TRANSACTION;
  DELETE FROM estadisticas_individuales WHERE id = 89;
COMMIT;

-- 2: Inserción de 8 equipos con un savepoint luego del cuarto ingreso:
START TRANSACTION;
  INSERT INTO equipos VALUES (13, 'Estudiantes', '1 y 57', 'La Plata');
  INSERT INTO equipos VALUES (14, 'Banco Provincia', '476 e 20 y 21', 'City Bell');
  INSERT INTO equipos VALUES (15, 'Atenas', '13 e 57 y 58', 'La Plata');
  INSERT INTO equipos VALUES (16, 'Fomento Los Hornos', '137 y 61', 'Los Hornos');
  SAVEPOINT sp1;
  INSERT INTO equipos VALUES (17, 'Unión Vecinal', '9 e 69 y 70', 'La Plata');
  INSERT INTO equipos VALUES (18, 'Universal', '25 y 57', 'La Plata');
  INSERT INTO equipos VALUES (19, 'UNLP', '115 y 47', 'La Plata');
  INSERT INTO equipos VALUES (20, 'Platense', '21 e 51 y 53', 'La Plata');
  ROLLBACK TO sp1;
COMMIT;
