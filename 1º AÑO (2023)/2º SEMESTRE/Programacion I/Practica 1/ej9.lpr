program ej9;
var nAlumno,materiasAp,materias,maxPromNum:integer;
    nota,maxNota,prom,maxProm,totNota:real;
begin
  maxProm:=-1;
  writeln('Ingrese el numero del alumno: ');
  readln(nAlumno);
  repeat
    maxNota:=-1;
    totNota:=0;
    writeln('Ingrese la cantidad de materias aprobadas del alumno ',nAlumno);
    readln(materiasAp);
    for materias:=1 to materiasAp do begin
      writeln('Ingrese la nota obtenida de la materia ',materias);
      readln(nota);
      totNota:=totNota+nota;
      if (nota > maxNota) then maxNota:=nota;
    end;
    prom:=totNota/materiasAp;
    if (prom > maxProm) then begin
      maxProm:=prom;
      maxPromNum:=nAlumno;
    end;
    writeln('La maxima nota obtenida por el alumno ',nAlumno,' es: ',maxNota:2:2);
    writeln('Ingrese el numero del alumno: ');
    readln(nAlumno);
  until nAlumno=756;
  writeln('El codigo del alumno con el maximo promedio es: ',maxPromNum);
  readln;
end.
