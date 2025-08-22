program ej1d;
const fin=-1;
var num,dig:integer;
begin
  writeln('Ingrese un numero: ');
  readln(num);
  while (num<>fin) do begin
    while (num<>0) do begin
      dig:=num mod 10;
      if (dig mod 3=0) then writeln('El digito ',dig,' es par');
      num:=num div 10;
    end;
    writeln('Ingrese un numero: ');
    readln(num);
  end;
  readln;
end.
