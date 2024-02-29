--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de tablas externas

--Escenario: Consultar si el dispositivo de mi auto cumple con todas las normas

-- Tabla Regulación de dispositivos que miden la emisión de gases 

prompt Conectando como sys para crear directorio para tabla externa.
connect sys as sysdba; 

-- Crear objeto directory en la BD
create or replace directory proy_dir as '/media/sf_VISUAL-STUDIO/ProyectoBD/externas';

grant read, write on directory proy_dir to PD_PROY_ADMIN;


prompt Conectando como PD_PROY_ADMIN para crear tabla externa.
connect PD_PROY_ADMIN/dupe;

drop table regulacion_dispos_ext;

prompt Creando tabla externa
create table regulacion_dispos_ext (
  num_serie varchar2(40), 
  regulacion varchar2(40), 
  status varchar2(40),
  fecha date
)
organization external(
  type oracle_loader
  default directory proy_dir
  access parameters(
    records delimited by newline
    badfile proy_dir:'regulacion_dispos_bad.log'
    logfile proy_dir:'regualcion_dispos_ext.log'
    fields terminated by ','
    lrtrim
    missing field values are null
    (
      num_serie, regulacion, status, 
      fecha date mask "dd-MON-yyyy"     
    )
  )  
  location ('regulacion_dispos.csv')
)
reject limit unlimited;


prompt Mostrando datos

--col num_serie format a20
--col regulacion format a25
--col status format a10
--col fecha format a20

-- El usario ingresa su auto_id pues desconoce 
--el num_serie de su dispositivo


select * from regulacion_dispos_ext
where num_serie = (
  select d.num_serie 
  from dispositivo d 
  join auto a 
  on a.dispositivo_id = d.dispositivo_id
);
