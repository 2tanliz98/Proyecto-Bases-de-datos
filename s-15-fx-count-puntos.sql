--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Función que recorre la BD y devuelve a los propietarios que tienen mas de 200 puntos negativos.


prompt Conectando como pd_proy_admin para crear funcion
connect pd_proy_admin/dupe
set serveroutput on

--crear varray
create or replace type array_p is varray(100) of number;
/
--Crear función

create or replace function count_puntos_fx
return array_p is 

v_array array_p;
v_aux number(10,0) := 1;

--Propietarios que tienen más de 200 puntos
cursor cur_faltas is 
select sum(puntos_negativos) as p_negativos, propietario_id
from falta 
group by propietario_id
having sum(puntos_negativos) >= 200;

begin
  --dbms_output.put_line('Hola');
  
  v_array := array_p(0,0);

  for r in cur_faltas loop

    v_array(v_aux) := r.propietario_id;
  /*
    dbms_output.put_line('Propietario_id: ' || r.propietario_id || ' Puntos negativos: ' || r.p_negativos);
    */
    v_aux := v_aux + 1;
  end loop;
  
  return v_array;


end;

/
show errors