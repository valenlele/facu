program ej1c;

const
  fin = 80;

var
  num:integer;
  dig:integer;
  i:integer;

begin
  for i:= 1 to fin do
  begin
    writeln('Ingrese un numero entero: ');
    readln(num);
    while num <> 0 do
    begin
      dig:=num mod 10;
      if dig mod 2 = 0 then
      writeln('El digito ',dig,' es par');
      num:=num div 10;
    end;
  end;
end.
