--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. Prueba de archivos blob

set serveroutput on
begin 
    p_fotos_licencia(2000,2);
end;
/

col foto format a20
select licencia_id, foto, dbms_lob.getlength(foto) as longitud_imagen
from licencia;