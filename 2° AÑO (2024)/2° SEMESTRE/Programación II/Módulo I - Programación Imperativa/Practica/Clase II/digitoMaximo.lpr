program digitoMaximo;

var
  num, maximo: integer;

procedure digitoMaximo(n: integer; max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  writeln('max: ',max);
end;

function digMax(num,max:integer):integer;
var
  dig:integer;
begin
  dig:=num mod 10;
  if (dig>max) then max:=dig;
  num:=num div 10;
  if (num<>0) then max:=digMax(num,max);
  digMax:=max;
end;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  {digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);}

  write('El digito maximo del numero ',num,' es: ',digMax(num,maximo));

  readln;
End.

