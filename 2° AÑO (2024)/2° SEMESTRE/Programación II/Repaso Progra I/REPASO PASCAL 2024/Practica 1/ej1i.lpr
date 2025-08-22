program ej1i;

var
  edad:integer;
  sexo:char;

begin
  write('Ingrese la edad de la persona: ');
  readln(edad);
  write('Ingrese el sexo de la persona (m:masculino, f:femenino) : ');
  readln(sexo);
  if (sexo='m') and (edad<=60) then write('La cantidad de años que faltan para jubilarse son: ',60-edad);
  if (sexo='f') and (edad<=65) then write ('La cantidad de años que faltan para jubilarse son: ',65-edad);
  readln;
end.
