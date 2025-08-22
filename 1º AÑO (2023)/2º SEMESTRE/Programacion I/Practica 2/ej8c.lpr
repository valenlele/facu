program ej8c;
const fin='z';
var car,ant:char;
    cantCar,cantP,cantPr,cantPt:integer;
    arrancaConR,terminaConT:boolean;

begin
  ant:='.';
  arrancaConR:=false;
  terminaConT:=false;
  cantCar:=0;
  cantP:=0;
  cantPr:=0;
  cantPt:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  repeat
    cantP:=cantP+1;
    arrancaConR:=(car='R');
    while (car<>' ') and (car<>fin) do begin
        cantCar:=cantCar+1;
        ant:=car;
        write('Ingrese un caracter: ');
        readln(car);
    end;
    if (arrancaConR) then cantPr:=cantPr+1;
    terminaConT:=(ant='T') and ((car=' ') or (car=fin));
    if (terminaConT) then cantPt:=cantPt+1;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  until (car=fin) or (cantCar=500);
  writeln('La cantidad de palabras que componen la secuencia es: ',cantP);
  writeln('La cantidad de palabras que comienzan con R es: ',cantPr);
  writeln('La cantidad de palabras que terminan con T es: ',cantPt);
  writeln(ant);
  write(car);
  readln;
end.
