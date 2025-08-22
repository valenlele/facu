program ej4;

var
  num:integer;
  dig:integer;
  inv:integer;

begin
  inv:=0;
  writeln('Ingrese un numero entrero: ');
  readln(num);
  while num <> 0 do
  begin
    dig:=num mod 10;
    inv:=(inv*10)+dig;
    num:=num div 10;
  end;
  writeln('El numero invertido es: ',inv);
  readln;
end.
