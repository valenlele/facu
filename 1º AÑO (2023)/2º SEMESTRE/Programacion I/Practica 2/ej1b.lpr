program ej1b;
var num,dig,max:integer;
begin
  max:=-1;
  writeln('Ingrese un numero: ');
  readln(num);
  while (num<>0) do begin
    dig:=num mod 10;
    if (dig mod 3=0) then writeln('El digito ',dig,' es multiplo de 3');
    if dig > max then max:=dig;
    num:=num div 10;
    end;
  writeln('El digito mas grande encontrado en el numero es: ',max);
  readln;
end.
