use estadisticas_basquet;

-- FUNCIÓN 1: Mostrar altura de una determinada jugadora:

delimiter //
 create function if not exists altura (num_jugadora int) returns decimal (4,2)
 deterministic
 begin
	declare alt_jugadora decimal(3,2);
	select alt into alt_jugadora
  from jugadoras where id_numero = num_jugadora;
	return alt_jugadora;
 end //

select altura(7) as Altura_Jugadora;

-- FUNCIÓN 2: En base a un id de partido, devolver el resultado:

delimiter //
 create function if not exists res_partido (id_partido int) returns varchar (7)
 deterministic
 begin
	declare resultado_partido varchar(7);
	select resultado into resultado_partido
  from partidos where id = id_partido;
	return resultado_partido;
 end //

select res_partido(5) as Resultado;
