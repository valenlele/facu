program Recursion;

function digitoMaximo(n,max: integer):integer;
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    max:=digitoMaximo(n, max);
  digitoMaximo:=max;
end;

var
  num,max:integer;

Begin
  max:=-1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo(num,max));
  readln;
End.

