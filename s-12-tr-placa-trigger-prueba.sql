--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Trigger 1. 

--Escenario 1. Validar reglas de negocio que no pueden ser implementadas por restricciones básicas como son unique, check. 

--Si se inserta un status de placa diferente de 'A' o 'I'. 

set serveroutput on
--Insert 
declare
v_placa_id number := 4;
v_num_registro number;
begin
  dbms_output.put_line('Insertando placa_ID: ' || v_placa_id  );
  --No valido
  insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (4, '37808-AAA', to_date('30/01/2020', 'dd/mm/yyyy') , 'A', null, 'CDMX');

  select count(*) into v_num_registro 
  from placa 
  where placa_id = v_placa_id;

  if v_num_registro = 1 then
    dbms_output.put_line('Insert  exitoso.');
  else
    dbms_output.put_line('Insert no exitoso.');
  end if;


end;
/

-- Si se elimina una placa. El status del auto se actualiza a 'Sin placa'.
declare 
v_placa_id number := 1;
v_status placa.status%type;
v_auto_id placa.auto_id%type;

cursor cur_auto is 
select auto_id, num_serie, status_auto_id
from auto 
where auto_id = v_auto_id;

begin
  
  dbms_output.put_line('Eliminando placa_ID: ' || v_placa_id );

  select auto_id into v_auto_id 
  from placa 
  where placa_id = v_placa_id;


  delete from placa 
  where placa_id = v_placa_id;


  for r in cur_auto loop
  dbms_output.put_line('Auto_id -> ' || r.auto_id);
  dbms_output.put_line('num_serie -> ' || r.num_serie);
  dbms_output.put_line('Status_auto -> ' || r.status_auto_id);
  
  
  end loop;
  

end;
/
rollback;
show errors
