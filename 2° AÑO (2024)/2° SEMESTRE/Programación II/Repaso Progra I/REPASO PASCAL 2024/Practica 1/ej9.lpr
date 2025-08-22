program ej9;

var
  numAlumno,cantMaterias,materias,nota,maxNotaAlumno,totNota,maxPromAlumnoNum:integer;
  promAlumno,maxPromAlumno:real;

begin
  maxPromAlumno:=-1;
  repeat
    maxNotaAlumno:=-1;
    totNota:=0;
    write('Ingrese el numero de alumno: ');
    readln(numAlumno);
    write('Ingrese la cantidad de materias aprobadas: ');
    readln(cantMaterias);
    for materias:=1 to cantMaterias do begin
      write('Ingrese la nota obtenida en la materia ',materias,': ');
      readln(nota);
      totNota:=totNota+nota;
      if (nota>maxNotaAlumno) then maxNotaAlumno:=nota;
    end;
    promAlumno:=totNota/cantMaterias;
    if (promAlumno>maxPromAlumno) then begin
      maxPromAlumno:=promAlumno;
      maxPromAlumnoNum:=numAlumno;
    end;
    writeln('La mayor nota conseguida por el alumno es: ',maxNotaAlumno);
  until (numAlumno=756);
  write('El numero del alumno con mayor promedio de toda la carrera es: ',maxPromAlumnoNum);
  readln;
end.
