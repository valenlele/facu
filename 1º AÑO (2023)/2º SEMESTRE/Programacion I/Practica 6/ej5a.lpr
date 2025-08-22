program ej5a;

const
  dimF=5;

type
  cadena=string[20];
  flores=array[1..dimF] of cadena;
  rango=0..dimF;

procedure cargarVector(var f:flores; var dimL:rango);
var
  flor:cadena;
begin
  dimL:=0;
  writeln('Ingrese el nombre de una flor: ');
  readln(flor);
  while (dimL<dimF) do begin
    dimL:=dimL+1;
    f[dimL]:=flor;
    if (dimL<>dimF) then begin
      writeln('Ingrese el nombre de una flor: ');
      readln(flor);
    end;
  end;
end;

function buscarPos(f:flores; elem:cadena):rango;
var
  pos:rango;
begin
  pos:=1;
  while (elem<>f[pos]) and (pos<=dimF) do pos:=pos+1;
  if (pos>dimF) then pos:=0;
  buscarPos:=pos;
end;

var
  f:flores;
  dimL:rango;
  elem:cadena;

begin
  cargarVector(f,dimL);
  writeln('Ingrese el nombre de una flor para buscar su posicion en el vector: ');
  readln(elem);
  write(buscarPos(f,elem));
  readln;
end.
