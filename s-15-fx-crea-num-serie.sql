--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Funcion que crea el numero de serie del auto. 


prompt Conectando pd_proy_admin para crear función.
connect pd_proy_admin/dupe 
set serveroutput on

create or replace function crea_num_serie_fx(
    v_auto_id number,
    v_number number
)
return varchar2 is 

--declarar variables
v_resultado varchar2(50);

cursor cur_auto is 
select * 
from auto 
where auto_id = v_auto_id;

begin 

  for r in cur_auto loop

    v_resultado :=  to_char(sysdate, 'mm') || v_number || r.marca_id || substr(r.modelo,1,3) || substr(r.anio,3,4) || '-' || r.es_transp_publico || r.es_de_carga || r.es_particular; 

    v_resultado := upper(v_resultado);

    dbms_output.put_line('v_res:  ' || v_resultado);

  end loop;
  


  return v_resultado;

end;
/
show errors
