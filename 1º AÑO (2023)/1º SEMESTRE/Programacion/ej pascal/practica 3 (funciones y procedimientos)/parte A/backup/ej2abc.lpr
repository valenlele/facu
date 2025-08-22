program ej3;

function max4(n1,n2,n3,n4:integer):integer;
var
  max:integer;
begin
  max:=-1;
  if (n1 > n2) and (n1 > n3) and (n1 > n4) then
    max:=n1;
  if (n2 > n1) and (n2 > n3) and (n3 > n4) then
    max:=n2;
  if (n3 > n1) and (n3 > n2) and (n3 > n4) then
    max:=n3;
  if (n4 > n1) and (n4 > n2) and (n4 > n3) then
    max:=n4;
  max4:=max;
end;

function max(numero1,numero2:integer):integer;
var
  max2:integer;
begin
  max2:=-1;
  if (numero1 > numero2) then
    max2:=numero1
  else
    max2:=numero2;
  max:=max2;
end;

var
  n1,n2,n3,n4:integer;
  numero1,numero2:integer;

begin
  writeln('Introduce 4 numeros enteros: ');
    readln(n1,n2,n3,n4);
  writeln('El numero mas grande de los 4 es: ',max4(n1,n2,n3,n4));
  writeln('Introduce otros dos numeros: ');
    readln(numero1,numero2);
  writeln('El numero mas grande de los 2 es: ',max(numero1,numero2));
  readln;
end.
