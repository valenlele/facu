program ej6;

const
  fin = '.';

var
  car:char;
  ant:char;
  cant_ae:integer;

begin
  cant_ae:=0;
  writeln('Ingrese un caracter: ');
  readln(car);
  while car <> fin do
  begin
    if ((ant = 'a') and (car = 'e')) or ((ant = 'e') and (car = 'a')) then
    cant_ae:=cant_ae+1;
    ant:=car;
    writeln('Ingrese un caracter: ');
    readln(car);
  end;
  writeln('La cantidad de veces que aparece una a seguida de una e o viceversa es: ',cant_ae);
  readln;
end.
