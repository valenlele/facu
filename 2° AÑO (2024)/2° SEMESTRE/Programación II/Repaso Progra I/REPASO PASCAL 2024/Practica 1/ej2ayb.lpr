program ej2ayb;

var
  max,cant,i,maxHora:integer;

begin
  max:=-1;
  for i:=0 to 23 do begin
    write('Ingresar la cantidad de animales que entraron a las ',i,':00hs: ');
    readln(cant);
    if (cant>max) then begin
      max:=cant;
      maxHora:=i;
    end;
  end;
  write('La cantidad de animales que mas entraron en una hora fueron: ',max,'. Entraron a las ',maxHora,':00hs');
  readln;
end.
