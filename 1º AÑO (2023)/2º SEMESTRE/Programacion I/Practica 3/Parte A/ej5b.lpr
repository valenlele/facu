program ej5b;

var
  num:integer;

function ultDig(num,cantDig:integer):integer;
var
  inv,inv2,i,dig:integer;
begin
  inv:=0;
  inv2:=0;
  for i:=1 to cantDig do begin
    dig:=num mod 10;
    inv:=(inv*10)+dig;
    num:=num div 10;
  end;
  for i:=1 to cantDig do begin
    dig:=inv mod 10;
    inv2:=(inv2*10)+dig;
    inv:=inv div 10;
  end;
  ultDig:=inv2;
end;

begin
  writeln('Ingrese un numero: ');
  readln(num);
  while (num<>0) do begin
    writeln('Los ultimos 3 digitos del numero ',num,' son: ',ultDig(num,3));
    writeln('Los ultimos 5 digitos del numero ',num,' son: ',ultDig(num,5));
    writeln('Ingrese un numero: ');
    readln(num);
  end;
end.
