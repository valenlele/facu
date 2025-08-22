program ej2;

const
  dimF = 6;
  fin = 0;

type
  banco = array [1..dimF] of integer;

var
  b:banco;
  i:integer;
  caja:integer;
  monto:integer;
  tot_monto:integer;
  max_caja:integer;

procedure leer(var b:banco);
var
  max:integer;
begin
  max:=-1;
  writeln('Ingrese el numero de caja: ');
  readln(caja);
  while (caja <> fin) and (i <= dimF) do
  begin
    b[i]:=caja;
    writeln('Ingrese el monto de la caja numero ',i);
    readln(monto);
    tot_monto:=tot_monto+monto;
    if monto > max then
    begin
      max:=monto;
      max_caja:=caja;
    end;
    i:=i+1;
    if i <= dimF then
    begin
      writeln('Ingrese el numero de caja: ');
      readln(caja);
    end;
  end;
end;

procedure mas_reca(var max_caja:integer);
begin
  writeln('El numero de caja que mas recaudo fue la caja numero: ',max_caja);
end;

function promedio(tot_monto:integer):real;
begin
  promedio:=tot_monto/dimF;
  writeln('El monto promedio de las cajas es: ',promedio:0:2);
end;

begin
  i:=1;
  tot_monto:=0;
  max_caja:=-1;
  leer(b);
  mas_reca(max_caja);
  promedio(tot_monto);
  readln;
end.
