program ej1;

function digitoMasChico(num:integer):integer;
var
  dig,minDig:integer;
begin
  minDig:=9999;
  while (num<>0) do begin
    dig:=num mod 10;
    if (dig<minDig) then minDig:=dig;
    num:=num div 10;
  end;
  digitoMasChico:=minDig;
end;

var
  num:integer;

begin
  write('Ingrese un numero entero: ');
  readln(num);
  write('El digito mas chico del numero es: ',digitoMasChico(num));
  readln;
end.
