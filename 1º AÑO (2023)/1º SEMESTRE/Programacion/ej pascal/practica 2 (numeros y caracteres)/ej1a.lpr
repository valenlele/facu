program ej1a;

var
  num:integer;
  dig:integer;
  cant_dig:integer;

begin
  cant_dig:=0;
  writeln('Ingrese un numero entero: ');
  readln(num);
  while num <> 0 do
  begin
    dig:=num mod 10;
    if dig mod 3 = 0 then
    cant_dig:=cant_dig+1;
    num:=num div 10;
  end;
  writeln('La cantidad de digitos multiplos de 3 son: ',cant_dig);
  readln;
end.
