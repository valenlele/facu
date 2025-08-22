program ej5a;

var
  num,cantDig:integer;

function digInversos(num,cantDig:integer):integer;
var
  inv,i,dig:integer;
begin
  inv:=0;
  for i:=1 to cantDig do begin
    dig:=num mod 10;
    inv:=(inv*10)+dig;
    num:=num div 10;
  end;
  digInversos:=inv;
end;

begin
  writeln('Ingrese un numero: ');
  readln(num);
  writeln('Ingrese la cantidad de digitos que desea invertir: ');
  readln(cantDig);
  write('Los ultimos ',cantDig,' digitos del numero ',num,' invertidos son: ',digInversos(num,cantDig));
  readln;
end.
