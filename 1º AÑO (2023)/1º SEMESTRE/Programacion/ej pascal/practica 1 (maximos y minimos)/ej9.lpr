program ej9;

const
  fin  = 756;

var
  alumno:integer;
  cant_materias:integer;
  nota:integer;
  max_nota:integer;
  tot_nota:integer;
  promedio:real;
  max_promedio:real;
  i:integer;

begin
  writeln('Ingrese el numero del alumno: ');
  readln(alumno);
  while alumno <> fin do
  begin
    tot_nota:=0;
    max_nota:=-1;
    max_promedio:=-1;
    writeln('Ingrese la cantidad de materias aprobadas: ');
    readln(cant_materias);
    for i:=1 to cant_materias do
    begin
      writeln('Ingrese la nota obtenida de la materia ',i,': ');
      readln(nota);
      tot_nota:=tot_nota+nota;
      if nota > max_nota then
      max_nota:=nota;
      promedio:=tot_nota/cant_materias;
      if promedio > max_promedio then
      max_promedio:=promedio;
    end;
    writeln('La nota maxima obtenida por el alumno numero',alumno,' es: ',max_nota);
    writeln('El alumno con el maximo promedio de la carrera es: ',max_promedio);
    writeln('Ingrese el numero del alumno: ');
    readln(alumno);
  end;
end.
