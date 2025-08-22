program ej5sinb;

const
  dimF = 3;

type
  cadena15 = string[15];
  flores = array[1..dimF] of cadena15;
  flor = cadena15;

var
  f:flores;
  flo:flor;
  i:integer;
  pos:integer;

procedure leer(var f:flores);
begin
  for i:=1 to dimF do
  begin
    writeln('Ingrese el nombre de una flor: ');
    readln(f[i]);
  end;
end;

procedure posicion(var f:flores; var pos:integer; var flo:flor);
begin
  for i:=1 to dimF do
  begin
    if f[i] = flo then
      pos:=i;
  end;
  if pos > 0 then
    begin
      writeln('La posicion de la flor ingresada es: ',pos);
    end
  else if pos = 0 then
    begin
      writeln('La flor no se encunetra en el vector');
    end;
end;

begin
  pos:=0;
  leer(f);
  writeln('Ingrese el nombre de una flor para saber su posicion en el vector: ');
  readln(flo);
  posicion(f,pos,flo);
  readln;
end.
