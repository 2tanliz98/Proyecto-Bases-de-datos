--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. 


set serveroutput on

begin
  -- parametros del procedimiento
  -- p_auto_id in number, p_verificacion_id in number 
  dbms_output.put_line('Registrando auto id = 1001 con número de verificación id= 100');
  comprobante_verificacion(1001,100);
rollback;
end;
/