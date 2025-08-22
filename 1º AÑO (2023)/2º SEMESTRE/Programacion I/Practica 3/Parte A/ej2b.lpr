program ej2b;
uses crt;
var
  num,divisor:integer;

function opMod(num,divisor:integer):integer;
var
  cociente,resto:integer;
begin
  cociente:=num div divisor;
  resto:=num-(divisor*cociente);
  opMod:=resto;
end;

function esPar(num:integer):boolean;
var
  par:boolean;
begin
  par:=false;
  if (num mod 2=0) then par:=true;
  esPar:=par;
end;

begin
  write('Ingrese un numero: ');
  readln(num);
  write('Ingrese su divisor: ');
  read(divisor);
  if (divisor<>0) then writeln('El resto de dividir ',num,' entre ',divisor,' es: ',opMod(num,divisor))
  else writeln('Ingrese un divisor distinto de 0');
  if (esPar(num) = true) then write('El numero ingresado es par')
  else write('El numero ingresado no es par');
  readkey;
end.
