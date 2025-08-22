program ej2;

const
  dimF=6;

type
  cajas=array[1..dimF] of integer;
  rango=0..dimF;

procedure cargarCajas(var c:cajas; var dimL:rango);
var
  monto,nCaja:integer;
begin
  if (dimL<>dimF) then begin
    writeln('Ingrese el numero de caja: ');
    readln(nCaja);
    dimL:=0;
    while (nCaja<>0) and (dimL<dimF) do begin
      dimL:=dimL+1;
      writeln('Ingrese el monto de caja ',nCaja);
      readln(monto);
      c[dimL]:=monto;
      writeln('Ingrese el numero de caja: ');
      readln(nCaja);
    end;
  end;
end;

procedure maxYPromCaja(c:cajas; dimL:rango);
var
  i,totMont,max,nMax:integer;
begin
  totMont:=0;
  max:=0;
  for i:=1 to dimL do begin
    totMont:=totMont+c[i];
    if (c[i]>max) then begin
      max:=c[i];
      nMax:=i;
    end;
  end;
  writeln('El numero de caja que mas recuado fue: ',nMax);
  write('El promedio del monto de la caja es: ',totMont/dimL:2:2);
end;

var
  c:cajas;
  dimL:rango;

begin
  cargarCajas(c,dimL);
  maxYPromCaja(c,dimL);
  readln;
end.
