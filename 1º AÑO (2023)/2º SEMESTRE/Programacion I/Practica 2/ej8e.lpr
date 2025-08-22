program ej8e;
const fin='z';
var car,ant:char;
    cantCar,cantP,cantPRN,caracPalabra,cantP6carac2p,cantCaracP:integer;
    arrancaConR,terminaConN:boolean;

begin
  ant:='.';
  cantCar:=0;
  cantP:=0;
  cantPRN:=0;
  cantP6carac2p:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  repeat
    cantP:=cantP+1;
    caracPalabra:=0;
    cantCaracP:=0;
    arrancaConR:=(car='R');
    while (car<>' ') and (car<>fin) do begin
        cantCar:=cantCar+1;
        caracPalabra:=caracPalabra+1;
        if (car='p') then cantCaracP:=cantCaracP+1;
        ant:=car;
        write('Ingrese un caracter: ');
        readln(car);
    end;
    terminaConN:=(ant='N') and ((car=' ') or (car=fin));
    if (arrancaConR) and (terminaConN) then cantPRN:=cantPRN+1;
    if (caracPalabra<6) and (cantCaracP=2) then cantP6carac2p:=cantP6carac2p+1;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  until (car=fin) or (cantCar=500);
  writeln('La cantidad de palabras que componen la secuencia es: ',cantP);
  writeln('La cantidad de palabras que comienzan con R y terminan con N es: ',cantPRN);
  writeln('La cantidad de palabras con menos de 6 caracteres que tienen dos p es: ',cantP6carac2p);
  readln;
end.
