program ej1e;

const
  fin = 100;

var
  num:integer;
  cant_num:integer;

begin
  cant_num:=0;
  writeln('Ingrese un numero entero: ');
  readln(num);
  while cant_num <= fin do
  begin
    cant_num:=cant_num+1;
    writeln('Ingrese un numero entero: ');
    readln(num);
  end;
end.
