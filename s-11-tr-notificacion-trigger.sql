
--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Trigger 3. 

--Compound trigger. Resuelve el problema de tablas mutantes

-- Cuando el dispositivo del auto reporta emisiones no aprobadas, se genera una notificacion al propietario. 

--prompt Conectando como PD_PROY_ADMIN para crear trigger.
--connect PD_PROY_ADMIN/dupe

create or replace trigger notificacion_trigger
for insert on reporte_emisiones 
compound trigger


--Antes de la consulta DML
--Recordar los valores de emisiones permitidos
before statement is 

cursor cur_cat_emision is
select * from cat_emision;

cursor cur_count_noti is 
select count(*) num_notificaciones
from notificacion 
where num_notificacion >= 2
group by propietario_id;

v_count number(10,0) := 0;
begin

  -- Reporte de cuantos propietarios tienen más de 2 notificaciones

  for r in cur_count_noti loop
    v_count := v_count + 1;
  end loop;

  dbms_output.put_line('¡ATENCION! Hay ' || v_count || ' propietario con más de 2 notificaciones.' );
  dbms_output.put_line('************************************************* ');
  
  dbms_output.put_line('->Valores de emisiones permitidos para el ' || sysdate || ' <-' );
  
  for r in cur_cat_emision loop
    dbms_output.put_line('*****************************');
    dbms_output.put_line('Emision -> ' || r.descripcion);
    dbms_output.put_line('Valor máximo -> ' || r.valor_max);
    dbms_output.put_line('Unidades -> ' || r.unidad);
  end loop;


end before statement;


after each row is 

v_c_propietario_id number(10,0);
v_c_nombre varchar2(40);
v_c_ap_paterno varchar2(40);

v_valor_emision number(5,3); 
v_emision_id varchar2(3);
v_aprobado char(1);
v_num_noti number(1,0);
v_count_noti number;

v_c_emision_id varchar2(3);
v_c_valor_max number(4,3);
v_c_descripcion varchar2(40);

cursor cur_cat_emision is
  select * from cat_emision
    where emision_id = :new.emision_id;

cursor cur_propietario_noti is 
  select p.propietario_id as prop_id, p.nombre, p.ap_paterno
    from dispositivo d, auto a, propietario p
    where d.dispositivo_id = a.dispositivo_id
    and a.propietario_id = p.propietario_id
    and d.dispositivo_id = :new.dispositivo_id;

begin 
  --Obtener propietario del auto que tiene el dispositivo que genera el reporte de las emisiones
  for r in cur_propietario_noti loop
    v_c_propietario_id := r.prop_id;
    --dbms_output.put_line( r.prop_id);
    v_c_nombre := r.nombre;
    v_c_ap_paterno := r.ap_paterno;
  end loop;
  
  dbms_output.put_line('*****************************************************');
  dbms_output.put_line('Generando reporte para:');
  dbms_output.put_line('-> Propietario_id: ' || v_c_propietario_id );
  dbms_output.put_line('-> Nombre: ' || v_c_nombre );
  dbms_output.put_line('-> Apellido paterno: ' || v_c_ap_paterno);


  --Obtener valor de la emision 
  v_valor_emision := :new.valor;

  for r in cur_cat_emision loop
    v_c_emision_id := r.emision_id;
    v_c_descripcion := r.descripcion;
    v_c_valor_max := r.valor_max;
  end loop;
  dbms_output.put_line('*****************************');
  dbms_output.put_line('-> Emision: ' || v_c_descripcion);
  dbms_output.put_line('-> Valor máximo permitido: ' || v_c_valor_max);
  dbms_output.put_line('-> Valor obtenido: ' || v_valor_emision);

-- Si la emision reportada es mayor que la permitida.
  if v_valor_emision > v_c_valor_max then
    -- se mandará notificacion al usuario
    dbms_output.put_line('*****************************');
    dbms_output.put_line('**Valor de ' || v_c_descripcion ||  ' no aprobado**');


--Conocer si ya hay notificaciones para ese usuario
  v_count_noti := num_notificaciones_fx(v_c_propietario_id);
  

    --Si no hay notificaciones 
    if v_count_noti = 0 then
      --seria la primera notificacions
      v_num_noti := 1;
      --dbms_output.put_line('**Valor de num_noti es: '  || v_num_noti);
    else
      --Si ya hay. 
      select num_notificacion into v_num_noti
      from notificacion 
      where propietario_id = v_c_propietario_id;
  
      -- Si ya se sería la tercera notificacion que se manda
      if v_count_noti > 3 then
        raise_application_Error(-20001,'Ya se han mandado 3 notificaciones al   propietario_id: '||v_c_nombre);
      end if;
      
      v_num_noti := v_num_noti + 1;
      
    end if;

  else
    dbms_output.put_line('**Valor de ' || v_c_descripcion ||  ' aprobado**');
    raise_application_Error(-20002,'No es necesario mandar una notificacion al propietario_id: ' || v_c_nombre);
   
  end if;


    --dbms_output.put_line(v_c_propietario_id);
    --dbms_output.put_line(v_num_noti);
    --dbms_output.put_line(:new.rep_emisiones_id);

   --mandar notificacion al usuario 
   insert into notificacion (propietario_id, num_notificacion, fecha, rep_emisiones_id)values(v_c_propietario_id, v_num_noti, sysdate, :new.rep_emisiones_id );
   dbms_output.put_line('*Se ha mandado la notificacion: ' || v_num_noti ||  ' al propietario_id: ' || v_c_propietario_id);

 
end after each row;

after statement is

v_rep_id reporte_emisiones.rep_emisiones_id%type;
v_emision_id cat_emision.emision_id%type;
v_valor_max cat_emision.valor_max%type;
v_valor reporte_emisiones.valor%type;

cursor cur_cat_emision is 
select emision_id, valor_max 
from cat_emision;


begin 
  --Si no cumple los valores permitidos, actualizar a 'N' el atributo aprobado del reporte.
  select rep_emisiones_dispo_seq.currval into v_rep_id from dual;
  
  select emision_id, valor 
  into v_emision_id, v_valor
  from reporte_emisiones
  where rep_emisiones_id = v_rep_id;

  for r in cur_cat_emision loop
    if r.emision_id = v_emision_id then 
      v_valor_max := r.valor_max;
    end if;
  end loop;

  if v_valor > v_valor_max then
    update reporte_emisiones
    set aprobado = 'N'
    where rep_emisiones_id = v_rep_id;
  else
    update reporte_emisiones
    set aprobado = 'A'
    where rep_emisiones_id = v_rep_id;
    
  end if;

end after statement ;

end;
/
show errors

