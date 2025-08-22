program ej3a;
var
  num,max,i:integer;

function max4(num:integer; var max:integer):integer;
begin
  if (num>max) then max:=num;
  max4:=max;
end;

begin
  max:=-1;
  for i:=1 to 4 do begin
    writeln('Ingrese un numero: ');
    readln(num);
    max4(num,max);
  end;
  writeln('El mayor de los 4 numneros es: ',max4(num,max));
  readln;
end.

