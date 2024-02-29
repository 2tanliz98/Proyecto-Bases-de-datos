--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Procediemiento que almacena documento pdf de faltas del usuario correspondiente.

prompt Conectando como sys para crear directorio falta_dir
connect sys as sysdba; 

--creando objeto directory en la bd
create or replace directory falta_dir as '/media/sf_VISUAL-STUDIO/ProyectoBD/falta_dir' ;
grant read,write on directory falta_dir to pd_proy_admin ;
grant execute on utl_file to pd_proy_admin;
--crendo directorio en la carpeta de trabajo
--!mkdir -p /media/sf_VISUAL-STUDIO/ProyectoBD/falta_dir
--!echo 'Texto de prueba' > /media/sf_VISUAL-STUDIO/ProyectoBD/prueba.txt 


prompt Conectando pd_proy_admin para crear el pdf de faltas.
connect pd_proy_admin/dupe 
set serveroutput on

  create or replace procedure crea_falta_pdf (
      p_propietario_id in number, 
      p_num_falta in number, 
      p_puntos_negativos in number, 
      v_evidencia in varchar2,
      v_descripcion_falta in varchar2, 
      p_nombre_archivo in varchar2
  ) is 
  
  v_bfile bfile;
  v_src_offset number := 1;
  v_dest_offset number:= 1;
  v_dest_blob blob;
  v_src_length number;
  v_dest_length number;
  v_file  utl_file.FILE_TYPE;
  v_nombre_pdf  varchar2(40);
  p_resultado number;

  begin
      --comprobando que exista el archivo a ingresar
      v_bfile := bfilename('FALTA_DIR',p_nombre_archivo||'.txt');
      if dbms_lob.fileexists(v_bfile) = 1 then 
        if dbms_lob.isopen(v_bfile) = 0 then
          dbms_output.put_line('El archivo ya existe y esta cerrado');
        else
          raise_application_error(-20001,'El archivo esta abierto');
        end if;
      else 
        dbms_output.put_line('El archivo no existe, se generará un archivo nuevo');

        begin 
          v_nombre_pdf  := p_propietario_id; 
          v_file := utl_file.fopen(
            location    => 'FALTA_DIR',
            filename    => p_propietario_id||'_'||p_num_falta||'.txt',
            open_mode   => 'W');
          utl_file.put_line(v_file,
            'Propietario_id: '    ||p_propietario_id    ||chr(10)||
            'Numero de falta: '   ||p_num_falta         ||chr(10)||
            'Fecha: '             ||sysdate             ||chr(10)||
            'Puntos negativos: '  ||p_puntos_negativos  ||chr(10)||
            'Evidencia: '         ||v_evidencia         ||chr(10)||
            'Descripción de la falta: '||v_descripcion_falta);
          dbms_output.put_line('Archivo creado con nombre -> '||p_propietario_id||'_'||p_num_falta||'.txt');
          utl_file.fclose(v_file);
          exception
          when  utl_file.INVALID_PATH then
            utl_file.fclose(v_file); 
            raise_application_error(-20001, 'La localización del archivo es inválida');
          when others then 
            utl_file.fclose(v_file);
            raise;
            rollback;
          end;
        v_bfile := bfilename('FALTA_DIR',p_propietario_id||'_'||p_num_falta||'.txt');
      end if;

    dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
    insert into falta(propietario_id, num_falta, fecha, puntos_negativos, documento_pdf, evidencia, descripcion_falta)
      values(p_propietario_id, p_num_falta, sysdate, p_puntos_negativos, empty_blob(), v_evidencia, v_descripcion_falta);

    select documento_pdf into v_dest_blob
      from falta 
      where propietario_id = p_propietario_id
      and num_falta = p_num_falta;

    dbms_lob.loadblobfromfile(
    dest_lob => v_dest_blob,
    src_bfile => v_bfile,
    amount => dbms_lob.getlength(v_bfile),
    dest_offset => v_dest_offset,
    src_offset => v_src_offset
    );
    dbms_lob.close(v_bfile);

    --verificando escritura
    v_src_length := dbms_lob.getlength(v_bfile);
    v_dest_length := dbms_lob.getlength(v_dest_blob);
    if v_src_length = v_dest_length then
      dbms_output.put_line('Escritura correcta, bytes escritos: '
      || v_src_length);
    else
      raise_application_error(-20002,'Error al escribir datos.\n'
      ||' Se esperaba escribir '||v_src_length
      ||' Pero solo se escribio '||v_dest_length);
    end if;
  end;
  /
show errors