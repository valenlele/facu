program ej1;

type
  cliente = record
    dni:integer;
    nombre,apellido:string;
    monto:real;
    cod:1..9;
  end;

  lista = ^nodo;
  nodo = record
    datos:cliente;
    sig:lista;
    end;

  vector = array[1..9] of integer;

procedure inicializarVector(var v:vector);
var i:0..9;
begin
  for i:=1 to 9 do v[i]:=0;
end;

function maxCodImpuesto(v:vector):integer;
var
  max:integer;
  i:0..9;
begin
  max:=-1;
  for i:=1 to 9 do begin
    if v[i]>max then begin
      max:=v[i];
      maxCodImpuesto:=i;
    end;
  end;
end;

function sinAtender(l:lista):integer;
begin
  sinAtender:=0;
  while l <> nil do begin
    sinAtender:=sinAtender+1;
    l:=l^.sig;
  end;
end;

procedure liberarMemoria(var l:lista);
var sig:lista;
begin
  while l <> nil do begin
    sig:=l^.sig;
    dispose(l);
    l:=sig;
  end;
end;

var
  l,act:lista;
  v:vector;
  tot:integer;

begin
  l:=nil;
  cargarLista(l); {se dispone}
  inicializarVector(v);
  act:=l;
  tot:=0;
  if l <> nil then begin
    while (act <> nil) and (tot <= 100000) do begin
      tot:=tot+act^.datos.monto;
      v[act^.datos.cod]:=v[act^.datos.cod]+1;
      act:=act^.sig;
    end;
    writeln('El codigo de impuesto que mas veces se pago fue : ',maxCodImpuesto(v));
    writeln('La cantidad de clientes que quedaron sin atender fueron: ',sinAtender(act));
    liberarMemoria(l);
    liberarMemoria(act);
  end;
end.
