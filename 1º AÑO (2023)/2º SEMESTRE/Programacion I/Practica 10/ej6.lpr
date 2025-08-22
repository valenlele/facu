program ej6;

const
  maxCursos=10;
  fin='zzz';

type
  rangoCurso=1..maxCursos;
  graduado=record
    dni,edad:integer;
    ap,nom:string;
    cod:rangoCurso;
  end;
  lista=^nodo;
  nodo=record
    datos:graduado;
    sig:lista;
  end;
  vecInsc=array[rangoCurso] of lista;

  vecCupos=array[rangoCurso] of integer;

procedure inicializarListas(var vi:vecInsc);
var
  i:rangoCurso;
begin
  for i:=1 to maxCursos do vi[i]:=nil;
end;

procedure cargarCuposMaximos(var vc:vecCupos);
var
  i:rangoCurso;
begin
  writeln('INGRESE LOS CUPOS MAXIMOS PARA CADA CURSO: ');
  for i:=1 to maxCursos do begin
    write('CURSO ',i,': ');
    readln(vc[i]);
  end;
end;

procedure leerInfoGrad(var g:graduado);
begin
  with g do begin
    writeln('INGRESE INFORMACION DE UN GRADUADO: ');
    write('Apellido: ');
    readln(ap);
    if (ap<>fin) then begin
      write('Nombre: ');
      readln(nom);
      write('DNI: ');
      readln(dni);
      write('Edad: ');
      readln(edad);
      write('Codigo de curso al que desea inscribirse: ');
      readln(cod);
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var pri,ult:lista; g:graduado);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=g;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cursosConCupo(vc:vecCupos);
var
  i:rangoCurso;
begin
  for i:=1 to maxCursos do if (vc[i]>0) then writeln('El curso ',i,' no completo su cupo maximo');
end;

procedure informar(vc:vecCupos; curso2_30_35_anios:integer);
begin
  cursosConCupo(vc);
  writeln('La cantidad de inscriptos al curso con codigo 2 que tienen entre 30 y 35 anios es: ',curso2_30_35_anios);
end;

procedure inscripcion(var vi:vecInsc; var vc:vecCupos; var ult:lista);
var
  g:graduado;
  curso2_30_35_anios:integer;
begin
  leerInfoGrad(g);
  curso2_30_35_anios:=0;
  while (g.ap<>fin) do begin
    if (vc[g.cod]>0) then begin
      insertarFinal(vi[g.cod],ult,g);
      vc[g.cod]:=vc[g.cod]-1;
    end
    else writeln('El curso con codigo ',g.cod,' no tiene mas cupos disponibles');
    if (g.cod=2) and ((g.edad>=30) and (g.edad<=35)) then curso2_30_35_anios:=curso2_30_35_anios+1;
    leerInfoGrad(g);
  end;
  informar(vc,curso2_30_35_anios);
end;

procedure liberarMemoriaListas(var vi:vecInsc);
var
  i:rangoCurso;
  aux:lista;
begin
  for i:=1 to maxCursos do begin
    while (vi[i]<>nil) do begin
      aux:=vi[i];
      vi[i]:=vi[i]^.sig;
      dispose(aux);
    end;
  end;
end;

var
  vi:vecInsc;
  vc:vecCupos;
  ult:lista;

begin
  inicializarListas(vi);
  cargarCuposMaximos(vc);
  inscripcion(vi,vc,ult);
  liberarMemoriaListas(vi);
  readln;
end.
