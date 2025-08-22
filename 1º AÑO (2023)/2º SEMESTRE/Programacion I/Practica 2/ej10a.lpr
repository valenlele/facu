program ej10a;

var
  car:char;
  long,cantLong6:integer;

begin
  cantLong6:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>'*') do begin
    long:=0;
    while (car<>'*') and (car<>' ') do begin
      long:=long+1;
      write('Ingrese un caracter: ');
      readln(car);
    end;
    if (long=6) then cantLong6:=cantLong6+1;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  write('La cantidad de palabras de longitud 6 es: ',cantLong6);
  readln;
end.

