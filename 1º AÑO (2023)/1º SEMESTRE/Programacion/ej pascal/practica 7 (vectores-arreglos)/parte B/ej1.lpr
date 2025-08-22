program ej1;

const
  dimF = 5;

type
  vector = array [1..dimF] of integer;

var
  v:vector;
  n:integer;
  i:integer;

procedure leer(var v:vector);
begin
  for i:=1 to dimF do
  begin
    writeln('Ingrese un valor: ');
    readln(v[i]);
  end;
end;

procedure insertar(var v:vector; var n:integer; var i:integer);
begin
  v[i]:=n;
end;

begin
  leer(v);
  writeln('Ingrese un valor para instertar en el vector: ');
  readln(n);
  writeln('Ingrese la posicion en donde quiere insertarlo: ');
  readln(i);
  insertar(v,n,i);
  writeln('El vector resultante es: ');
  for i:=1 to dimF do
  writeln(v[i]);
  readln;
end.
