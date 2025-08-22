program ej5a;
const fin='.';
var car:char;
    cantCar:integer;
begin
  cantCar:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car<>fin) do begin
    cantCar:=cantCar+1;
    write('Ingrese un caracter: ');
    readln(car);
  end;
  write('La cantidad de caracteres leidos son: ',cantCar);
  readln;
end.
