--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final.

prompt Conectando como sys para crear directorio REPORTE_VER_DIR
connect sys as sysdba; 

 --creando objeto directory en la base de datos
create or replace directory REPORTE_VER_DIR as'/media/sf_VISUAL-STUDIO/ProyectoBD/falta_dir' ;
grant read, write ON directory REPORTE_VER_DIR to pd_proy_admin;
grant execute on utl_file to pd_proy_admin;
--crendo directorio real
--!mkdir -p /media/sf_VISUAL-STUDIO/ProyectoBD/REPORTE_VER_DIR


prompt Conectando pd_proy_admin
connect pd_proy_admin/dupe 
set serveroutput on 

create or replace procedure comprobante_verificacion (
    p_auto_id in number,
    p_verificacion_id in number 
) is 

v_file       utl_file.FILE_TYPE;
v_fecha      verificacion.fecha%type;
v_num_serie  auto.num_serie%type;
v_clave      verificacion.clave_verificentro%type;

cursor cur_rep_verificentro is 
    select rv.emision_id, rv.valor
        from auto a, verificacion v, reporte_verificentro rv
        where a.auto_id = v.auto_id
        and a.auto_id = p_auto_id
        and v.verificacion_id = rv.verificacion_id 
        and v.verificacion_id = p_verificacion_id ;

begin 
    select num_serie into v_num_serie
        from auto a 
        where a.auto_id = p_auto_id; 

    select fecha into v_fecha
        from verificacion v
        where v.verificacion_id = p_verificacion_id;

    select clave_verificentro into v_clave
        from verificacion v 
        where v.verificacion_id = p_verificacion_id;

    v_file := utl_file.fopen(
        location    => 'REPORTE_VER_DIR',
        filename    => 'reporte'||v_num_serie||'.csv',
        open_mode   => 'W'
    );

    utl_file.put_line(v_file,
            'Número de serie del auto: '||v_num_serie||','||chr(10)||
            'Fecha de verificación: '||v_fecha||','||chr(10)||
            'Verificación generada en el centro de verificación con clave: '||v_clave||','||chr(10)||
            'Emision_id,valor'
        );

    for i in cur_rep_verificentro loop
        utl_file.put_line (v_file, i.emision_id||','||i.valor);
    end loop;

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
/
show errors