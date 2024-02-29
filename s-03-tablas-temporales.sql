--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Creación de tablas temporales

--Escenario: Cuando en un verificentro se toman los valores de emisiones de un auto, estos valores se ingresan a una tabla temporal antes de ser registrados a los reportes de emisiones.

prompt conectando con pd_proy_admin para crear tabla temporal.
connect pd_proy_admin/dupe

-- Eliminar si habia tabla temporal existente

drop table auto_verificentro_temp; 

prompt Reporte de prueba para emisiones del auto en el verificentro. 


create global temporary table auto_verificentro_temp (
  fecha date,
  auto_id number(10,0), 
  propietario_id number(10,0), 
  emision_id varchar2(3),
  valor number(10,4)
)on commit delete rows;

