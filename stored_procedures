use estadisticas_basquet;

-- 1: SP que ordena por un campo y de una manera determinada una tabla:

drop procedure if exists sp_ordenar;
delimiter //
create procedure sp_ordenar (inout param_campo_orden varchar (20),
							               inout param_asc_desc varchar (4),
                             in nombre_tabla varchar (20))
begin
	set @orden = concat('select * from ', nombre_tabla,' order by ', param_campo_orden,' ', param_asc_desc);
	prepare param_ordenar from @orden; 
	execute param_ordenar; 
	deallocate prepare param_ordenar;
end //

set @param_carmpo_orden = 'edad';
set @param_asc_desc = 'desc';
set @nombre_tabla = 'jugadoras';

call sp_ordenar (@param_carmpo_orden, @param_asc_desc, @nombre_tabla);

-- 2: SP que inserta datos en la tabla partidos

drop procedure if exists sp_agregar;
delimiter //
create procedure sp_agregar (inout p_id INT,
							               inout p_dia DATE,
                             inout p_nombre_torneo VARCHAR(45),
							               inout p_id_equipo1 INT,
							               inout p_id_equipo2 INT,
							               inout p_resultado VARCHAR(7),
							               inout p_win BOOLEAN,
							               inout p_instancia VARCHAR(45)
							                )
begin
	insert into partidos values (p_id, p_dia, p_nombre_torneo, p_id_equipo1, p_id_equipo2, p_resultado, p_win, p_instancia);
end //

set @p_id = 15;
set @p_dia = '2022-08-14';
set @p_nombre_torneo = 'Clausura';
set @p_id_equipo1 = 1;
set @p_id_equipo2 = 3;
set @p_resultado = '41-35';
set @p_win = True;
set @p_instancia = 'Fecha 2';

call sp_agregar (@p_id, @p_dia, @p_nombre_torneo, @p_id_equipo1, @p_id_equipo2, @p_resultado, @p_win, @p_instancia);
