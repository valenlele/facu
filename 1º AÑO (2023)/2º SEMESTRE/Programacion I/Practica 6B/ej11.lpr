program ej11;

const
  maxFil=3;
  maxCol=3;

type
  rangoF=1..maxFil;
  rangoC=1..maxCol;
  matriz=array[rangoF,rangoC]of integer;
  vec=array[rangoF] of integer;

procedure cargarVec(var v:vec);
var
  pos:integer;
begin
  for pos:=1 to maxFil do begin
    writeln('Ingrese un valor para el vector: ');
    readln(v[pos]);
  end;
end;

procedure cargarMatriz(var m:matriz);
var
  fil:rangoF;
  col:rangoC;
begin
  for fil:=1 to maxFil do for col:=1 to maxCol do begin
    writeln('Ingrese un valor para la matriz: ');
    readln(m[fil,col]);
  end;
end;

{procedure eliminarNesimaFila(var m:matriz; n:integer; var dimlF:rangoF; dimlC:rangoC);
var
  fil:rangoF;
  col:rangoC;
begin
  if (n>0) and (n<dimlF) then begin
    for fil:=n to dimlF-1 do for col:=1 to dimlC do m[fil,col]:=m[fil+1,col];
    dimlF:=dimlF-1;
  end
  else if (n=dimlF) then dimlF:=dimlF-1;
end;}

procedure imprimirMatriz(m:matriz; dimlF:rangoF; dimlC:rangoC);
var
  fil:rangoF;
  col:rangoC;
begin
  writeln('La matriz es: ');
  for fil:=1 to dimlF do for col:=1 to dimlC do writeln(m[fil,col]);
end;

procedure insertarVectorEnEnesimaColumna(var m:matriz; v:vec; n:integer; dimlF:rangoF; dimlC:rangoC; dimlV:integer);
var
  fil:rangoF;
  col:rangoC;
begin
  if (n>0) and (n<=dimlC) and (dimlV=dimlF) then begin
    for col:=dimlC downto n do for fil:=1 to dimlF do m[fil,col+1]:=m[fil,col];
    dimlC:=dimlC+1;
    for fil:=1 to dimlF do m[fil,n]:=v[fil];
  end;
end;

var
  m:matriz;
  dimlF:rangoF;
  dimlC:rangoC;
  n:integer;
  v:vec;
  dimlV:integer;

begin
  dimlF:=maxFil;
  dimlC:=maxCol;
  cargarMatriz(m);
  imprimirMatriz(m,dimlF,dimlC);
  {write('Ingrese el numero de fila para eliminar: ');
  readln(n);
  eliminarNesimaFila(m,n,dimlF,dimlC);
  imprimirMatriz(m,dimlF,dimlC);}
  dimlV:=dimlF;
  cargarVec(v);
  write('Inserte el numero de columna de la matriz al que quiera insertar el vector: ');
  readln(n);
  insertarVectorEnEnesimaColumna(m,v,n,dimlF,dimlC,dimlV);
  imprimirMatriz(m,dimlF,dimlC);
  readln;
end.
