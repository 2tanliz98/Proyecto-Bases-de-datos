--@Autor: Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 05/01/2021
--@Descripción: Creación de consultas
    
--connect pd_proy_admin/dupe

set linesize 200 
Prompt |Consultas con álgebra relacional y joins|
Prompt Escenario 1. se desea realizar un reporte que muestre el promedio de emisiones de HC por autos y por cada dispositivo
select re.fecha, d.dispositivo_id, e.emision_id, re.valor, e.unidad,( 
  select avg(valor)   
  from reporte_emisiones  
  where emision_id = 'HC' 
  group by emision_id
  ) as promedio_HC
  from dispositivo d, reporte_emisiones re, cat_emision e 
    where d.dispositivo_id = re.dispositivo_id 
    and e.emision_id = re.emision_id
    and e.emision_id = 'HC'
;

col curp format a20 
col nombre format a20 
col ap_paterno format a20 
col ap_materno format a20 
col modelo format a20
col email format a20  
Prompt Escenario 2. Se requiere obtener los datos del usuario que ha acumulado más puntos negativos
select p.*
  from falta f, propietario p 
  where f.propietario_id = p.propietario_id
  group by p.propietario_id, p.nombre, p.ap_materno, p.ap_paterno,
    p.rfc, p.curp, p.permiso_licencia, p.email
  having sum(f.puntos_negativos)  = (
      select max(total)
      from (
          select sum(f.puntos_negativos) as total
            from falta f, propietario p 
            where f.propietario_id = p.propietario_id
            group by p.propietario_id
      )q1
  )
;


Prompt Escenario 3 Se desea realizar un reporte de transporte público de la cdmx menos los que tengan adeudos de impuestos
select auto_id, num_serie, modelo, propietario_id, marca_id, status_auto_id
  from transporte_publico tp 
  natural join  auto a 
  natural join placa p 
  where p.entidad_id = 'CDMX' 
minus 
select a.auto_id, a.num_serie, a.modelo, a.propietario_id, a.marca_id, a.status_auto_id
  from transporte_publico tp 
  join auto a 
  on tp.auto_id = a.auto_id 
  join cat_status_auto sa
  on sa.status_auto_id = a.status_auto_id
  where sa.status_auto_id = 'AI' ;


Prompt  Escenario 4. Se desea consultar las placas del estado de Durango y en caso de que exista la marca del auto correspondiente
select p.placa_id, p.entidad_id as entidad_id, a.marca_id as marca_id
    from placa p  
    left join auto a
    on p.auto_id = a.auto_id 
    where p.entidad_id = 'DUR';


Prompt Escenario 5. Se requiere conocer los registros de emisiones y su valor que se han generado por número de serie
Prompt además del tipo de auto y si es de carga la capacidad en toneladas, si es de transporte público la licencia con la que cuenta
Prompt o de ser el caso si es particular el número de bolsas de aire
select va.num_serie, va.emision_id, va.valor, a.es_transp_publico, a.es_particular, a.es_de_carga, 
  tp.lic_transporte_id as tipo_licencia, p.num_bolsas_aire, c.capacidad as capacidad_en_toneladas
  from rep_verificentro_auto va   
  join  auto a
  on a.num_serie = va.num_serie
  left join transporte_publico tp
  on a.auto_id = tp.auto_id
  left join particular p
  on a.auto_id = p.auto_id
  left join de_carga c
  on a.auto_id = c.auto_id
  ;


Prompt |Consulta con tablas externas|
Prompt Escenario 6. Se requiere saber si el dispositivo con número de serie 3575088583520071R cuenta con las normas aprobadas para ser asignado a un auto
select rde.*, d.dispositivo_id
  from regulacion_dispos_ext rde, dispositivo d
  where rde.num_serie = d.num_serie
  and d.num_serie='3575088583520071R' ;


Prompt |Consulta a tabla temporal| 
select * from auto_verificentro_temp;
Prompt Conteo de registros nuevos 
select count(*) as registros_nuevos, auto_id
  from auto_verificentro_temp 
  group by auto_id; 


Prompt |Consulta con sinónimos| 
Prompt Las siguientes consultas se realizarán con el usuario invitado 
Prompt Conectando con pd_proy_invitado 
connect pd_proy_invitado/dupe 


Prompt Escenario 7. Se desea recuperar el email del propietario que generó un reporte el día 08/10/2020 y si es que ha generado una notificación 
prompt los valores de esta 
select p.email,n.*
  from propietario p, reporte_emisiones re, notificacion n
  where re.rep_emisiones_id = n.rep_emisiones_id 
  and p.propietario_id = n.propietario_id
  and re.fecha = '08/OCT/2020'
  and re.emision_id in ('HC','CO','NOX','CO2')
  and re.dispositivo_id = '1000'
union 
select p.email, n.*
  from propietario p, reporte_emisiones re, notificacion n
  where re.rep_emisiones_id = n.rep_emisiones_id 
  and p.propietario_id = n.propietario_id
  and n.fecha ='08/OCT/2020';


connect pd_proy_admin/dupe