program ej4;
var carreras,cod,minCod,cantAnios,cantAlumnos,totAlumnos,anios:integer;
    prom,minProm:real;
begin
  minProm:=9999;
  for carreras:=1 to 3 do begin
    totAlumnos:=0;
    writeln('Ingrese el codigo de la carrera ',carreras);
    readln(cod);
    writeln('Ingrese la cantidad de anios de duracion de la carrera ',cod);
    readln(cantAnios);
    for anios:=1 to cantAnios do begin
      writeln('La cantidad de alumnos que cursa la carrera numero ',cod,' en el anio ',anios,' es: ');
      readln(cantAlumnos);
      totALumnos:=totALumnos+cantAlumnos;
    end;
    prom:=totAlumnos/cantAnios;
    if (prom < minProm) then begin
      minProm:=prom;
      minCod:=cod;
    end;
  end;
  writeln('La carrera con el menor promedio de alumnos es la: ',minCod);
  readln;
end.
