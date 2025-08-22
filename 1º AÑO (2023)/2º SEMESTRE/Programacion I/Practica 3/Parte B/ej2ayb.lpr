program ej2ayb;

var
  n,m:integer;

function factorial(num:integer):integer;
var
  i,resultado:integer;
begin
  resultado:=num;
  for i:=num-1 downto 2 do resultado:=i*resultado;
  factorial:=resultado;
end;

function combinatorio(n,m:integer):integer;
var
  resta:integer;
begin
  resta:=m-n;
  if factorial(resta)*factorial(n)<>0 then combinatorio:=(factorial(m) div (factorial(resta)*factorial(n)))
  else if factorial(resta)*factorial(n)=0 then writeln('No se puede dividir por 0');
end;

begin
  writeln('Ingrese la cantidad de elementos: ');
  readln(m);
  writeln('Ingrese la cantidad de grupos: ');
  readln(n);
  writeln('Las combinaciones posibles de ',m,' elementos agrupados en ',n,' grupos es: ',combinatorio(n,m));
  readln;
end.

