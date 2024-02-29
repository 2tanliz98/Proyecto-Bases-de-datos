--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Funcion que regresa el numero de notificaciones que se han generado para un propietario.

prompt Conectando pd_proy_admin para crear función.
connect pd_proy_admin/dupe 

set serveroutput on
create or replace function num_notificaciones_fx(
    v_propietario_id number
)
return number is 

--declarar variables
v_resultado number;

cursor cur_registros_noti is 
select count(*) as num
from notificacion 
where propietario_id = v_propietario_id
group by propietario_id;

begin 
  open cur_registros_noti;
  fetch cur_registros_noti into v_resultado;

  --Si no hay notifaciones para ese usuario
  if v_resultado is null then
    v_resultado := 0 ;
  end if; 
  
  return v_resultado;

end;
/
show errors
