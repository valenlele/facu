program ej3sincompletar;

type
  vector1 = array[1..10] of integer;
  vector2 = array[1..5] of integer;
  rango = 1..10;

var
  a:vector1;
  b:vector2;
  i:rango;

  j,k:integer;

procedure leer1(var a:vector1);
begin
    for j:=1 to 10 do
    begin
      writeln('Ingrese un valor para el vector 1: ');
      readln(a[j]);
    end;
end;

procedure leer2(var b:vector2);
begin
  for k:=1 to 5 do
  begin
    writeln('Ingrese un valor para el vector 2: ');
    readln(b[k]);
  end;
end;

procedure leeri(var i:rango);
begin
  writeln('Ingrese un valor de posicion: ');
  readln(i);
  if (i < 1) or (i >= 10) then
  writeln('Valor no valido');
end;

procedure insertar(var a:vector1; var b:vector2; var i:rango);
begin
  for j:=10 downto i+1 do
  a[j+5]:=a[j];
end;

begin
  leer1(a);
  leer2(b);
  leeri(i);
  insertar(a,b,i);
  writeln('El vector A resultante es: ');
  for j:=1 to 15 do
  writeln(a[j]);
  readln;
end.

