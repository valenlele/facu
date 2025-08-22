program ej8ayb;

function operacion(numero1:integer;operador:char;numero2:integer):real;
begin
  case operador of
  '+':operacion:=numero1+numero2;
  '-':operacion:=numero1-numero2;
  '/':operacion:=numero1/numero2;
  '*':operacion:=numero1*numero2;
  else
    writeln(-1);
  end;
end;

var
  numero1,numero2:integer;
  operador:char;
  resultado:real;

begin
  writeln('Ingrese el primer numero: ');
    readln(numero1);
  writeln('Ingrese el operador: ');
    readln(operador);
  writeln('Ingrese el segundo numero: ');
    readln(numero2);
  resultado:=operacion(numero1,operador,numero2);
  if resultado = -1 then
    writeln('Operador no valido');
  else
    writeln('El resultado es: ',resultado:0:2);
  readln;
end.
