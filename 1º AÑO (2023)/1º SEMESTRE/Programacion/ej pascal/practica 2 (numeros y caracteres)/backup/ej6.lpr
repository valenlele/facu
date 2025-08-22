program ej1;

function maschico(numero:integer):integer;
var
  digito,min:integer;
begin
  min:=9999;
  readln(numero);
  while numero <> 0 do
    begin
      digito:=numero mod 10;
      if digito < min then
        min:=digito;
      numero:=numero div 10;
    end;
  maschico:=min;
end;

var
  numero:integer;

begin
  writeln('Ingrese un numero: ');
    readln(numero);
  writeln('El digito mas chico del numero es: ',maschico(numero));
  readln;
end.
