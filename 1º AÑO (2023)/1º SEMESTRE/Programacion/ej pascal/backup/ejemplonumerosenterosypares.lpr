program ej2;
var
  i,animales,animales_max:integer;
begin
  animales_max:=-1;
  for i:= 1 to 24 do
    begin
      writeln('decime una cantidad de animales');
        readln(animales);
          if animales > animales_max then
            begin
              animales_max:=animales;
            end;
    end;
  write('la cantidad de animales maxima que ingreso en una hora es: ',animales_max);
end.
