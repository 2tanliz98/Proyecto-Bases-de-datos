--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Funcion que regresa el numero de notificaciones que se han generado para un propietario 


set serveroutput on

declare
num_noti number;
v_propietario_id number;
begin


  num_noti := num_notificaciones_fx(100);

  dbms_output.put_line('Para el propietario_id : ' || v_propietario_id || 'Se han generado ' ||  num_noti || ' notificaciones');
end;


/
show errors
