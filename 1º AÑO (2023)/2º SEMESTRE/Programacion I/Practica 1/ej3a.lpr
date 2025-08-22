program ej3a;
var partidos,cantCiudades,hab,totHab,ciudades:integer;
    prom:real;
begin
  for partidos:= 1 to 135 do begin
    totHab:=0;
    writeln('La cantidad de ciudades del partido ',partidos,' es: ');
    readln(cantCiudades);
    for ciudades:=1 to cantCiudades do begin
      writeln('La cantidad de habitantes de la ciudad ',ciudades,' es: ');
      readln(hab);
      totHab:=totHab+hab;
    end;
    prom:=totHab/cantCiudades;
    writeln('La cantidad promedio de habitantes del partido: ',partidos,' es: ',prom:1:2);
  end;
end.
