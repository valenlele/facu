program ej8asinterminar;

const
  dimF = 12;

type
  carac = array[1..dimF] of char;

var
  c:carac;
  i:integer;
  dimL:integer;

procedure leer(var c:carac);
begin
  writeln('Ingrese una serie de caracteres: ');
  for i:=1 to dimF do
  begin
    readln(c[i]);
  end;
end;

function palabras(var c:carac):integer;
var
  cant_p:integer;
begin
  cant_p:=0;
  while (c[i] = ' ') and (dimL <= dimF) do
  begin
    i:=i+1;
    dimL:=dimL+1;
  end;
  while i <= dimF do
  begin
    dimL:=dimL+1;
    i:=i+1;
    if (c[i] = ' ') and (c[i+1] <> ' ') then
    cant_p:=cant_p+1;
  end;
  palabras:=cant_p;
end;

begin
  dimL:=0;
  i:=1;
  leer(c);
  writeln('La cantidad de palabras en el arreglo son: ',palabras(c));
  writeln(i);
  writeln(dimL);
  readln;
end.
