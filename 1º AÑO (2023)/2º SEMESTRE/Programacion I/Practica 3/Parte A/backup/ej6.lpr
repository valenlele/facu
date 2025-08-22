program ej6;

var
  car:char;
  cantPalabras:integer;

function palabras(var car:char):integer;
var
  p7Car,cantCar:integer;
begin
  p7Car:=0;
  while (car=' ') do begin
    writeln('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>'*') do begin
    cantCar:=0;
    while (car<>' ') and (car<>'*') do begin
      cantCar:=cantCar+1;
      writeln('Ingrese un caracter: ');
      readln(car);
    end;
    if(cantCar=7) then p7Car:=p7Car+1;
    while (car=' ') do begin
      writeln('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  palabras:=p7Car;
end;

begin
  cantPalabras:=0;
  writeln('Ingrese un caracter: ');
  readln(car);
  cantPalabras:=palabras(car);
  writeln('La cantidad de palabras con 7 caracteres es: ',cantPalabras);
  readln;
end.

