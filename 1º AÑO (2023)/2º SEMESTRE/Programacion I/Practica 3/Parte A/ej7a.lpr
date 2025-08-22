program ej7a;
uses crt;
var
  cantPersonas:integer;

procedure promedioEdad(cantPersonas:integer);
var
  edad,totEdad,i:integer;
  prom:real;
begin
  totEdad:=0;
  prom:=0;
  for i:=1 to cantPersonas do begin
    writeln('Ingrese la edad de la persona: ');
    read(edad);
    totEdad:=totEdad+edad;
  end;
  prom:=totEdad/cantPersonas;
  writeln('El promedio de edad de las personas es: ',prom:1:2);
  readkey;
end;

begin
  writeln('Ingrese la cantidad de personas: ');
  readln(cantPersonas);
  promedioEdad(cantPersonas);
end.
