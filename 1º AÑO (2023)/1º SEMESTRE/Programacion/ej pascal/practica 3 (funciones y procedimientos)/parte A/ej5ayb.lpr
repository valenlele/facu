program ej4;

function capicua(numero:integer):boolean;
var
  digito:integer;
  invertido:integer;
  t:integer;
begin
  invertido:=0;
  t:=numero;
  while t <> 0 do
    begin
      digito:=t mod 10;
      invertido:=(invertido * 10) + digito;
      t:=t div 10;
    end;
  if invertido = numero then
    capicua:=true
  else
    capicua:=false;
end;

var
  numero:integer;

begin
  writeln('Ingrese un numero');
  readln(numero);
  if capicua(numero) then
    writeln('Es capicua')
  else
    writeln('No es capicua');
  readln;
end.

