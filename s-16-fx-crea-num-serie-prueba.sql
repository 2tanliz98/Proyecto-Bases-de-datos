--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Prueba de la funcion crea_num_serie. 

--Escenario:  Actualiza el numero de serie de todos los autos. 


set serveroutput on

declare
v_num_serie varchar2(50);
v_number number(10,0) := 0;
cursor cur_auto is 
select *
from auto;


begin

  for r in cur_auto loop
  --dbms_output.put_line('HOLA');

  v_num_serie := crea_num_serie_fx(r.auto_id, v_number);
  

  update auto
  set num_serie = v_num_serie
  where auto_id = r.auto_id; 

   dbms_output.put_line(' ->fecha: '     || to_char(sysdate, 'mm') ||
                        '--> Number: '   || v_number   || 
                        ' -> marca_id: ' || r.marca_id || 
                        ' -> modelo: '   || r.modelo   || 
                        ' ->anio: '      || r.anio      );
                        
  v_number := v_number + 1;
  end loop;
  



end;
/
show errors



rollback;