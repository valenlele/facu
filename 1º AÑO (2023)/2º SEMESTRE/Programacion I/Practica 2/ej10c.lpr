program ej10c;

var
  car,ant,ant2:char;
  long,cantLong6,palabrasPA,palabrasSA:integer;

begin
  cantLong6:=0;
  palabrasPA:=0;
  palabrasSA:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>'*') do begin
    long:=0;
    ant:=car;
    write('Ingrese un caracter: ');
    readln(car);
    ant2:=car;
    long:=long+1;
    if (ant='P') and (ant2='A') then palabrasPA:=palabrasPA+1;
    while (car<>'*') and (car<>' ') do begin
      long:=long+1;
      ant2:=ant;
      ant:=car;
      write('Ingrese un caracter: ');
      readln(car);
    end;
    if (ant2='S') and (ant='A') then palabrasSA:=palabrasSA+1;
    if (long=6) then cantLong6:=cantLong6+1;
    while (car=' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  writeln('La cantidad de palabras de longitud 6 es: ',cantLong6);
  writeln('La cantidad de palabras que empiezan con P y siguen con A es: ',palabrasPA);
  write('La cantidad de palabras que terminan con una S seguida de una A es: ',palabrasSA);
  readln;
end.

