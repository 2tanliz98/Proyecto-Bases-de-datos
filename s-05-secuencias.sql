--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de secuencias.


--prompt Conectando como PD_PROY_ADMIN para crear secuencias.
--connect PD_PROY_ADMIN/dupe;

--Eliminar secuencias que pudiera haber
drop sequence hist_status_auto_seq;
drop sequence hist_status_auto_prop_seq;
drop sequence auto_seq;
drop sequence propietario_seq;
drop sequence placa_seq;
drop sequence dispositivo_seq;
drop sequence rep_emisiones_dispo_seq;
drop sequence rep_verificentro_seq;
drop sequence verificacion_seq;
drop sequence licencia_seq;


create sequence hist_status_auto_seq 
    start with 100
    increment by 1
    nominvalue
    nomaxvalue
    nocycle
    cache 6
;

create sequence hist_status_auto_prop_seq 
    start with 100
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence auto_seq
    start with 1001
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence propietario_seq
    start with 1001
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence placa_seq
    start with 2500
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence dispositivo_seq
    start with 1000
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence rep_emisiones_dispo_seq
    start with 100
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence verificacion_seq
    start with 100
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence licencia_seq
    start with 2000
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;

create sequence rep_verificentro_seq
    start with 3000
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    cache 6
;