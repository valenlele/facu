program ej3abc;

const
  cantPartidos=3;

var
  partido,cantCiudades,j,cantHabitantes,totHab,cant20000:integer;
  promHabPartido,max,min:real;

begin
  max:=-1;
  min:=9999;
  cant20000:=0;
  for partido:=1 to cantPartidos do begin
    totHab:=0;
    write('Ingrese el numero de ciudades del partido ',partido,': ');
    readln(cantCiudades);
    for j:=1 to cantCiudades do begin
      write('Ingrese la cantidad de habitantes de la ciudad ',j,' partido ',partido,': ');
      readln(cantHabitantes);
      totHab:=totHab+cantHabitantes;
    end;
    promHabPartido:=totHab/cantCiudades;
    writeln('El promedio de habitantes por partido es: ',promHabPartido:2:2);
    if (promHabPartido>max) then max:=promHabPartido;
    if (promHabPartido<min) then min:=promHabPartido;
    if (promHabPartido>20000) then cant20000:=cant20000+1;
  end;
  writeln('El mayor numero de habitantes promedio de los partidos es: ',max:2:2);
  writeln('El menor numero de habitantes promedio de los partidos es: ',min:2:2);
  write('El porcentaje de partidos cuyo valor promedio de habitanes supero los 20000 es: ',(cant2000*100)/cantPartidos:2:2);
  readln;
end.
