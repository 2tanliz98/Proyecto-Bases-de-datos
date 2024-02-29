--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Carga inicial de datos.

prompt Conectando como PD_PROY_ADMIN para carga_inicial
connect PD_PROY_ADMIN/dupe;

-- cat_entidad
--delete from transporte_publico;
--delete from de_carga; 
--delete from particular;
--delete from verificacion;
--delete from placa; 
--delete from notificacion;
--delete from reporte_emisiones;
--delete from reporte_verificentro;
--delete from historico_status_auto; 
--delete from historico_auto_propietario;
--
--delete from falta;
--
--delete from licencia;
--
--delete from auto;
--delete from dispositivo; 
--delete from propietario;
--delete from cat_entidad;
--delete from cat_status_auto; 
--delete from cat_marca;
--delete from cat_lic_transporte;
--delete from cat_emision;



--Select * from cat_entidad;
--Select * from cat_status_auto; 
--Select * from cat_marca;
--Select * from cat_lic_transporte;
--Select * from cat_emision;
--Select * from dispositivo; 
--Select * from reporte_emisiones;
--Select * from propietario;
--Select * from auto; 
--Select * from transporte_publico;
--Select * from de_carga; 
--Select * from particular;
--Select * from placa; 
--Select * from historico_status_auto; 
--Select * from licencia;
--Select * from historico_status_auto;
--Select * from falta;
--Select * from verificacion;
--Select * from reporte_verificentro;
--Select * from notificacion;


prompt Tablas eliminadas. 

prompt Insertando en cat_entidad
insert into cat_entidad (entidad_id, nombre) values ('AGS', 'Aguascalientes');
insert into cat_entidad (entidad_id, nombre) values ('BC', 'Baja California');
insert into cat_entidad (entidad_id, nombre) values ('BCS', 'B California Sur');
insert into cat_entidad (entidad_id, nombre) values ('CAM', 'Campeche');
insert into cat_entidad (entidad_id, nombre) values ('COH', 'Coahuila');
insert into cat_entidad (entidad_id, nombre) values ('COL', 'Colima');
insert into cat_entidad (entidad_id, nombre) values ('CHP', 'Chiapas');
insert into cat_entidad (entidad_id, nombre) values ('CHI', 'Chihuahua');
insert into cat_entidad (entidad_id, nombre) values ('DUR', 'Durango');
insert into cat_entidad (entidad_id, nombre) values ('CDMX','Ciudad de Mexico');
insert into cat_entidad (entidad_id, nombre) values ('GUA', 'Guanajuato');
insert into cat_entidad (entidad_id, nombre) values ('GUE', 'Guerrero');
insert into cat_entidad (entidad_id, nombre) values ('HID', 'Hidalgo');
insert into cat_entidad (entidad_id, nombre) values ('JAL', 'Jalisco');
insert into cat_entidad (entidad_id, nombre) values ('ESM', 'Estado de Mexico');
insert into cat_entidad (entidad_id, nombre) values ('MCH', 'Michoacan');
insert into cat_entidad (entidad_id, nombre) values ('MOR', 'Morelos');
insert into cat_entidad (entidad_id, nombre) values ('NAY', 'Nayarit');
insert into cat_entidad (entidad_id, nombre) values ('NL', 'Nuevo León');
insert into cat_entidad (entidad_id, nombre) values ('OAX', 'Oaxaca');
insert into cat_entidad (entidad_id, nombre) values ('PUE', 'Puebla');
insert into cat_entidad (entidad_id, nombre) values ('QUE', 'Querétaro');
insert into cat_entidad (entidad_id, nombre) values ('QR', 'Quintana Roo');
insert into cat_entidad (entidad_id, nombre) values ('SLP', 'San Luis Potosí');
insert into cat_entidad (entidad_id, nombre) values ('SIN', 'Sinaloa');
insert into cat_entidad (entidad_id, nombre) values ('SON', 'Sonora');
insert into cat_entidad (entidad_id, nombre) values ('TAB', 'Tabasco');
insert into cat_entidad (entidad_id, nombre) values ('TAM', 'Tamaulipas');
insert into cat_entidad (entidad_id, nombre) values ('TLX', 'Tlaxcala');
insert into cat_entidad (entidad_id, nombre) values ('VER', 'Veracruz');
insert into cat_entidad (entidad_id, nombre) values ('YUC', 'Yucatán');
insert into cat_entidad (entidad_id, nombre) values ('ZAC', 'Zacatecas');


--cat_status_auto

prompt Insertando en cat_status_auto
insert into cat_status_auto (status_auto_id, descripcion) 
values ('RE', 'En regla');
insert into cat_status_auto (status_auto_id, descripcion) 
values ('LC', 'Licencia expirada');
insert into cat_status_auto (status_auto_id, descripcion) 
values ('AI', 'Adeudo impuestos');
insert into cat_status_auto (status_auto_id, descripcion) 
values ('VP', 'Verificación pendiente');
insert into cat_status_auto (status_auto_id, descripcion) 
values ('SP', 'Sin placa');


--cat_marca


prompt Insertando en cat_marca
insert into cat_marca (marca_id, descripcion)
values ('NIS', 'Nissan');
insert into cat_marca (marca_id, descripcion)
values ('AUD', 'Audi');
insert into cat_marca (marca_id, descripcion)
values ('BMW', 'BMW');
insert into cat_marca (marca_id, descripcion)
values ('CHE', 'Chevrolet');
insert into cat_marca (marca_id, descripcion)
values ('FER', 'Ferrari');
insert into cat_marca (marca_id, descripcion)
values ('FOR', 'Ford');
insert into cat_marca (marca_id, descripcion)
values ('HON', 'Honda');
insert into cat_marca (marca_id, descripcion)
values ('KIA', 'Kia');


--cat_lic_transporte


prompt Insertando en cat_lic_transporte
insert into cat_lic_transporte (lic_transporte_id, descripcion)
values ('A', 'Taxis tipo sedan');
insert into cat_lic_transporte (lic_transporte_id, descripcion)
values ('B', 'Camionetas que no transportan pasajeros de pie');
insert into cat_lic_transporte (lic_transporte_id, descripcion)
values ('C', 'Autobuses y camiones que tienen capacidad para transportar a 20 o más pasajeros');



--cat_emision


prompt Insertando en cat_emision
insert into CAT_EMISION (EMISION_ID, DESCRIPCION, VALOR_MIN, VALOR_MAX, UNIDAD) values ('HC', 'Hidrocarburos', 0.3, 0.6, 'ppm');
insert into CAT_EMISION (EMISION_ID, DESCRIPCION, VALOR_MIN, VALOR_MAX, UNIDAD) values ('CO', 'Monóxido de Carbono', 0, 0.8, 'porcentaje');
insert into CAT_EMISION (EMISION_ID, DESCRIPCION, VALOR_MIN, VALOR_MAX, UNIDAD) values ('NOX', 'Óxido de Nitrógeno', 0.22, 0.47, 'porcentaje');
insert into CAT_EMISION (EMISION_ID, DESCRIPCION, VALOR_MIN, VALOR_MAX, UNIDAD) values ('CO2', 'Dioxido de Carbono', 0.14, 0.55, 'porcentaje');



--dispositivo 


prompt Insertando en dispositivo 
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (1, '7387121938142027A');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (2, '8387121938142027A');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (3, '9387121938142027A'); 
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '6387121938142027A');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3548482183200859A');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3576555456023648H');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3575088583520071R');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3580809995940877Y');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '5602217169982684F');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '201979955979119UU');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3539251754586827O');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '6771077586514830I');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '337941581658589HP');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3546213593228012Q');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '374622689254422SD');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '30100696868258ERT');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '366091432301064ET');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '561067905837420R2');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '5602237181793877W');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '3587349672015902Q');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '5002353818340325T');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '5100145567426003R');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '4175007860793914F');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '51001718917A3962A');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '354Q823999083942B');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '5893058630261499C');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '357491503968307D1');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '491727102028927WQ');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '6022299253651946Q');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '6767822586455240A');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, 'Q560224768055310P');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '0222347911464185L');
insert into DISPOSITIVO (DISPOSITIVO_ID, NUM_SERIE) values (dispositivo_seq.nextval, '5038254747951340P');


--propietario 

prompt Insertando en propietario

insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (1, '7304321927412', null, 'Hilliary', 'Orehead', 'Veare', '1', 'hveare01@newsvine.com');
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (2, '8304321927412', null, 'Hilliary', 'Orehead', 'Veare', '1', 'hveare02@newsvine.com');
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (3, '9304321927412', null, 'Hilliary', 'Orehead', 'Veare', '1', 'hveare03@newsvine.com');

--1001
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '6304321927412', null, 'Hilliary', 'Orehead', 'Veare', '1', 'hveare0@newsvine.com');
--1002
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno,  permiso_licencia, email) values (propietario_seq.nextval, '4911750573253', null, 'Avictor', 'Kobpal', 'Farnes', 'P', 'afarnes1@si.edu');
--1003
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '3547601117226', '5893787963239251581', 'Billi', 'Duiguid', 'Roseaman', 'P', 'broseman2@answers.com');
--1004
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '5602257337049', '337941189797326', 'Skippie', 'Delouch', 'Adame', 'P', 'sadame3@jiathis.com');
--1005
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '5100131348273', '3529805903321519', 'Justin', 'Bridgeman', 'Basnett', 'P', 'jbasnett4@go.com');
--1006
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '3569857571292', '4703222399717513', 'Susanetta', 'Roizn', 'de Clerk', 'P', 'sdeclerk5@booking.com');
--1007
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '7087851991134', '374283300144169', 'Ricca', 'Monsey', 'Keddle', 'P', 'rkeddle6@reverbnation.com');
--1008
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '5108758648170', null, 'Jacob', 'Uttley', 'Hegel', 'P','jhegel7@sun.com');
--1009
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '8359144069488', '6390117810848702', 'Milt', 'Sutherley', 'Rothery', 'P', 'mrothery8@zimbio.com');
--1010
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '1488273454940', null, 'Friedrich', 'Fleury', 'Pughe', 'P', 'fpughe9@yelp.com');
--1011
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '1401551480897', null, 'Kippie', 'Tether', 'Yarwood', 'P', 'kyarwooda@cafepress.com');
--1012
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '5602235395770', '5602224332901294', 'Lezley', 'Macken', 'Gorringe', 'P', 'lgorringeb@cisco.com');
--1013
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '0515595065450', null, 'Shurlocke', 'Rannigan', 'Dupey', 'P', 'sdupeyc@weather.com');
--1014
insert into propietario (propietario_id, rfc, curp, nombre, ap_paterno, ap_materno, permiso_licencia, email) values (propietario_seq.nextval, '3742881714377', '3583261033595858', 'Flossie', 'Reavey', 'Seedull', 'P', 'seduld@arstecnica.com');


--auto

prompt Insertando en auto
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (1, '54-83-5618', 1994, 1,0,0, 'Space', 1, 1, 'RE', 'BMW');
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (2, '568-83-5618', 1994, 1,0,0, 'Space', 2, 2, 'AI', 'BMW');
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (3, '568-92-5618', 1994, 1,0,0, 'Space', 3, 3, 'VP', 'BMW');

--1001
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '545-48-2715', 2002,1,0,0,  'Outback', 1002, 1005, 'RE', 'NIS');
--1002
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '157-54-9877', 1997, 0,1,0, 'Galant', 1003, 1005, 'RE', 'AUD');
--1003
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '534-83-5617', 1994, 0,0,1, 'Space', 1004, 1006, 'RE', 'BMW');
--1004
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '337-15-0073', 2008, 1,0,0, 'Female', 1005, 1007, 'RE', 'CHE');
--1005
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '607-66-0594', 2002,0,1,1, 'Polygender', 1006, 1008, 'LC', 'FER');
--1006
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '642-91-3447', 2011, 1,0,0, 'Bigender', 1007,1009, 'LC', 'FOR');
--1007
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '708-58-6330', 2003,1,0,0, 'Ranger', 1008,1009, 'LC', 'HON');
--1008
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '562-38-0370', 2009, 0,0,1, 'BYR', 1009, 1010, 'VP', 'KIA');
--1009
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '810-14-4846', 2007, 0,1,0, 'Caravan', 1010, 1011, 'VP', 'NIS');
--1010
insert into auto (auto_id, num_serie, anio, es_transp_publico, es_de_carga, es_particular, modelo, dispositivo_id, propietario_id, status_auto_id, marca_id) values (auto_seq.nextval, '218-51-50110021', 1996, 1,0,0, 'Agender', 1020,1013,'VP', 'AUD');


--Transporte_público


prompt Insertando en auto_transporte_publico
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(1, 10, 15, 'C');
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(2, 15, 15, 'B');
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(3, 16, 20, 'A');

insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(1001, 10, 15, 'C');
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(1004, 5, 10, 'C');
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(1006, 4, 0, 'B');
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(1007, 2, 0, 'A');
insert into transporte_publico(auto_id, num_p_sentados, num_p_parados, lic_transporte_id)values(1010, 5, 5, 'A');

--de_carga 

prompt Insertando en auto_de_carga 
insert into de_carga(auto_id, capacidad, capacidad_m3, num_remolques )values(1002, 2, 23,2);
insert into de_carga(auto_id, capacidad, capacidad_m3, num_remolques )values(1005, 1, 12, 1);
insert into de_carga(auto_id, capacidad, capacidad_m3, num_remolques )values(1009, 4, 22,3);


--particular
 

prompt Insertando en auto_particular
insert into particular(auto_id, num_bolsas_aire, frenos_abs, tipo_transmision) values(1008, 2, 1, 'A');
insert into particular(auto_id, num_bolsas_aire, frenos_abs, tipo_transmision) values(1003, 4, 1, 'M');
insert into particular(auto_id, num_bolsas_aire, frenos_abs, tipo_transmision)values(1005, 1, 0, 'A');



--Historico_status_auto

prompt Insertando en historico_status_auto
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '04/06/2014', 'dd/mm/yyyy'), 1001, 'RE');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '04/08/2014', 'dd/mm/yyyy'), 1001, 'LC');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '03/06/2014', 'dd/mm/yyyy'), 1002, 'RE');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '04/08/2014', 'dd/mm/yyyy'), 1002, 'VP');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '14/10/2014', 'dd/mm/yyyy'), 1002, 'RE');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '04/12/2014', 'dd/mm/yyyy'), 1003, 'RE');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '04/01/2015', 'dd/mm/yyyy'), 1004, 'AI');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '10/03/2015', 'dd/mm/yyyy'), 1005, 'LC');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '13/05/2015', 'dd/mm/yyyy'), 1005, 'AI');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '13/07/2015', 'dd/mm/yyyy'), 1005, 'VP');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '20/09/2016', 'dd/mm/yyyy'), 1006, 'RE');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '13/10/2016', 'dd/mm/yyyy'), 1007, 'AI');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '14/11/2016', 'dd/mm/yyyy'), 1008, 'AI');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '14/12/2016', 'dd/mm/yyyy'), 1008, 'LC');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '01/12/2017', 'dd/mm/yyyy'), 1009, 'VP');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '14/11/2016', 'dd/mm/yyyy'), 1010, 'AI');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '14/12/2016', 'dd/mm/yyyy'), 1010, 'VP');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '04/12/2018', 'dd/mm/yyyy'), 1010, 'RE');
insert into historico_status_auto(hist_status_auto_id, fecha, auto_id, status_auto_id) values(hist_status_auto_seq.nextval, to_date( '14/11/2019', 'dd/mm/yyyy'), 1010, 'LC');



--historico_auto_propietario


prompt Insertando en historico_auto_propietario

insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/01/2013', 'dd/mm/yyyy'), to_date('03/01/2014', 'dd/mm/yyyy'), 1001, 1001);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/10/2013', 'dd/mm/yyyy'), to_date('03/11/2014', 'dd/mm/yyyy'), 1002, 1001);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/01/2010', 'dd/mm/yyyy'), to_date('03/01/2020', 'dd/mm/yyyy'), 1003, 1002);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/05/2017', 'dd/mm/yyyy'), to_date('03/01/2018', 'dd/mm/yyyy'), 1004, 1003);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/01/2018', 'dd/mm/yyyy'), to_date('03/01/2019', 'dd/mm/yyyy'), 1005, 1003);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/07/2014', 'dd/mm/yyyy'), to_date('03/11/2015', 'dd/mm/yyyy'), 1006, 1004);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/10/2019', 'dd/mm/yyyy'), to_date('03/02/2020', 'dd/mm/yyyy'), 1007, 1005);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/01/2014', 'dd/mm/yyyy'), to_date('03/01/2015', 'dd/mm/yyyy'), 1008, 1006);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/01/2018', 'dd/mm/yyyy'), to_date('03/01/2020', 'dd/mm/yyyy'), 1008, 1007);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('11/11/2017', 'dd/mm/yyyy'), to_date('03/01/2019', 'dd/mm/yyyy'), 1009, 1008);
insert into historico_auto_propietario (hist_auto_id, fecha_inicio, fecha_fin, auto_id, propietario_id) values (hist_status_auto_prop_seq.nextval, to_date('03/07/2015', 'dd/mm/yyyy'), to_date('03/08/2017', 'dd/mm/yyyy'), 1010, 1009);




--placa


prompt Insertando en placa

insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (1, '37808-120', to_date('03/01/2013', 'dd/mm/yyyy') , 'A', 1, 'CDMX');
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (2, '37808-121', to_date('04/10/2013', 'dd/mm/yyyy') , 'A', 2, 'CDMX');
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (3, '37808-122', to_date('30/01/2013', 'dd/mm/yyyy') , 'A', null, 'CDMX');

--2500
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '37808-168', to_date('03/01/2013', 'dd/mm/yyyy') , 'A', 1001, 'ZAC');
--2501
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '0615-1546', to_date('01/08/2020', 'dd/mm/yyyy'), 'A', 1002, 'CHI');
--2502
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '50964-333', to_date('10/12/2020', 'dd/mm/yyyy'), 'A', 1003, 'MCH');
--2503
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '50964-120', to_date('01/12/2017', 'dd/mm/yyyy'), 'A', 1004, 'OAX');
--2504
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '49348-194', to_date('02/11/2014', 'dd/mm/yyyy'), 'A', 1005, 'VER');
--2505
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '0869-0063', to_date('12/03/2016', 'dd/mm/yyyy'), 'A', 'ZAC');
--2506
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '54569-0303', to_date('08/10/2020', 'dd/mm/yyyy'), 'A', 'VER');
--2507
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '68745-1020',  to_date('10/10/2016', 'dd/mm/yyyy'),'A', 1006, 'JAL');
--2508
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '68987-008', to_date('10/12/2020', 'dd/mm/yyyy'), 'A', 'QR');
--2508
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '59262-354', to_date('07/06/2011', 'dd/mm/yyyy'),'A', 1007, 'ESM');
--2509
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '49348-170', to_date('06/06/2016', 'dd/mm/yyyy'), 'A', 1008, 'DUR');
--2510
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '24451-008', to_date('07/07/2015', 'dd/mm/yyyy'), 'A', 1009, 'ESM');
--2511
insert into placa (placa_id, num_placa, fecha_asignacion, status, auto_id, entidad_id) values (placa_seq.nextval, '37012-523', to_date('03/07/2015', 'dd/mm/yyyy'), 'A', 1010, 'COL');
--2512
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '43857-0203', to_date('10/04/2015', 'dd/mm/yyyy'), 'A', 'SIN');
--2513
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '42254-212', to_date('01/02/2015', 'dd/mm/yyyy'), 'A', 'JAL');
--2514
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '0781-1496', to_date( '07/04/2014', 'dd/mm/yyyy'), 'A', 'COL');
--2515
insert into placa (placa_id, num_placa, fecha_asignacion, status, entidad_id) values (placa_seq.nextval, '36987-1278', to_date( '04/06/2014', 'dd/mm/yyyy'), 'A', 'DUR');




--licencia


prompt Insertando en licencia
--2000
insert into licencia(licencia_id, num_licencia, foto, firma, indice_izq, indice_der, fecha_inicio, fecha_fin, tipo_auto, propietario_id)values(licencia_seq.nextval, '43A-86-1', empty_blob(), empty_blob(), empty_blob(), empty_blob(),to_date('03/01/2013', 'dd/mm/yyyy'), to_date('03/01/2014', 'dd/mm/yyyy'), 'T', 1001 );
--2001
insert into licencia(licencia_id, num_licencia, foto, firma, indice_izq, indice_der, fecha_inicio, fecha_fin, tipo_auto, propietario_id, licencia_anterior_id )values(licencia_seq.nextval, '557-27-4', empty_blob(), empty_blob(), empty_blob(), empty_blob(),to_date('03/02/2014', 'dd/mm/yyyy'), to_date('03/01/2017', 'dd/mm/yyyy'), 'T', 1001,2000  );
--2002
insert into licencia(licencia_id, num_licencia, foto, firma, indice_izq, indice_der, fecha_inicio, fecha_fin, tipo_auto, propietario_id)values(licencia_seq.nextval, '764-77-4', empty_blob(), empty_blob(), empty_blob(), empty_blob(),to_date('03/01/2013', 'dd/mm/yyyy'), to_date('03/01/2017', 'dd/mm/yyyy'), 'P', 1002 );
--2003
insert into licencia(licencia_id, num_licencia, foto, firma, indice_izq, indice_der, fecha_inicio, fecha_fin, tipo_auto, propietario_id )values(licencia_seq.nextval, '549-96-3', empty_blob(), empty_blob(), empty_blob(), empty_blob(),to_date('03/02/2014', 'dd/mm/yyyy'), to_date('03/01/2017', 'dd/mm/yyyy'), 'C', 1003  );



--falta


prompt Insertando en falta
insert into FALTA (propietario_id, NUM_FALTA, FECHA, PUNTOS_NEGATIVOS, DOCUMENTO_PDF, EVIDENCIA, descripcion_falta) values (1001,1, to_date('21/05/2019', 'dd/mm/yyyy'), 201, empty_blob(), 'evidencia', 'descripcion');
insert into FALTA (propietario_id, NUM_FALTA, FECHA, PUNTOS_NEGATIVOS, DOCUMENTO_PDF, EVIDENCIA, descripcion_falta) values (1002,1, to_date('06/01/2020', 'dd/mm/yyyy') , 18,  empty_blob(), 'evidencia', 'descripcion');
insert into FALTA (propietario_id, NUM_FALTA, FECHA, PUNTOS_NEGATIVOS, DOCUMENTO_PDF, EVIDENCIA, descripcion_falta) values (1002,2,to_date('19/12/2019', 'dd/mm/yyyy') , 93,  empty_blob(), 'evidencia', 'descripcion');
insert into FALTA (propietario_id, NUM_FALTA, FECHA, PUNTOS_NEGATIVOS, DOCUMENTO_PDF, EVIDENCIA, descripcion_falta) values (1003,1,to_date('13/05/2019', 'dd/mm/yyyy') , 124, empty_blob(), 'evidencia', 'descripcion');
insert into FALTA (propietario_id, NUM_FALTA, FECHA, PUNTOS_NEGATIVOS, DOCUMENTO_PDF, EVIDENCIA, descripcion_falta) values (1004,1, to_date('28/07/2019', 'dd/mm/yyyy'), 93,  empty_blob(), 'evidencia', 'descripcion');
insert into FALTA (propietario_id, NUM_FALTA, FECHA, PUNTOS_NEGATIVOS, DOCUMENTO_PDF, EVIDENCIA, descripcion_falta) values (1005,1, to_date('20/05/2019', 'dd/mm/yyyy'), 220, empty_blob(), 'evidencia', 'descripcion');


--reporte_emisiones

prompt Insertando en reporte emisiones

insert into reporte_emisiones(rep_emisiones_id, fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/10/2020', 'dd/mm/yyyy'), 1000, 'HC', 0.7, 'N');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/10/2020', 'dd/mm/yyyy'), 1000, 'CO', 0.9, 'N');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/10/2020', 'dd/mm/yyyy'), 1000, 'NOX', 0.4, 'A');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/10/2020', 'dd/mm/yyyy'), 1000, 'CO2', 0.5, 'A');
insert into reporte_emisiones(rep_emisiones_id, fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1002, 'HC', 0.4, 'A');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1002, 'CO', 0.5, 'A');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1002, 'NOX', 0.5, 'N');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1002, 'CO2', 0.5, 'A');
insert into reporte_emisiones(rep_emisiones_id, fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1020, 'HC', 0.4, 'A');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1020, 'CO', 0.5, 'A');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1020, 'NOX', 0.5, 'N');
insert into reporte_emisiones(rep_emisiones_id , fecha, dispositivo_id, emision_id, valor, aprobado )values(rep_emisiones_dispo_seq.nextval, to_date('08/11/2020', 'dd/mm/yyyy'), 1020, 'CO2', 0.5, 'A');



--notificacion


prompt Insertando en notificacion

insert into notificacion (PROPIETARIO_ID, NUM_NOTIFICACION, FECHA, REP_EMISIONES_ID) values (1001, 1, to_date('03/06/2019', 'dd/mm/yyyy'), 100);
insert into notificacion (PROPIETARIO_ID, NUM_NOTIFICACION, FECHA, REP_EMISIONES_ID) values (1001, 2, to_date('24/10/2019', 'dd/mm/yyyy') , 101);
insert into notificacion (PROPIETARIO_ID, NUM_NOTIFICACION, FECHA, REP_EMISIONES_ID) values (1002, 1, to_date( '04/12/2019', 'dd/mm/yyyy'), 106);




--verificacion

prompt Insertando en verificacion

--100
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), '8189376658117', 'MPKZ7', 1001);
--101
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('04/10/2019', 'dd/mm/yyyy'), '8264758603666', 'UXKQ1', 1002);
--102
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('10/02/2019', 'dd/mm/yyyy'),  '8419750486400', 'OSEB7', 1001);
--103
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('18/08/2019', 'dd/mm/yyyy'),  '9868849358744', 'KFKL2', 1003);
--104
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval,to_date('31/01/2020', 'dd/mm/yyyy'), '6019685098187', 'JUTG4', 1004);
--105
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('24/06/2019', 'dd/mm/yyyy'), '6383580518093', 'FPYY0', 1004);
--106
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval,to_date('04/07/2019', 'dd/mm/yyyy'),  '3662954484152', 'IKRK5', 1005);
--107
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('12/04/2019', 'dd/mm/yyyy'), '2609698507618', 'ZGBO0', 1006);
--108
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('15/07/2019', 'dd/mm/yyyy'), '8860861918730', 'YCFC0', 1006);
--109
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('21/09/2019','dd/mm/yyyy'), '3446383200854', 'ZISR6', 1007);
--110
insert into VERIFICACION (VERIFICACION_ID, FECHA, FOLIO, clave_verificentro, AUTO_ID) values (verificacion_seq.nextval, to_date('28/01/2020', 'dd/mm/yyyy'), '2131072675613', 'ZDFO7', 1001);



--reporte_verificentro

prompt Insertando en reporte_verificentro

--3000
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'HC', 0.4, 'A', 100 ); 
--3001
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'CO', 0.4, 'A', 100 ); 
--3002
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'NOX', 0.5, 'N', 100 ); 
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'CO2', 0.2, 'A', 100 ); 
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'HC', 0.4, 'A', 101 ); 
--3001
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'CO', 0.4, 'A', 101 ); 
--3002
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'NOX', 0.5, 'N', 101 ); 
insert into reporte_verificentro(rep_emisiones_id, fecha, emision_id, valor, aprobado,verificacion_id )values(rep_verificentro_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 'CO2', 0.6, 'N', 101 ); 



commit;

set serveroutput on 

begin
  dbms_output.put_line('Realizando inserción en tabla temporal');
  dbms_output.put_line('Auto_id: ' || 1010);
  dbms_output.put_line('Propietario_id: ' || 1005);

  dbms_output.put_line('Emisiones para Hidrocarburos: ' || 300);
  insert into auto_verificentro_temp (fecha, auto_id, propietario_id,    emision_id, valor)
  values (sysdate, 1, 1, 'HC', 300 );
  
  dbms_output.put_line('Emisiones para Monoxido de Carbono: ' || 0.1);
  insert into auto_verificentro_temp (fecha, auto_id, propietario_id,   emision_id, valor)
  values (sysdate, 1, 1, 'CO', 0.1 );

  dbms_output.put_line('Emisiones para Óxido de Nitrógeno: ' || 
  0.3);
  insert into auto_verificentro_temp (fecha, auto_id, propietario_id,   emision_id, valor)
  values (sysdate, 1, 1, 'NOX', 0.3 );
  
  dbms_output.put_line('Emisiones para Dioxido de Carbono: ' || 
  0.5);
  insert into auto_verificentro_temp (fecha, auto_id, propietario_id,   emision_id, valor)
  values (sysdate, 1, 1, 'CO2', 0.5 );

  dbms_output.put_line('Generando Reporte del  auto_id: ' || 1010  );

end;
/