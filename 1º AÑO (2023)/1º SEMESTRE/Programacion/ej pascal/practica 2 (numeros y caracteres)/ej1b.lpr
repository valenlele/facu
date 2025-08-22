program ej1b;

var
  num:integer;
  dig:integer;
  max:integer;

begin
  max:=-1;
  writeln('Ingrese un numero entero: ');
  readln(num);
  while num <> 0 do
  begin
    dig:=num mod 10;
    if dig > max then
    max:=dig;
    num:=num div 10;
  end;
  writeln('El digito mas grande del numero es: ',max);
  readln;
end.
