USE estadisticas_basquet;

drop table if  exists log_auditoria;
CREATE TABLE IF NOT EXISTS log_auditoria
					(
					 id_log INT AUTO_INCREMENT ,
					 accion VARCHAR(10),
					 nombre_tabla VARCHAR(40),
					 usuario VARCHAR(100),
					 fecha DATE,
                     hora varchar(8),
					 PRIMARY KEY (id_log)
					  );
                      
drop table if  exists log_auditoria2;
CREATE TABLE IF NOT EXISTS log_auditoria2
					(
					 id_log INT AUTO_INCREMENT ,
					 accion VARCHAR(10),
					 nombre_tabla VARCHAR(40),
                     nuevo_id_partido INT,
					 usuario VARCHAR(100),
					 fecha DATE,
                     hora varchar(8),
					 PRIMARY KEY (id_log)
					  );

drop table if  exists log_auditoria3;
CREATE TABLE IF NOT EXISTS log_auditoria3
					(
					 id_log INT AUTO_INCREMENT ,
					 id_partido INT,
                     id_jugadora INT,
                     pts_ant INT,
                     pts_act INT,
                     usuario VARCHAR(100),
					 fecha DATE,
                     hora varchar(8),
					 PRIMARY KEY (id_log)
					  );
					
drop table if  exists log_auditoria4;
CREATE TABLE IF NOT EXISTS log_auditoria4
					(
					 id_log INT AUTO_INCREMENT ,
					 id_numero INT,
                     id_equipo INT,
                     nombre VARCHAR (45),
                     pos VARCHAR(15),
                     edad INT,
                     alt DECIMAL (3,2),
                     usuario VARCHAR(100),
					 fecha DATE,
                     hora varchar(8),
					 PRIMARY KEY (id_log)
					  );
-- Trigger 1: actualiza la tabla log_auditoria cada vez que alguien inserta
-- datos en la tabla estadisticas_individuales
drop trigger trg_log_estadisticas;
delimiter //
CREATE TRIGGER trg_log_estadisticas AFTER INSERT ON estadisticas_basquet.estadisticas_individuales
FOR EACH ROW 
BEGIN
	INSERT INTO log_auditoria (accion, nombre_tabla, usuario, fecha, hora)
	VALUES ('INSERT', 'ESTADISTICAS_INDIVIDUALES', current_user(), current_date(), current_time());
END//
delimiter ;

-- insert into estadisticas_individuales values (98, 15, 7, 13, 8, 2, 1, 1, '40.00');
select * from log_auditoria;

-- Trigger 2: actualiza la tabla log_auditoria2 con los datos que se cargan
-- en la tabla partidos
drop trigger trg_log_partidos;
delimiter //
CREATE TRIGGER trg_log_partidos AFTER INSERT ON estadisticas_basquet.partidos
FOR EACH ROW 
BEGIN
	INSERT INTO log_auditoria2 (accion , nombre_tabla, nuevo_id_partido, usuario, fecha, hora)
	VALUES ('INSERT', 'PARTIDOS', new.id, current_user(), current_date(), current_time());
END//
delimiter ;
select * from log_auditoria;
-- insert into partidos values (16, '2022-08-30', 'Amistoso', 1, 4, '20-19', True, 'Fecha 3');

-- Trigger 3: en la tabla log_auditoria3 carga datos cuando se actualian los puntos
-- de una jugadora en la tabla estadisticas_individuales.
drop trigger trg_log_estadisticas2;
delimiter //
CREATE TRIGGER trg_log_estadisticas2 BEFORE UPDATE ON estadisticas_basquet.estadisticas_individuales
FOR EACH ROW 
BEGIN
	INSERT INTO log_auditoria3 (id_partido, id_jugadora, pts_ant, pts_act, usuario, fecha, hora)
	VALUES (old.id_partido, old.id, old.pts, new.pts, current_user(), current_date(), current_time());
END//
delimiter ;

select * from log_auditoria3;
-- update estadisticas_individuales set pts= 20 where id=98;

-- Trigger 4: guarda en la tabla log_auditoria4 los datos cuando se elimina una
-- jugadora de la tabla jugadoras
drop trigger trg_log_jugadoras;
delimiter //
CREATE TRIGGER trg_log_jugadoras BEFORE DELETE ON estadisticas_basquet.jugadoras
FOR EACH ROW 
BEGIN
	INSERT INTO log_auditoria4 (id_numero, id_equipo, nombre, pos, edad, alt, usuario, fecha, hora)
	VALUES (old.id_numero, old.id_equipo, old.nombre, old.pos, old.edad, old.alt, current_user(), current_date(), current_time());
END//
delimiter ;

-- insert into jugadoras values (77, 1, 'Jimena Perez', 'base', 25, 1.76);
-- delete from jugadoras where id_numero = 77;
select * from log_auditoria4;
