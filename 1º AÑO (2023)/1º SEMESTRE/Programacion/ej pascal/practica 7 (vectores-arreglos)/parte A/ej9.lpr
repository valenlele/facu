program ej9;

const
  dimF = 8;

type
  numeros = array[1..dimF] of integer;

var
  n:numeros;
  i:integer;
  valor:integer;
  posicion_par:boolean;

procedure leer(var n:numeros);
begin
  for i:=1 to dimF do
  n[i]:=0;
  i:=1;
  writeln('Ingrese un valor: ');
  readln(valor);
  while (valor <> 9999) and (i < dimF) do
  begin
    n[i]:=valor;
    i:=i+1;
    writeln('Ingrese un valor: ');
    readln(valor);
  end;
end;

procedure num_impares(var n:numeros);
begin
  for i:=1 to dimF do
  begin
    if (i mod 2 <> 0) then
    writeln('El numero almacenado en la posicion ',i,' es: ',n[i]);
  end;
end;

procedure primer_par(var n:numeros);
begin
  i:=1;
  while (i < dimF) and (posicion_par = false) do
  begin
    if n[i] mod 2 = 0 then
    begin
    writeln('La posicion del primer numero par es: ',i);
    posicion_par:=true;
    end;
    i:=i+1;
  end;
  if posicion_par = false then
  writeln(0);
end;

begin
  posicion_par:=false;
  leer(n);
  num_impares(n);
  primer_par(n);
  readln;
end.
