
--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Trigger 1. 

--Escenario 1. Validar reglas de negocio que no pueden ser implementadas por restricciones básicas como son unique, check.

-- Cuando el dispositivo del auto reporta emisiones no aprobadas, se genera una notificacion al propietario.

set serveroutput on

declare 
v_dispo_id number(10,0) := 1020;
v_fecha date := to_date('08/02/2021', 'dd/mm/yyyy');
v_num_registro number(10,0);
v_repor_id number(10,0);
v_registro_noti notificacion%ROWTYPE;
cursor cur_rep_emisiones is
select * from reporte_emisiones;

begin
    
  dbms_output.put_line('Insertar registro en reporte_emisiones');

  insert into reporte_emisiones(rep_emisiones_id, fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval,v_fecha , v_dispo_id, 'HC', 0.7, 'A');

  dbms_output.put_line('************************************************');
  dbms_output.put_line('REPORTE DEL DISPOSITIVO: ' || v_dispo_id || ' FECHA: ' || v_fecha);

  --select rep_emisiones_id.currval into v_repor_id from dual;

  for r in cur_rep_emisiones loop
    if r.dispositivo_id = v_dispo_id and r.fecha = v_fecha then
      dbms_output.put_line('--> rep_emisiones_id: ' || r.rep_emisiones_id);
      dbms_output.put_line('--> fecha: ' || r.fecha);
      dbms_output.put_line('--> dispositivo_id: ' || r.dispositivo_id);
      dbms_output.put_line('--> emision_id: ' || r.emision_id);
      dbms_output.put_line('--> valor: ' || r.valor);
      dbms_output.put_line('--> aprobado: ' || r.aprobado);
      dbms_output.put_line('***********************************');
      
      
      select count(*) into v_num_registro
      from notificacion
      where rep_emisiones_id =  r.rep_emisiones_id;

      --Validar que se mando la notificacion
      -- Si aprobado 'A', count(*) = 0
      if r.aprobado = 'A' then
        if v_num_registro = 0 then
          dbms_output.put_line('-> Correcto. ' || r.emision_id || ' tiene valor aprobado y no requirio notificacion.');
        else
          dbms_output.put_line('Se ha encontrado ' || v_num_registro || ' numero de notificaciones para el rep_emisiones_id: ' || r.rep_emisiones_id || ' y se esperaban: 0 notificaciones');
        end if;
      else
        -- Si aprobado 'N', count(*) = 1
        if v_num_registro = 1 then
          dbms_output.put_line('-> Correcto. Se ha enviado ' || v_num_registro ||' notificacion');

          select * into v_registro_noti
          from notificacion
          where REP_EMISIONES_ID = r.rep_emisiones_id;

         dbms_output.put_line('************NOTIFICACION*******************');
         dbms_output.put_line('-> Propietario_id: ' || v_registro_noti.propietario_id); 
         dbms_output.put_line('-> Número notificación: ' || v_registro_noti.num_notificacion);
         dbms_output.put_line('-> Fecha. ' || v_registro_noti.fecha);  
         dbms_output.put_line('-> Reporte_emisiones_id:  ' || v_registro_noti.REP_EMISIONES_ID); 


        else
          dbms_output.put_line('Se ha encontrado' || v_num_registro || 'numero de notificaciones para el rep_emisiones_id: ' || r.rep_emisiones_id || 'y se esperaba: 1 notificación');
        end if;
      end if;
    end if;

  end loop;

 

  
end;
/
rollback;
show errors
