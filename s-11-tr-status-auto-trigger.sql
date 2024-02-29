--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Trigger 2. 

--Escenario 2. Realizar alguna operación DML sobre alguna tabla como consecuencia de la ocurrencia de un evento en otra. 

--Actualizar historico auto_status cada vez que se registra o actuliza un nuevo status de un auto. 


--prompt Conectando como PD_PROY_ADMIN para crear trigger
--connect PD_PROY_ADMIN/dupe

set serveroutput on

create or replace trigger hist_status_auto_prop_trigger
  after insert or update of status_auto_id on auto 
  for each row 
  declare
  
  v_hist_id number(10,0); 
  v_fecha date;
  v_auto_id number(10,0);
  v_status_auto varchar2(3);
  begin

  --Obtener siguiente valor de hist_auto_id
  select hist_status_auto_seq.nextval into v_hist_id from dual;
    
  --Obtener los datos nuevos
  select sysdate into v_fecha from dual;
  --dbms_output.put_line(v_fecha);
  v_auto_id := :new.auto_id;
  v_status_auto := :new.status_auto_id;

  dbms_output.put_line('********Trigger Activado************');
  dbms_output.put_line('Auto_id -> '|| v_auto_id);
  dbms_output.put_line('status anterior -> '|| :old.status_auto_id || '  status nuevo -> ' || :new.status_auto_id);
  
  --Insertar en tabla historico_auto_propietario
  insert into historico_status_auto (hist_status_auto_id, fecha, auto_id,status_auto_id )
  values (v_hist_id, v_fecha, v_auto_id, v_status_auto );   
  dbms_output.put_line('*****************************************');

  end; 
/
show errors

