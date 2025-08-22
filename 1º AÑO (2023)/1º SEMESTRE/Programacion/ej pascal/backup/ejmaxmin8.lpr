program maxmin9;

var
  i,nAlumno,materias,j,nota,max_nota,max_nAlumno:integer;
  promedio,max_promedio:real;

begin
  max_nota:=-1;
  max_promedio:=-1;
  max_nAlumno:=-1;
  for i:=1 to 756 do
    begin
      writeln('Ingrese el codigo del alumno:');
        read(nAlumno);
      writeln('Ingrese la cantidad de materias aprobadas:');
        read(materias);
    for j:=1 to materias do
      begin
        writeln('Ingrese la nota de la materia:');
          readln(nota);
        if nota > max_nota then
          max_nota:=nota;
        promedio:=materias/nota;
        if promedio > max_promedio then
          max_promedio:=promedio;
          max_nAlumno:=nAlumno;
      end;
    writeln('La maxima nota obtenida del alumno es: ',max_nota);
    max_nota:=-1;
    end;
  writeln('El numero del alumno que obtuvo el mayor promedio de la carrera es: ',max_nAlumno);
  readln;
end.
