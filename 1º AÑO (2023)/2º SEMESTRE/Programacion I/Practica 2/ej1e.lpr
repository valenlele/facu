program ej1e;
const maxNum=15;
var num,cantDig:integer;
begin
  cantDig:=0;
  repeat
    writeln('Ingrese un numero: ');
    readln(num);
    while (num<>0) do begin
      cantDig:=cantDig+1;
      num:=num div 10;
    end;
  until (cantDig>=maxNum);
  readln;
end.
