program ej10b;

var
  car:char;
  long,cantLong6,palabrasPA:integer;
  empiezaConP:boolean;

begin
  cantLong6:=0;
  palabrasPA:=0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin
    write('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>'*') do begin
    long:=0;
    empiezaConP:=(car='P');
    if (empiezaConP) then begin
      long:=long+1;
      write('Ingrese un caracter: ');
      readln(car);
      if car='A' then palabrasPA:=palabrasPA+1;
    end;
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
  writeln('La cantidad de palabras de longitud 6 es: ',cantLong6);
  write('La cantidad de palabras que empiezan con P y siguen con A es: ',palabrasPA);
  readln;
end.

