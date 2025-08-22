program ej3c;
var partidos,cantCiudades,hab,totHab,ciudades,cant20000:integer;
    prom,max,min,porc20000:real;
begin
  max:=-1;
  min:=9999;
  cant20000:=0;
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
    if (prom > 20000) then cant20000:=cant20000+1;
  end;
  writeln('La cantidad promedio maxima del partido ',partidos,' es: ',max:1:2);
  writeln('La cantidad promedio minima del partido ',partidos,' es: ',min:1:2);
  porc20000:=((cant20000*100)/135);
  writeln('El porcentaje de partidos con promedio de habitantes mayor a 20000 es: ',porc20000:1:2);
  readln;
end.
