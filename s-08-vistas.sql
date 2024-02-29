--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de vistas.

prompt Conectando como PD_PROY_ADMIN para crear vistas.
connect PD_PROY_ADMIN/dupe;

-- Escenario 1. Datos de autos particulares por entidad.

create or replace view auto_entidad as(
  select a.num_serie, a.marca_id, a.modelo, a.status_auto_id,
    p.num_bolsas_aire, p.frenos_abs, p.tipo_transmision, l.num_placa, 
    l.entidad_id 
  from auto a, particular p, placa l 
  where a.auto_id = p.auto_id 
  and a.auto_id = l.auto_id 
);

prompt Obteniendo datos de autos por entidad.
select * from auto_entidad
where entidad_id = 'CDM' ;


-- Escenario 2. Reporte de emisiones por auto del verificentro.

create or replace view rep_verificentro_auto as (
  select a.num_serie, v.fecha, rv.emision_id, rv.valor, v.verificacion_id, v.clave_verificentro
  from auto a, verificacion v, reporte_verificentro rv
  where a.auto_id = v.auto_id
  and v.verificacion_id = rv.verificacion_id 
);

prompt Obteniendo datos de emisiones por auto del verificentro
select * from rep_verificentro_auto
where num_serie = 'AAAAA';


-- Escenario 3. Datos de propietarios que muestran su
-- numero de puntos negativos.

create or replace view propietario_puntos as (
  select p.nombre, p.ap_paterno, p.email, 
    l.num_licencia, l.tipo_auto, q1.total_p_negativos
  from propietario p, licencia l, (
    select sum(puntos_negativos) as total_p_negativos,
    propietario_id
    from falta 
    group by propietario_id
  ) q1   
  where p.propietario_id = l.propietario_id
  and q1.propietario_id = p.propietario_id
);

--Otorgando permisos al usuario invitado para que pueda ver la vista
grant select on PD_PROY_ADMIN.propietario_puntos to PD_PROY_INVITADO;
--Haciendo sinonimo público para la vista
create or replace public synonym propietario_puntos for PD_PROY_ADMIN.propietario_puntos;

prompt Connectando como PD_PROY_INVITADO
connect PD_PROY_INVITADO/dupe;

--Obteniendo datos de puntos negativos por propietario
select * from propietario_puntos
where nombre = 'PEDRO';
