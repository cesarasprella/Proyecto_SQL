USE estadisticas_basquet;

-- Creación del usuario 1 y su contraseña:
CREATE USER IF NOT EXISTS 'user1'@'localhost' IDENTIFIED BY 'clave1';

-- Creación del usuario 2 y su contraseña:
CREATE USER IF NOT EXISTS 'user2'@'localhost' IDENTIFIED BY 'clave2';

-- Otorgo solamente permiso de lectura al usuario 1:
GRANT SELECT ON estadisticas_basquet.* TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';

-- Otorgo permisos de lectura, inserción y modificación al usuario 2:
GRANT SELECT, INSERT, UPDATE ON estadisticas_basquet.* TO 'user2'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';

FLUSH PRIVILEGES;

