program ej9;
var
  car,ant:char;
  cantP,cantCar,canta:integer;
  empiezaConS,terminaConS:boolean;
begin
  cantP:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;

  while (car<>'.') and (car<>'*') do begin
    empiezaConS:=(car='s');
    cantCar:=0;
    cantA:=0;
    while (car<>' ') and (car<>'.') and (car<>'*') do begin
      cantCar:=cantCar+1;
      if (car='a') then cantA:=cantA+1;
      ant:=car;
      write('Ingrese un caracter: ');
      readln(car);
    end;
    if(cantCar>=5) and (cantA=2) then begin
      terminaConS:=(ant='s') and ((car=' ') or (car='.') or (car='*'));
      if (terminaConS) and (empiezaConS) then cantP:=cantP+1;
    end;

    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  end;

  write('La cantidad de palabras que comienzan y terminan con s de al menos de  5 caracteres y que tengan al menos dos a es: ',cantP);
  readln;
end.
