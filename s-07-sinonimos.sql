--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de sinónimos.

--prompt Conectando como PD_PROY_ADMIN para crear sinonimos.
--connect PD_PROY_ADMIN/dupe

prompt Creando sinónimos públicos del usuario admin.

create or replace public synonym cat_entidad 
for PD_PROY_ADMIN.cat_entidad;

create or replace public synonym cat_status_auto 
for PD_PROY_ADMIN.cat_status_auto;

create or replace public synonym cat_marca 
for PD_PROY_ADMIN.cat_marca;

create or replace public synonym cat_lic_transporte 
for PD_PROY_ADMIN.cat_lic_transporte;

create or replace public synonym cat_emision 
for PD_PROY_ADMIN.cat_emision; 


prompt Otorgando permisos de lectura al usuario invitado

grant select on PD_PROY_ADMIN.dispositivo to PD_PROY_INVITADO;
grant select on PD_PROY_ADMIN.notificacion to PD_PROY_INVITADO;
grant select on PD_PROY_ADMIN.reporte_emisiones to PD_PROY_INVITADO;
grant select on PD_PROY_ADMIN.propietario to PD_PROY_INVITADO;
grant select on PD_PROY_ADMIN.auto to PD_PROY_INVITADO;
grant select on PD_PROY_ADMIN.historico_auto_propietario to PD_PROY_INVITADO;

Prompt connectando como sys para otorgar permisos de crear sinonimos a pd_proy_invitado
connect sys as sysdba
grant create synonym to pd_proy_invitado;

prompt Conectando como PD_PROY_INVITADO para crear sinonimos
connect PD_PROY_INVITADO/dupe;

prompt Creando sinónimos que le pertenecen al usuario invitado. 

create or replace synonym dispositivo for PD_PROY_ADMIN.dispositivo;
create or replace synonym notificacion for PD_PROY_ADMIN.notificacion;
create or replace synonym reporte_emisiones for PD_PROY_ADMIN.reporte_emisiones;
create or replace synonym propietario for PD_PROY_ADMIN.propietario;
create or replace synonym auto for PD_PROY_ADMIN.auto;
create or replace synonym his_auto_propietario for PD_PROY_ADMIN.his_auto_propietario;

prompt Conectando como PD_PROY_ADMIN para crear sinonimos
connect PD_PROY_ADMIN/dupe 

Prompt Creando sinónimos de todas las tablas en admin 
--Bloque anónimo
set serveroutput on 
declare
--cursor de nombre de las entidades del usuario admin
cursor cur_nom_entidad is
  select TABLE_NAME from USER_TABLES order by TABLE_NAME;

begin 
    for i in cur_nom_entidad loop
        execute immediate
        'create or replace synonym '||'LL_'||i.TABLE_NAME||' for PD_PROY_ADMIN.'||i.TABLE_NAME;
    end loop;
    dbms_output.put_line('Creación de sinónimos exitosa');
end;
/