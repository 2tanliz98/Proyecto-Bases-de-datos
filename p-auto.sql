--@Autor: Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/01/2021
--@Descripción: Proyecto final. 

create or replace procedure insertar_auto(
    v_auto_id out number,
    p_num_serie  varchar2 ,
    p_anio number ,
    p_es_transp_publico number ,
    p_es_de_carga number ,
    p_es_particular number,
    p_modelo varchar2,
    p_dispositivo_id number ,
    p_propietario_id number
    p_status_auto_id varchar2,
    p_marca_id  varchar2,
    p_num_p_sentados number,
    p_num_p_parados number,
    p_lic_transporte_id char,
    p_capacidad number ,
    p_capacidad_m3 number,
    p_num_remolques number,
    p_num_bolsas_aire number ,
    p_frenos_abs char ,
    p_tipo_transmision char,
) is

begin 
    select auto_seq.nextval into auto_id
        from dual; 
    
    if p_es_transp_publico = 1 then 
        insert into transporte_publico(auto_id, num_p_sentados, num_p_parados) values (v_auto_id. p_num_p_sentados, p_num_p_parados);
    end if;

    if p_es_de_carga = 1 then 
        insert into de_carga(auto_id, capacidad_toneladas, capacidad_m3, num_remolques) values(v_auto_id, p_capacidad_toneladas, p_capacidad_m3, p_num_remolques);
    end if;

    if p_es_particular = 1 then 
        insert into particular(auto_id, num_bolsas_aire, frenos_abs, tipo_transmision) values(v_auto_id, p_num_bolsas_aire, p_frenos_abs, p_tipo_transmision);
    end if; 

    insert into auto(auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id)
        values(p_auto_id, p_num_serie, p_anio, p_es_transp_publico, p_es_de_carga, p_es_particular,p_modelo,p_dispositivo_id,p_propietario_id,p_status_auto_id);

    dbms_output.put_line('El auto con id -> '||v_auto_id||' fue insertado correctamente');
    --exception 

end;
/
show errors