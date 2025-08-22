program ej4;

var
  num:integer;

function esCapicua(num:integer):boolean;
var
  aux,dig,inv:integer;
  cap:boolean;
begin
  inv:=0;
  aux:=num;
  cap:=false;
  while (num<>0) do begin
    dig:=num mod 10;
    inv:=(inv*10)+dig;
    num:=num div 10;
  end;
  if (aux=inv) then caP:=true;
  esCapicua:=cap;
end;

begin
  writeln('Ingrese un numero: ');
  readln(num);
  if (esCapicua(num))=true then writeln('El numero ingresado es capicua')
  else write('El numero ingresado no es capicua');
  readln;
end.
