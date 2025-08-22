program ej5;

const
  maxfil = 50;
  maxcol = 50;

type
  matriz = array [1..maxfil , 1..maxcol] of integer;
  rangof = 0..maxfil;
  rangoc = 0..maxcol;

var
  m:matriz;
  dimfil:rangof;
  dimcol:rangoc;
  i:rangof;
  j:rangoc;

procedure cargar(var m:matriz; var dimfil:rangof; var dimcol:rangoc);
begin
  writeln('Ingrese la capacidad maxima para las filas: ');
  readln(dimfil);
  writeln('Ingrese la capacidad maxima para las columnas: ');
  readln(dimcol);
  for i:=1 to dimfil do
  begin
    for j:=1 to dimcol do
    begin
      writeln('Ingrese un valor para la matriz: ');
      read(m[i,j]);
    end;
  end;
end;

procedure imprimir_filas_pares(var m:matriz; var dimfil:rangof);
var
  fila:rangof;
begin
  fila:=2;
  while (fila <= dimfil) do
  begin
    for j:=1 to dimcol do
    begin
      writeln(m[fila,j]);
    end;
    fila:=fila+2;
  end;
end;

procedure imprimir_columnas_impares(var m:matriz; var dimcol:rangoc);
var
  columna:rangoc;
begin
  columna:=1;
  while (columna <= dimcol) do
  begin
    for i:=1 to dimfil do
    begin
      writeln(m[i,columna]);
    end;
    columna:=columna+2;
  end;
end;

procedure imprimir_diagonal_principal(var m:matriz; var dimfil:rangoc; var dimcol:rangof);
var
  fila:rangof;
  columna:rangoc;
begin
  fila:=1;
  columna:=1;
  while (fila <= dimfil) and (columna <= dimcol) do
  begin
    writeln(m[fila,columna]);
    fila:=fila+1;
    columna:=columna+1;
  end;
end;

begin
  dimfil:=0;
  dimcol:=0;
  cargar(m,dimfil,dimcol);
  imprimir_filas_pares(m,dimfil);
  imprimir_columnas_impares(m,dimcol);
  imprimir_diagonal_principal(m,dimfil,dimcol);
  readln;
end.
