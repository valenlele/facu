program ej1ab;

var
  i:integer;
  n:integer;

function enesima(i:integer; n:integer):integer;
var
  j:integer;
  resultado:integer;
begin
  resultado:=i;
  for j:=2 to n do
  begin
    resultado:=resultado*i;
  end;
  enesima:=resultado;
end;

begin
  writeln('Ingrese un numero para calcular su cuadrado: ');
  readln(i);
  writeln('El cuadrado del numero ',i,' es: ',enesima(i,2));
  writeln('Ingrese un numero para calcular su cubo: ');
  readln(i);
  writeln('El cubo del numero ',i,' es: ',enesima(i,3));
  writeln('Ingrese un numero para calcular la potencia enesima de 2: ');
  readln(n);
  writeln('La potencia ',n,' del 2 es: ',enesima(2,n));
  readln;
end.
