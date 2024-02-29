--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Trigger 1. 

--Escenario 1. Validar reglas de negocio que no pueden ser implementadas por restricciones básicas como son unique, check. 

--Si al insertar la placa , el status es diferente a 'A' o 'I', se activa el trigger
--Al eliminar la placa, el status del auto se actualiza a 'Sin placa'

--prompt Conectando como PD_PROY_ADMIN para crear trigger
--connect PD_PROY_ADMIN/dupe

set serveroutput on

create or replace trigger placa_status_trigger
before update or insert or delete on placa 
for each row

declare
v_placa_id placa.placa_id%type;
v_status placa.status%type;
v_auto_id placa.auto_id%type;
begin
  case

    when inserting then 

    v_status := :new.status;

    if v_status not in ('A', 'I') then
      raise_application_Error(-20001,'El status solo puede ser A - Activo o I - Inactivo');

    end if;


    when deleting then 

    --dbms_output.put_line('hola');

    v_auto_id := :old.auto_id;
    --Actualiza al auto a 'Sin placa'
    update auto
    set status_auto_id = 'SP'
    where auto_id = v_auto_id;

  end case;
end;
/
show errors