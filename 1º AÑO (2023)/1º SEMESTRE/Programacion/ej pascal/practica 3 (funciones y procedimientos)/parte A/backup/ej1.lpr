program ej2ab;

function mod2(numero,divisor:integer):integer;
var
  resultado:integer;
  resto:integer;
begin
  resultado:=numero div divisor;
  resto:=numero - resultado*divisor;
  mod2:=resto;
end;

function espar(numero:integer):boolean;
begin
  espar:=mod2(numero, 2) = 0;
end;

function esimpar(numero:integer):boolean;
begin
  esimpar:=mod2(numero, 2) = 0;
end;

var
  numero:integer;
  divisor:integer;
  par:boolean;
  impar:boolean;

begin
  writeln('Introduzca un numero: ');
    readln(numero);
  writeln('Introduzca un divisor: ');
    readln(divisor);
  writeln('Su resto entero es: ',mod2(numero,divisor));
  par:=espar(numero);
  if par then
    writeln('El numero es par')
  else
    writeln('El numero no es par');
  impar:=esimpar(numero);
    if impar then
      writeln('El numero no es impar')
    else
      writeln('El numero es impar');
  readln;
end.
