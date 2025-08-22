program ej3d;
var partidos,cantCiudades,hab,totHab:integer;
    prom:real;
begin
  for partidos:= 1 to 135 do begin
    totHab:=0;
    cantCiudades:=1;
    writeln('Ingrese la cantidad de habitantes de la ciudad ',cantCiudades);
    readln(hab);
    while (hab > 0) do begin
      totHab:=totHab+hab;
      cantCiudades:=cantCiudades+1;
      writeln('Ingrese la cantidad de habitantes de la ciudad ',cantCiudades);
      readln(hab);
    end;
    prom:=totHab/cantCiudades;
    writeln('La cantidad promedio de habitantes del partido: ',partidos,' es: ',prom:1:2);
  end;
end.
