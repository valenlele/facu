program ej5c;
const fin='.';
var car,ant:char;
    cantCar,cantA,cantsa:integer;
begin
  cantCar:=0;
  cantA:=0;
  cantsa:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car<>fin) do begin
    cantCar:=cantCar+1;
    if (car='A') then cantA:=cantA+1;
    ant:=car;
    write('Ingrese un caracter: ');
    readln(car);
    if (car<>'.') and (ant='s') and (car='a') then cantsa:=cantsa+1;
  end;
  writeln('La cantidad de caracteres leidos es: ',cantCar);
  writeln('La cantidad de caracteres A leidos es: ',cantA);
  writeln('La cantidad de veces que aparece la s seguida de la a es: ',cantsa);
  readln;
end.
