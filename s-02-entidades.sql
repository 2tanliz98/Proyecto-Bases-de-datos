--@Autor: Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/01/2021
--@Descripción: Proyecto final. Creación de tablas

prompt Conectando con pd_proy_admin para crear .
connect pd_proy_admin/dupe

--propietario 
create table propietario(
  propietario_id number(10, 0) not null,
  rfc  varchar2(13) not null,
  curp varchar2(40),
  nombre varchar2(40) not null,
  ap_paterno varchar2(40) not null,
  ap_materno varchar2(40) not null,
  permiso_licencia char(1) not null,
  email varchar2(40) not null,
  constraint propietario_pk primary key (propietario_id),
  constraint propietario_rfc_uk unique (rfc),
  constraint propietario_curp_uk unique (curp)
)
;



-- dispositivo 
create table dispositivo(
    dispositivo_id number(10, 0) not null,
    num_serie varchar2(18) not null,
    constraint dispositivo_pk primary key (dispositivo_id),
    constraint dispositivo_num_serie_uk unique (num_serie)
)
;



--cat_status_auto 
create table cat_status_auto(
    status_auto_id varchar2(3) not null,
    descripcion varchar2(40) not null,
    constraint status_auto_pk primary key (status_auto_id)
)
;



--cat_marca 
create table cat_marca(
    marca_id varchar2(4) not null,
    descripcion varchar2(100) not null,
    constraint marca_pk primary key (marca_id)
)
;



--auto 
create table auto(
    auto_id  number(10, 0) not null,
    num_serie  varchar2(18)  not null,
    anio number(4, 0)  not null,
    es_transp_publico number(1,0) not null,
    es_de_carga number(1,0) not null,
    es_particular number(1,0) not null,
    modelo varchar2(40)  not null,
    dispositivo_id number(10, 0) not null,
    propietario_id number(10, 0) not null,
    status_auto_id varchar2(3) not null,
    marca_id  varchar2(4) not null,
    constraint auto_pk primary key (auto_id), 
    constraint auto_propietario_fk foreign key (propietario_id)
    references propietario(propietario_id),
    constraint auto_dispositivo_fk foreign key (dispositivo_id)
    references dispositivo(dispositivo_id) ,
    constraint auto_status_auto_fk foreign key (status_auto_id)
    references cat_status_auto(status_auto_id),
    constraint auto_cat_marca_fk foreign key (marca_id)
    references cat_marca(marca_id) ,
    constraint auto_num_serie_uk unique (num_serie),
    constraint auto_tipo_chk check ((es_de_carga = 1 and es_particular = 1 and es_transp_publico = 0) or
    (es_de_carga = 0 and es_particular = 1 and es_transp_publico = 0) or
    (es_de_carga = 1 and es_particular = 0 and es_transp_publico = 0) or
    (es_de_carga = 0 and es_particular = 0 and es_transp_publico = 1))
)
;


 
--cat_emision 
create table cat_emision(
    emision_id varchar2(3) not null,
    descripcion varchar2(40) not null,
    valor_max number(4, 3) not null,
    valor_min number(4, 3) not null,
    unidad varchar2(20) not null,
    constraint emision_pk primary key (emision_id)
)
;



--cat_entidad 
create table cat_entidad(
    entidad_id char(4) not null,
    nombre varchar2(40) not null,
    constraint entidad_entidad_pk primary key (entidad_id)
)
;



--cat_lic_transporte 
create table cat_lic_transporte(
    lic_transporte_id    char(1)         not null,
    descripcion          varchar2(80)    not null,
    constraint cat_lic_transporte_pk primary key (lic_transporte_id)
)
;



--transporte_publico 
create table transporte_publico(
    auto_id number(10, 0) not null,
    num_p_sentados number(3, 0) not null,
    num_p_parados number(3, 0) not null,
    lic_transporte_id char(1) not null,
    constraint transporte_publico_auto_pk primary key (auto_id), 
    constraint transporte_publico_auto_fk foreign key (auto_id)
    references auto(auto_id) on delete cascade,
    constraint transporte_publico_lic_fk foreign key (lic_transporte_id)
    references cat_lic_transporte(lic_transporte_id)
)
;


--de_carga 
create table de_carga(
    auto_id number(10, 0) not null,
    capacidad number(10, 0) not null,
    capacidad_m3 number(10,0),
    num_remolques number(3,0),
    constraint carga_auto_pk primary key (auto_id), 
    constraint carga_auto_fk foreign key (auto_id)
    references auto(auto_id) on delete cascade
)
;



--particular 
create table particular(
    auto_id number(10, 0) not null,
    num_bolsas_aire number(2, 0) not null,
    frenos_abs char(1) not null,
    tipo_transmision char(1) not null,
    constraint particular_pk primary key (auto_id), 
    constraint particular_auto_fk foreign key (auto_id)
    references auto(auto_id) on delete cascade,
    constraint auto_frenos_abs_chk check(frenos_abs = 1 or frenos_abs = 0),
    constraint auto_tipo_transm_chk check(tipo_transmision ='M' or tipo_transmision ='A')
)
;



--falta 
create table falta(
    propietario_id  number(10, 0) not null,
    num_falta  varchar2(40) not null,
    fecha  date default sysdate  not null,
    puntos_negativos  number(10, 0) not null,
    documento_pdf  blob not null,
    evidencia  varchar2(40) not null,
    descripcion_falta varchar2(400) not null,
    constraint falta_propietario_num_pk primary key (propietario_id, num_falta), 
    constraint falta_propietario_fk foreign key (propietario_id)
    references propietario(propietario_id) on delete cascade
)
;



--historico_auto_propietario 
create table historico_auto_propietario(
    hist_auto_id number(10,0) not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    periodo generated always as (to_number(fecha_fin-fecha_inicio)) virtual,
    auto_id number(10, 0) not null,
    propietario_id number(10, 0)  not null,
    constraint hist_auto_pk primary key (hist_auto_id), 
    constraint hist_auto_fk foreign key (auto_id)
    references auto(auto_id),
    constraint hist_auto_propietario_fk foreign key (propietario_id)
    references propietario(propietario_id) 
)
;



--historico_status_auto 
create table historico_status_auto(
    hist_status_auto_id number(10, 0) not null,
    fecha date default sysdate not null,
    auto_id number(10, 0) not null,
    status_auto_id varchar2(3) not null,
    constraint hist_status_auto_pk primary key (hist_status_auto_id), 
    constraint hist_status_auto_fk foreign key (auto_id)
    references auto(auto_id),
    constraint hist_auto_status_auto_fk foreign key (status_auto_id)
    references cat_status_auto(status_auto_id)
)
;



--licencia 
create table licencia(
    licencia_id  number(10, 0) not null,
    num_licencia varchar2(8) not null,
    foto  blob not null,
    firma blob not null,
    indice_izq blob not null,
    indice_der blob not null,
    fecha_inicio date not null,
    fecha_fin  date not null,
    periodo generated always as (to_number(fecha_fin-fecha_inicio)) virtual,
    tipo_auto  char(1)  not null,
    propietario_id   number(10, 0) not null,
    licencia_anterior_id  number(10, 0),
    constraint licencia_pk primary key (licencia_id), 
    constraint licencia_propietario_fk foreign key (propietario_id)
    references propietario(propietario_id) on delete cascade,
    constraint licencia_anterior_fk foreign key (licencia_anterior_id)
    references licencia(licencia_id),
    constraint licencia_num_licencia_uk unique(num_licencia),
    constraint licencia_tipo_auto_chk check(tipo_auto='P' or tipo_auto='C' or tipo_auto='T')
)
;



--reporte_emisiones 
create table reporte_emisiones(
    rep_emisiones_id number(10, 0)    not null,
    fecha date default sysdate not null,
    valor number(5, 3) not null,
    aprobado char(1) default 'N' not null,
    emision_id varchar2(3) not null,
    dispositivo_id number(10, 0) not null,
    constraint reporte_emisiones_pk primary key (rep_emisiones_id), 
    constraint reporte_emisiones_dispo_fk foreign key (dispositivo_id)
    references dispositivo(dispositivo_id),
    constraint reporte_emisiones_cat_emision_fk foreign key (emision_id)
    references cat_emision(emision_id),
    constraint rep_emisiones_aprobado_chk check (aprobado = 'A' or aprobado = 'N')
)   
;



--notificacion 
create table notificacion(
    propietario_id number(10, 0) not null,
    num_notificacion number(1, 0)  not null,
    fecha date default sysdate not null,
    rep_emisiones_id number(10, 0) not null,
    constraint notificacion_pk primary key (propietario_id, num_notificacion), 
    constraint notificacion_propietario_fk foreign key (propietario_id)
    references propietario(propietario_id) on delete cascade,
    constraint notificacion_rep_emisiones_fk foreign key (rep_emisiones_id)
    references reporte_emisiones(rep_emisiones_id),
    constraint notificacion_num_notificacion_chk check(num_notificacion = 1 or num_notificacion = 2 or num_notificacion = 3)
)
;



--placa 
create table placa(
    placa_id number(10, 0) not null,
    num_placa varchar2(10)  not null,
    fecha_asignacion date not null,
    status  char(4) not null,
    auto_id number(10, 0),
    entidad_id   char(4) not null,
    constraint placa_pk primary key (placa_id), 
    constraint placa_entidad_fk foreign key (entidad_id) 
    references cat_entidad(entidad_id),
    constraint placa_auto_fk foreign key (auto_id)
    references auto(auto_id),
    constraint placa_num_placa_uk unique(num_placa)
)
;




--verificacion 

create table verificacion(
    verificacion_id number(10, 0) not null,
    fecha date default sysdate not null,
    folio varchar2(13) not null,
    clave_verificentro varchar2(5) not null,
    auto_id number(10, 0) not null,
    constraint verificacion_pk primary key (verificacion_id), 
    constraint verifi_auto_fk foreign key (auto_id)
    references auto(auto_id) on delete cascade,
    constraint verificacion_folio_uk unique(folio)
)
;



-- reporte_verificentro 

create table reporte_verificentro(
    rep_emisiones_id number(10, 0) not null,
    fecha date default sysdate not null,
    valor number(10, 0) not null,
    aprobado char(1) default 'N' not null,
    emision_id varchar2(3) not null,
    verificacion_id number(10, 0) not null,
    constraint reporte_verificentro_pk primary key (rep_emisiones_id), 
    constraint rep_verificentro_emision_fk foreign key (emision_id)
    references cat_emision(emision_id),
    constraint rep_verificentro_aprobado_chk check(aprobado= 'A' or aprobado = 'N'),
    constraint reporte_verificentro_verificacion_fk foreign key (verificacion_id) references verificacion(verificacion_id)
)
;

commit;


