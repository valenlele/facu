program ej7a;

procedure promedio(edad_total:integer;cant_personas:integer);
var
  promedio_edad:real;
begin
  promedio_edad:=edad_total/cant_personas;
  writeln('El promedio de edad es: ',promedio_edad:0:2);
  readln;
end;

var
  i,edad,edad_total:integer;

begin
  edad_total:=0;
  for i:=1 to 25 do
    begin
       writeln('La edad de la persona numero ',i,' es: ');
         readln(edad);
       edad_total:=edad_total+edad;
    end;
  promedio(edad_total,25);
end.
