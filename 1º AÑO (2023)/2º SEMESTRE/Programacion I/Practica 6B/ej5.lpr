program ej5;

const
  maxFil=4;
  maxCol=4;

type
  rangoF=0..maxFil;
  rangoC=0..maxCol;
  matriz=array[1..maxFil,1..maxCol] of integer;

procedure cargarMatriz(var m:matriz; var dimLF:rangoF; var dimLC:rangoC);
var
  fil:rangoF;
  col:rangoC;
begin
  dimLF:=maxFil;
  dimLC:=maxCol;
  for fil:=1 to dimLF do for col:=1 to dimLC do begin
    write('Ingrese un valor para la matriz: ');
    readln(m[fil,col]);
  end;
end;

procedure imprimirMatriz(m:matriz; dimLF:rangoF; var dimLC:rangoC);
var
  fil:rangoF;
  col:rangoC;
begin
  for fil:=1 to dimLF do begin
    for col:=1 to dimLC do write(m[fil,col],' ');
    writeln;
  end;
end;

procedure filasPares(m:matriz; dimLF:rangoF; dimLC:rangoC);
var
  fil:rangoF;
  col:rangoC;
begin
  for fil:=1 to dimLF do if (fil mod 2 = 0) then begin
    for col:=1 to dimLC do write(m[fil,col],' ');
    writeln;
  end;
end;

procedure columnasImpares(m:matriz; dimLF:rangoF; dimLC:rangoC);
var
  fil:rangoF;
  col:rangoC;
begin
  for col:=1 to dimLC do if (col mod 2 <> 0) then begin
    for fil:=1 to dimLF do write(m[fil,col],' ');
    writeln;
  end;
end;

procedure diagonal(m:matriz; dimLF:rangoF);
var
  fil:rangoF;
  col:rangoC;
begin
  col:=0;
  for fil:=1 to dimLF do begin
    col:=col+1;
    write(m[fil,col],' ');
  end;
end;

var
  m:matriz;
  dimLF:rangoF;
  dimLC:rangoC;

begin
  cargarMatriz(m,dimLF,dimLC);
  writeln('La matriz es: ');
  imprimirMatriz(m,dimLF,dimLC);
  writeln('Los elementos de las filas pares son: ');
  filasPares(m,dimLF,dimLC);
  writeln('Los elementos de las columnas impares son: ');
  columnasImpares(m,dimLF,dimLC);
  writeln('La diagonal principal de la matriz es: ');
  diagonal(m,dimLF);
  readln;
end.
