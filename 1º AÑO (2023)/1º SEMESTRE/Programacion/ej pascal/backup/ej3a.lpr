program ej3b;
var
  i,j,cant_ciudades,cant_habitantes,tot_hab,tot_ciudades:integer;
  prom_hab_partido,minimo_promedio,maximo_promedio:real;
begin
  tot_hab:=0;
  tot_ciudades:=0;
  minimo_promedio:=9999999999
  maximo_promedio:=-1
  for i:= 1 to 135 do
    begin
    writeln('decime la cantidad de ciudades');
      readln(cant_ciudades);
      tot_ciudades:=tot_ciudades+cant_ciudades;
      for j:= 1 to cant_ciudades do
        begin
        writeln('decime la cantidad de habitantes por ciudad');
          readln(cant_habitantes);
          tot_hab:=tot_hab+cant_habitantes;
        end;
      prom_hab_partido:=tot_hab/tot_ciudades;
      if prom_hab_partido < minimo_promedio then
        begin
          minimo_promedio:=prom_hab_partido;
        end;
      if prom_hab_partido < maximo_promedio then
        begin
          maximo_promedio:=prom_hab_partido;
        end;
      tot_hab:=0;
    end;
  prom_hab_partido:=tot_hab/tot_ciudades;
  writeln('la cantidad de habitantes promedio por partido es: ',prom_hab_partido);
  readln;
end.

