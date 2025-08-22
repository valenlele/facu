program ej8a;
const fin='z';
var car:char;
    cantCar,cantP:integer;
begin
  cantCar:=0;
  cantP:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  repeat
    cantP:=cantP+1;
    while (car<>' ') and (car<>fin) do begin
      cantCar:=cantCar+1;
      write('Ingrese un caracter: ');
      readln(car);
    end;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  until (car=fin) or (cantCar=500);
  cantP:=cantP+1;
  writeln(cantCar);
  write('La cantidad de palabras que componen la secuencia es: ',cantP);
  readln;
end.
