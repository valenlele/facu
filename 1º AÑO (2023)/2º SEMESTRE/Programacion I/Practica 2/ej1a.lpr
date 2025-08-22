program ej1a;
var num,dig:integer;
begin
  writeln('Ingrese un numero: ');
  readln(num);
  while (num<>0) do begin
    dig:=num mod 10;
    if (dig mod 3=0) then writeln('El digito ',dig,' es multiplo de 3');
    num:=num div 10;
    end;
  readln;
end.
