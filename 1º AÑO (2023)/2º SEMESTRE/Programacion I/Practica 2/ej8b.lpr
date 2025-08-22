program ej8b;
const fin='z';
var car:char;
    cantCar,cantP,cantPr:integer;
    arrancaConR:boolean;
begin
  cantCar:=0;
  cantP:=0;
  cantPr:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  repeat
    cantP:=cantP+1;
    arrancaConR:=(car='R');
    if(arrancaConR) then begin
      cantPr:=cantPr+1;
      while (car<>' ') and (car<>fin) do begin
        cantCar:=cantCar+1;
        write('Ingrese un caracter: ');
        readln(car);
      end;
    end;
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
  writeln('La cantidad de palabras que componen la secuencia es: ',cantP);
  write('La cantidad de palabras que comienzan con R es: ',cantPr);
  readln;
end.
