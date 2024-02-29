--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Prueba de la Función que recorre la BD y devuelve a los propietarios que tienen mas de 200 puntos negativos.



connect pd_proy_admin/dupe
set serveroutput on

declare
v_array array_p;
v_registro propietario%rowtype;
begin
  v_array := count_puntos_fx();

  for i in 1..v_array.count loop
    dbms_output.put_line('Propietario_id: ' || v_array(i) || ' ha perdido su derecho a licencia');
    --Actualizar permiso a 'N'
    update propietario
    set permiso_licencia = 'N'
    where propietario_id = v_array(i);

    select *
    into v_registro
    from propietario 
    where propietario_id = v_array(i);

    dbms_output.put_line('-> Propietario_id: ' || v_registro.propietario_id 
    || ' -> rfc: ' || v_registro.rfc 
    || ' ->permiso_licencia: ' || v_registro.permiso_licencia);

  end loop;
end;
/
show errors
rollback;