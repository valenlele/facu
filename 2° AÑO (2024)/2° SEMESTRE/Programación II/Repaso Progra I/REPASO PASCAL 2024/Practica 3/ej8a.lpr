program ej8a;

const
  cantPersonas=5;

function edadPromedio(totEdad,cantPersonas:integer):real;
begin
  edadPromedio:=totEdad/cantPersonas;
end;

var
  i,edad,totEdad:integer;

begin
  totEdad:=0;
  for i:=1 to cantPersonas do begin
    write('Ingrese la edad de la persona: ');
    readln(edad);
    totEdad:=totEdad+edad;
  end;
  write('La edad promedio de las personas es: ',edadPromedio(totEdad,cantPersonas):2:2);
  readln;
end.
