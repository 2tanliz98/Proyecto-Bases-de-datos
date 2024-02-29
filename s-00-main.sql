--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Script que manda a llamar a todos los demás scripts

--whenever sqlerror exit rollback; 

--Carga inicial.
@s-01-usuarios.sql
@s-02-entidades.sql		
@s-03-tablas-temporales.sql
@s-04-tablas-externas.sql
@s-05-secuencias.sql
@s-06-indices.sql
@s-07-sinonimos.sql
@s-08-vistas.sql
@s-09-carga-inicial.sql


@s-10-consultas.sql

--funciones
@s-15-fx-count-puntos.sql
@s-15-fx-crea-num-serie.sql
@s-15-fx-num-noti.sql


--Triggers
@s-11-tr-notificacion-trigger.sql
@s-11-tr-placa-trigger.sql
@s-11-tr-status-auto-trigger.sql


--Procedimientos
@s-13-p-crea-falta-pdf.sql
@s-13-p-reporte.sql


--Objetos LOBs
@s-17-lob-foto-licencia.sql


--Pruebas triggers
@s-12-tr-notificacion-trigger-prueba.sql
@s-12-tr-placa-trigger-prueba.sql
@s-12-tr-status-auto-trigger-prueba.sql

--Pruebas procedimientos
@s-14-p-crea-falta-pdf-prueba.sql
@s-14-p-reporte-prueba.sql

--Pruebas objetos LOBs
@s-18-lob-foto-licencia-prueba.sql

--Validcación proyecto final
@resultados-proyecto-final.sql