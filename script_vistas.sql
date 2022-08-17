USE estadisticas_basquet;

-- VISTA 1: Mayor cantidad de puntos de una jugadora en un partido (límite 5):

create or replace view vista_cinco_maximas_anotadoras as (
  select j.nombre as Jugadora, e.pts as Puntos, e.id_partido, t.nombre_equipo as Rival
  from estadisticas_individuales e
  inner join jugadoras j, partidos p, equipos t 
  where e.id_numero = j.id_numero and e.id_partido = p.id and p.id_equipo2 = t.id_equipo
  order by e.pts desc
  limit 5
  );

select * from vista_cinco_maximas_anotadoras;

-- VISTA 2: Estadísticas promedio por partido de cada jugadora:

create or replace view vista_estadisticas_promedio as (
  select e.id_numero as Num, j.nombre as Jugadora, round(avg(e.pts), 2) as Prom_Puntos,
  round(avg(e.reb), 2) as Prom_Rebotes, round(avg(e.asist), 2) as Prom_Asistencias,
  round(avg(e.perd), 2) as Prom_Perdidas, round(avg(e.rob), 2) as Prom_Robos
  from estadisticas_individuales e
  inner join jugadoras j on e.id_numero = j.id_numero
  group by e.id_numero
  );

select * from vista_estadisticas_promedio;

-- VISTA 3: Equipos cuya cancha se encuentra en la ciudad de La Plata:

create or replace view equipos_la_plata as(
  select nombre_equipo as Equipo, direc as Direccion 
  from equipos
  where ciudad = 'La Plata'
  );

select * from equipos_la_plata;

-- VISTA 4: Nombre de los equipos rivales en los partidos ganados:

create or replace view partidos_ganados as (
  select eq.nombre_equipo as Rival, p.resultado as Resultado,
  p.nombre_torneo as Torneo, p.instancia as Instancia
  from partidos p 
  inner join equipos eq on p.id_equipo2 = eq.id_equipo
  where p.win like '1'
  order by p.id
  );

select * from partidos_ganados;

-- VISTA 5: Jugadoras con al menos 10 puntos y 5 rebotes en un partido:

create or replace view vista_10puntos_5rebotes as (
  select j.id_numero as Num, j.nombre as Jugadora, e.pts as Puntos, e.reb as Rebotes
  from estadisticas_individuales e
  inner join jugadoras j on e.id_numero = j.id_numero
  where e.pts >= 10 and e.reb >= 5
  );

select * from vista_10puntos_5rebotes;
