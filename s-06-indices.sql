--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de indices.

--prompt Conectando como PD_PROY_ADMIN para crear indices.
--connect PD_PROY_ADMIN/dupe;

--Uso de índices Unique  para verificar duplicidad de valores.
create unique index rep_emision_fecha_emision_dispo_idx on reporte_emisiones (fecha,emision_id,dispositivo_id);

create unique index rep_verificentro_idx on reporte_verificentro(fecha, emision_id, verificacion_id);

create unique index verificacion_clave_auto_idx  on verificacion(fecha,clave_verificentro,auto_id);


-- Uso de índices Non Unique y con función para mejorar el desempeño de las consultas a email del propietario.
create index propietario_email_idx on propietario(substr(email,1,instr(email,'@',1)-1));

-- Uso de indice para mejorar el desempeño.
create index verificacion_clave_emision_verificacion_idx on verificacion(clave_verificentro);  
