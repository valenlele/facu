program ej4;

var
  i:integer;
  j:integer;
  cod:integer;
  anios:integer;
  alumnos:integer;
  tot_alumnos:integer;
  min:real;
  min_carrera:integer;
  promedio:real;

begin
  tot_alumnos:=0;
  min:=9999;
  for i:=1 to 10 do
  begin
    writeln('Ingrese el codigo de la carrera: ');
    readln(cod);
    writeln('Ingrese la cantidad de anios de duracion: ');
    readln(anios);
    for j:=1 to anios do
    begin
      writeln('Ingrese la cantidad de alumnos que cursan en el anio ',j,': ');
      readln(alumnos);
      tot_alumnos:=tot_alumnos+alumnos;
    end;
    promedio:=tot_alumnos/anios;
    if promedio < min then
    begin
      min:=promedio;
      min_carrera:=i;
    end;
  end;
  writeln('La carrera con menor promedio de alumnos por año es: ',min_carrera);
  readln;
end.
