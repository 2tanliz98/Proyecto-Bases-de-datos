--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de usuarios.

--whenever sqlerror exit rollback; 


prompt Conectando como usuario sys para crear usuarios.
connect sys as sysdba

set serveroutput on

declare 
  v_usuario number := 0;
  v_rol number := 0;

begin

  --Crear rol ROL_ADMIN
  select  count (*) into v_rol 
  from dba_roles 
  where role = 'ROL_ADMIN';  
  
  if v_rol = 0 then  

    dbms_output.put_line('El rol ROL_ADMIN no existe. Se creará. ');

  else   

    dbms_output.put_line('El rol ROL_ADMIN ya existe. Se eliminará y creara nuevamente.');  
    
    execute immediate
    'drop role rol_admin';   

  end if;
  
  execute immediate 
  'create role rol_admin';
  execute immediate
  'grant create session, create table, create type, create view, create procedure, create  trigger, create sequence, create synonym, create public synonym to rol_admin';   
  dbms_output.put_line('El rol ROL_ADMIN se ha creado con éxito.'); 



  -- Crear usuario PD_PROY_ADMIN
  select  count (*) into v_usuario 
  from all_users 
  where username = 'PD_PROY_ADMIN';
  
  if v_usuario = 0 then  

    dbms_output.put_line('El usuario PD_PROY_ADMIN no existe. Se creará. ');
      
  else   

    dbms_output.put_line('El usuario PD_PROY_ADMIN ya existe. Se eliminará  y creará nuevamente.');  
    execute immediate
    'drop user PD_PROY_ADMIN cascade'; 

  end if;
    
  execute immediate 
  'create user PD_PROY_ADMIN identified by dupe quota unlimited on users';
  execute immediate
  'grant rol_admin to PD_PROY_ADMIN';
  --privilegios de admin para django
  'grant connect, resource to PD_PROY_ADMIN'  
  ---------------------------------------- 
  dbms_output.put_line('El usuario PD_PROY_ADMIN se ha creado y se le ha  asignado el rol rol_admin con éxito.');     


  --Inicializar variables para PD_PROY_INVITADO
  v_usuario := 0;
  v_rol := 0;

  
  --Crear rol ROL_INVITADO
  select  count (*) into v_rol 
  from dba_roles 
  where role = 'ROL_INVITADO';  
  
  if v_rol = 0 then  

    dbms_output.put_line('El rol ROL_INVITADO no existe. Se creará. ');

  else   

    dbms_output.put_line('El rol ROL_INVITADO ya existe. Se eliminará y creará  nuevamente.');  
    execute immediate
    'drop role ROL_INVITADO'; 

  end if;
  
  execute immediate 
  'create role ROL_INVITADO';
  execute immediate
  'grant create session, create table, create view, create procedure, create  trigger, create sequence, create synonym to ROL_INVITADO';   
  dbms_output.put_line('El rol ROL_INVITADO se ha creado con éxito.'); 


  -- Crear usuario PD_PROY_INVITADO
  select  count (*) into v_usuario 
  from all_users 
  where username = 'PD_PROY_INVITADO';
  
  if v_usuario = 0 then  

    dbms_output.put_line('El usuario PD_PROY_INVITADO no existe. Se creará. ');
      
  else   

    dbms_output.put_line('El usuario PD_PROY_INVITADO ya existe. Se eliminará  y creará nuevamente');  
    execute immediate
    'drop user PD_PROY_INVITADO cascade'; 

  end if;
    
  execute immediate 
  'create user PD_PROY_INVITADO identified by dupe quota unlimited on users';
  execute immediate
  'grant rol_invitado to PD_PROY_INVITADO';   
  dbms_output.put_line('El usuario PD_PROY_INVITADO se ha creado y se le ha  asignado el rol rol_admin con éxito.');
  
  
end;
/

connect pd_proy_admin/dupe