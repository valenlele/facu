program ej5b;
const fin='.';
var car:char;
    cantCar,cantA:integer;
begin
  cantCar:=0;
  cantA:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car<>fin) do begin
    cantCar:=cantCar+1;
    if (car='A') then cantA:=cantA+1;
    write('Ingrese un caracter: ');
    readln(car);
  end;
  writeln('La cantidad de caracteres leidos son: ',cantCar);
  writeln('La cantidad de caracteres A leidos son: ',cantA);
  readln;
end.
