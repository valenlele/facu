program ej2b;
var cantAnimales,max,maxHora,i:integer;
begin
  max:=-1;
  for i:=0 to 5 do begin
    writeln('La cantidad de animales que entraron en la hora ',i,' fueron: ');
    readln(cantAnimales);
    if (cantAnimales > max) then begin
      max:=CantAnimales;
      maxHora:=i;
    end;
  end;
  writeln('La maxima cantidad de animales que entraron en una hora fueron: ',max);
  writeln('La hora en la que mas animales entraron fue: ',maxHora);
  readln;
end.
