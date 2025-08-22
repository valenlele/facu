program ej1ayb;

function enesima(i:integer;n:integer):integer;
var
  j:integer;
  resultado:integer;
begin
  resultado:=1;
  for j:=1 to n do
    begin
      resultado:=resultado*i;
    end;
  enesima:=resultado;
end;

var
  i:integer;
  n:integer;

begin
  writeln('Ingrese un numero para calcular su cuadrado y su cubo: ');
    readln(i);
  writeln('Ingrese un numero para calcular la potencia enesima de 2: ');
    readln(n);
  writeln('El cuadrado de ',i,' es: ',enesima(i,2));
  writeln('El cubo ',i,' es: ',enesima(i,3));
  writeln('La potencia enesima de 2 elevado a la ',n,' es: ',enesima(2,n));
  readln;
end.
