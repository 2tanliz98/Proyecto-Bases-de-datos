--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Fotos para las licencias

prompt Conectando como sys para crear directorio imagenes
connect sys as sysdba; 
--creando objeto directory en la bd
create or replace directory imagenes as '/media/sf_VISUAL-STUDIO/ProyectoBD/IMAGENES';
grant read on directory imagenes to pd_proy_admin ;

prompt Conectando como sys para ccargar imagenes a las licencias
connect pd_proy_admin/dupe
create or replace procedure p_fotos_licencia(
    p_licencia_id number,
    p_num_imagenes number
)  is

v_bfile bfile;
v_src_offset number := 1;
v_dest_offset number := 1;
v_dest_blob blob;
v_src_length number;
v_dest_length number;
cursor cur_fotos_licencia is 
  select licencia_id, foto 
    from licencia where licencia_id between p_licencia_id and (p_licencia_id + p_num_imagenes); 

begin
    for r in cur_fotos_licencia loop
        v_src_offset := 1;
        v_dest_offset := 1;
        dbms_output.put_line('Cargando foto a licencia_id= '||r.licencia_id);

        v_bfile := bfilename('IMAGENES', 'licencia'||r.licencia_id||'.jpg');

        if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 then 
            dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
        else 
            raise_application_error(-20001, 'Archivo: ' || 'licencia'||r.licencia_id ||' no existe en el directorio IMAGENES o se encuentra en uso');
        end if;

        -- bloquea el registro para que nada más acceda a la transaction
        select foto into v_dest_blob
        from licencia
        where licencia_id = r.licencia_id
        for update; 


        dbms_lob.loadblobfromfile(
            dest_lob => v_dest_blob,
            src_bfile => v_bfile,
            amount => dbms_lob.getlength(v_bfile),
            dest_offset => v_dest_offset,
            src_offset => v_src_offset
        );
        dbms_lob.close(v_bfile);

        --validación de datos insertados
        v_src_length := dbms_lob.getlength(v_bfile);
        v_dest_length := dbms_lob.getlength(v_dest_blob);

        if v_src_length = v_dest_length then
            dbms_output.put_line('Procedimiento realizado correctamente | Bytes escritos: ' || v_src_length);
        else 
            raise_application_error(-20002, 'ERROR '
            || ' Datos a escribir = '
            || v_src_length
            || ' Datos escritos = '
            || v_dest_length);
            rollback;
        end if;
    end loop;
end;
/
show errors

