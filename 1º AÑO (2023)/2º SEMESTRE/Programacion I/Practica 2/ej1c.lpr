program ej1c;
const maxNum=5;
var num,dig,numeros:integer;
begin
  for numeros:=1 to maxNum do begin
    writeln('Ingrese un numero: ');
    readln(num);
    while (num<>0) do begin
      dig:=num mod 10;
      if (dig mod 2=0) then writeln('El digito ',dig,' es par');
      num:=num div 10;
    end;
  end;
  readln;
end.
