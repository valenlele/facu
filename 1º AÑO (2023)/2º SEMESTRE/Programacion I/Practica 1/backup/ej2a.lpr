program ej2a;
var cantAnimales,max,i:integer;
begin
  max:=-1;
  for i:=0 to 5 do begin
    writeln('La cantidad de animales que entraron en la hora ',i,' fueron: ');
    readln(cantAnimales);
    if (cantAnimales > max) then max:=CantAnimales;
  end;
  writeln('La maxima cantidad de animales que entraron en una hora fueron: ',max);
  readln;
end.
