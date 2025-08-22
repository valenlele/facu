program ej3b;
var partidos,cantCiudades,hab,totHab,ciudades:integer;
    prom,max,min:real;
begin
  max:=-1;
  min:=9999;
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
    if (prom > max) then max:=prom
    else if (prom < min) then min:=prom;
  end;
  writeln('La cantidad promedio maxima del partido ',partidos,' es: ',max:1:2);
  writeln('La cantidad promedio minima del partido ',partidos,' es: ',min:1:2);
  readln;
end.
