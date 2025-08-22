program ej4;

type
  letras = set of char;

var
  le:letras;
  car:char;
  cantLetras:integer;

procedure contarLetras(var car:char; var cantLetras:integer; le:letras);
begin
  if not(car in le) then cantLetras:=cantLetras+1;
end;

procedure imprimir (cantLetras:integer);
begin
  writeln('La cantidad de letras entre la a y la z que no fueron ingresadas es: ',cantLetras);
end;

begin
  le:=['a'..'z'];
  cantLetras:=0;
  writeln('Ingrese un caracter: ');
  readln(car);
  while (car<>'#') do begin
    contarLetras(car,cantLetras,le);
    writeln('Ingrese un caracter: ');
    readln(car);
  end;
  imprimir(cantLetras);
  readln;
end.
