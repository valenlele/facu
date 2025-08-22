program ej5ayb;

function digitosinverso(numero,digitos:integer):integer;
var
  i,digito,digitosinv:integer;
begin
  digitosinv:=0;
  for i:=1 to digitos do
    begin
      digito:=numero mod 10;
      digitosinv:=(digitosinv*10)+digito;
      numero:=numero div 10;
    end;
  digitosinverso:=digitosinv;
end;

var
  num:integer;

begin
  writeln('Ingrese un numero entero: ');
    readln(num);
  while num <> 0 do
    begin
    writeln('Los ultimos 3 digitos inversos del numero son: ',digitosinverso(num,3));
    writeln('Los ultimos 5 digitos inversos del numero son: ',digitosinverso(num,5));
    writeln('Ingrese un numero entero: ');
      readln(num);
    end;
end.
