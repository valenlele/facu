program ej2;

var
  i:integer;
  cant:integer;
  max:integer;
  max_hora:integer;

begin
  max:=-1;
  for i:=0 to 23 do
  begin
    writeln('Ingrese la cantidad de animales que ingresaron en la hora ',i,': ');
    readln(cant);
    if cant > max then
    begin
      max:=cant;
      max_hora:=i;
    end;
  end;
  writeln('La cantidad maxima de animales que ingresaron en una hora fueron: ',max,'. La hora en la que ingresaron fue: ',max_hora);
  readln;
end.
