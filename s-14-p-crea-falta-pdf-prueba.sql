--@Autor(es): Tania Lizeth Peñaloza Lugo y Lizeth Durán González
--@Fecha creación: 04/02/2021
--@Descripción: Proyecto Final. 


set serveroutput on

begin
  --parametros del procedimiento
  --p_propietario_id in number, p_num_falta in number, p_puntos_negativos in number, v_evidencia in varchar2,
  --v_descripcion_falta in varchar2, p_nombre_archivo in varchar2
  dbms_output.put_line('Registrando Falta 1 para propietario con id = 1');
  crea_falta_pdf(1,1,10,'evidencia','descripcion','1_1');
  crea_falta_pdf(2,2,10,'evidencia','descripcion','2_2');
rollback;
end;
/