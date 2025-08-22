program ej1ayb;

var
  i,n:integer;

function potencia(i,n:integer):integer;
var
  j,resultado:integer;
begin
  resultado:=1;
  for j:=1 to n do resultado:=i*resultado;
  potencia:=resultado;
end;

begin
  writeln('Ingrese un numero: ');
  readln(i);
  writeln('El cuadrado del numero: ',i,' es: ',potencia(i,2));
  writeln('El cubo del numero: ',i,' es: ',potencia(i,3));
  writeln('Ingrese una potencia: ');
  readln(n);
  writeln('La potencia ',n,' de 2 es: ',potencia(2,n));
  readln;
end.

