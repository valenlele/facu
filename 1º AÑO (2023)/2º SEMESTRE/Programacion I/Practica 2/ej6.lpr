program ej6;
const fin='.';
var car,ant:char;
    cantae:integer;
begin
  cantae:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car<>fin) do begin
    ant:=car;
    write('Ingrese un caracter: ');
    readln(car);
    if (((ant='a') and (car='e')) or ((ant='e') and (car='a'))) then cantae:=cantae+1;
  end;
  write('La cantidad de veces que aparece una a seguida de una e o viceversa es: ',cantae);
  readln;
end.
