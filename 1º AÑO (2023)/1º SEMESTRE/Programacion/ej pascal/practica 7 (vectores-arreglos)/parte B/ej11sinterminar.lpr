program ej11sinterminar;

const
  maxfil = 3;
  maxcol = 3;
  dimF = 3;

type
  rangof = 0..maxfil;
  rangoc = 0..maxcol;
  matriz = array [1..maxfil,1..maxcol] of integer;
  matrizA = array[1..maxfil,1..maxcol] of integer;
  vectorB = array[1..dimF] of integer;

var
  m:matriz;
  n:integer;
  i:integer;
  j:integer;
  dimFila:rangof;
  dimCol:rangoc;
  a:matrizA;
  b:vectorB;

procedure carga(var m:matriz; var dimFila:rangof; var dimCol:rangoc);
begin
  for i:=1 to maxfil do
  begin
    for j:=1 to maxcol do
    begin
      writeln('Ingrese el valor para la fila ',i,' columna ',j,': ');
      readln(m[i,j]);
      dimCol:=dimCol+1;
    end;
    dimFila:=dimFila+1;
  end;
end;

procedure eliminar_fila(var m:matriz; var dimFila:rangoF; dimCol:rangoc; n:integer);
var
  k:integer;
  l:integer;
begin
  if (n > 0) and (n <= dimFila) then
  begin
    for i:=n to dimFila-1 do
    begin
      for j:=1 to dimCol do
      m[i,j]:=m[i+1,j];
    end;
    dimFila:=dimFila-1;
  end;
end;

procedure leer_matriz(m:matriz; dimFila:rangof; dimCol:rangoc);
begin
  for i:=1 to dimFila do
  begin
    for j:=1 to dimCol do
    writeln(m[i,j]);
    writeln(' ');
  end;
end;

begin
  dimCol:=0;
  dimFila:=0;
  carga(m,dimFila,dimCol);
  writeln('Ingrese un numero de fila para eliminar de la matriz: ');
  readln(n);
  eliminar_fila(m,dimFila,dimCol,n);
  writeln('El resultado de la matriz es: ');
  leer_matriz(m,dimFila,dimCol);
  carga_matrizA(a,
  readln;
end.
