program ej3a;
var
  i,j,cant_ciudades,cant_habitantes,hab_partido:integer;
  prom_hab_partido:real;
begin
  hab_partido:=0;
  for i:= 1 to 135 do
    begin
    writeln('decime la cantidad de ciudades');
      readln(cant_ciudades);
      for j:= 1 to cant_ciudades do
        begin
        writeln('decime la cantidad de habitantes por ciudad');
          readln(cant_habitantes);
          hab_partido:=hab_partido+cant_habitantes;
        end;
    end;
  prom_hab_partido:=hab_partido/cant_ciudades;
  writeln('la cantidad de habitantes promedio por partido es: ',cant_promedio_partido)
  readln;
end.

