program ej2a;
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

begin
  write('Ingrese un numero: ');
  readln(num);
  write('Ingrese su divisor: ');
  read(divisor);
  if (divisor<>0) then write('El resto de dividir ',num,' entre ',divisor,' es: ',opMod(num,divisor))
  else write('Ingrese un divisor distinto de 0');
  readkey;
end.
