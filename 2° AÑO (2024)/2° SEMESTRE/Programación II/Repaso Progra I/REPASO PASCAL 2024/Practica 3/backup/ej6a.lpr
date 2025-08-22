program ej6ab;

function ordeninverso(num,cantDig:integer):integer;
var
  i,dig:integer;
begin
  ordenInverso:=0;
  for i:=1 to cantDig do begin
    dig:=num mod 10;
    ordenInverso:=(ordenInverso*10)+dig;
    num:=num div 10;
  end;
end;

var
  num:integer;

begin
  write('Ingrese un numero: ');
  readln(num);
  while (num<>0) do begin
    num:=ordenInverso(num,3);
    writeln('Los ultimos 3 digitos del numero son: ',ordenInverso(num,3));
    write('Ingrese un numero: ');
    readln(num);
  end;
  readln;
end.
