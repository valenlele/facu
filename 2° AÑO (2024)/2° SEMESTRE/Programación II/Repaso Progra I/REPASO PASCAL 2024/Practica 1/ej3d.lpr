program ej3d;

const
  cantPartidos=3;

var
  partido,cantCiudades,cantHabitantes,totHab:integer;
  promHabPartido:real;

begin
  for partido:=1 to cantPartidos do begin
    totHab:=0;
    cantCiudades:=1;
    write('Ingrese la cantidad de habitantes del partido ',partido,' ciudad ',cantCiudades,': ');
    readln(cantHabitantes);
    while (cantHabitantes>0) do begin
      totHab:=totHab+cantHabitantes;
      cantCiudades:=cantCiudades+1;
      write('Ingrese la cantidad de habitantes del partido ',partido,' ciudad ',cantCiudades,': ');
      readln(cantHabitantes);
    end;
    promHabPartido:=totHab/cantCiudades;
    writeln('El promedio de habitantes por partido del partido ',partido,' es: ',promHabPartido:2:2);
  end;
  readln;
end.
