program ej1;

var
  num:integer;

function digMin(num:integer):integer;
var
  min,dig:integer;
begin
  min:=9999;
  while (num<>0) do begin
    dig:=num mod 10;
    if (dig<min) then min:=dig;
    num:=num div 10;
  end;
  digMin:=min;
end;

begin
  write('Ingrese un numero: ');
  readln(num);
  write('El digito mas chico del numero es: ',digMin(num));
  readln;
end.
