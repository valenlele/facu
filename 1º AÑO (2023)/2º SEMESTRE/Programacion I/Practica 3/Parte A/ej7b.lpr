program ej7b;
uses crt;
const
  max=25;
var
  prom:real;

procedure promedioEdad(var prom:real);
var
  edad,totEdad,i:integer;
begin
  totEdad:=0;
  for i:=1 to max do begin
    writeln('Ingrese la edad de la persona: ');
    read(edad);
    totEdad:=totEdad+edad;
  end;
  prom:=totEdad/max;
end;

begin
  prom:=0;
  promedioEdad(prom);
  writeln('El promedio de edad de las 25 personas es: ',prom:1:2);
  readkey;
end.
