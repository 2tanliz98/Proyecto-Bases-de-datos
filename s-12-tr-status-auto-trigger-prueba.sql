--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Prueba Trigger 2. 


set serveroutput on

declare 
v_auto_id number(10,0) := 1007;
v_num_registros number(10,0);
v_registro_historico historico_status_auto%ROWTYPE;
v_registro_auto auto%ROWTYPE;
v_hist_anio number(4);
begin

  dbms_output.put_line('Actualizar status en auto');

  update auto
  set status_auto_id = 'RE'
  where auto_id = v_auto_id;
/*
 --1. Realizar un Insert en auto 
  insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval,'545-48-1111', 2021, 0,0,1, 'Sentra', 1012, 1012, 'RE', 'NIS' );
*/
 --Realizar consulta es hist_status_auto para validar la inserción

  dbms_output.put_line('Validar actualización en auto');
  --v_auto_id := auto_seq.currval;

  select count(*) into v_num_registros
  from historico_status_auto
  where auto_id = v_auto_id
  and fecha = sysdate;

  --dbms_output.put_line(v_num_registros);

  if v_num_registros = 1 then 
    
    select * into v_registro_historico
    from historico_status_auto
    where auto_id = v_auto_id
    and fecha = sysdate;

    select * into v_registro_auto
    from auto
    where auto_id = v_auto_id;

/*
    -- Validacion Para insertar
    select to_number(to_char(v_registro_historico.fecha, 'yyyy'))
    into v_hist_anio 
    from historico_status_auto
    where auto_id = v_auto_id
    and fecha = sysdate;

    --dbms_output.put_line(v_hist_anio);

    if v_hist_anio <> v_registro_auto.anio then
      raise_application_error(-20001,'El valor del campo fecha es incorrecto, se obtuvo: '    || v_hist_anio || 
      ', se esperaba: ' || v_registro_auto.anio);
    else
      dbms_output.put_line('--> Valor para columna fecha_evento correcta.');
    end if;
*/
    if v_registro_historico.auto_id <> v_auto_id then
      raise_application_error(-20002,'El valor del campo auto_id es incorrecto, se obtuvo: '    || v_registro_historico.auto_id || 
      ', se esperaba: ' || v_auto_id);
    else
      dbms_output.put_line('--> Valor para columna auto_id correcta.');
    end if;

    if v_registro_historico.status_auto_id <> v_registro_auto.status_auto_id then
      raise_application_error(-20002,'El valor del campo status_auto_id es incorrecto, se obtuvo: ' || v_registro_historico.status_auto_id || 
      ', se esperaba: '        ||  v_registro_auto.status_auto_id );
    else
      dbms_output.put_line('--> Valor para columna status_auto_id correcta.');
    end if;
    dbms_output.put_line('****************************************************');
    dbms_output.put_line('**Validación completa. Actualización hecha con éxito.**');
 else
   raise_application_Error(-20001,'Error al actualizar el registro con auto_id --> '||v_auto_id);
   
 end if;


end;

/
rollback;
show errors