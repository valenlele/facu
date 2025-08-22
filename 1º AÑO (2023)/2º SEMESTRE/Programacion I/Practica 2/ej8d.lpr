program ej8d;
const fin='z';
var car,ant:char;
    cantCar,cantP,cantPRN,cantPT:integer;
    arrancaConR,terminaConT,terminaConN:boolean;

begin
  ant:='.';
  cantCar:=0;
  cantP:=0;
  cantPRN:=0;
  cantPT:=0;
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
    terminaConN:=(ant='N') and ((car=' ') or (car=fin));
    if (arrancaConR) and (terminaConN) then cantPRN:=cantPRN+1;
    terminaConT:=(ant='T') and ((car=' ') or (car=fin));
    if (terminaConT) then cantPt:=cantPt+1;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  until (car=fin) or (cantCar=500);
  writeln('La cantidad de palabras que componen la secuencia es: ',cantP);
  writeln('La cantidad de palabras que comienzan con R y terminan con N es: ',cantPRN);
  writeln('La cantidad de palabras que terminan con T es: ',cantPt);
  readln;
end.
