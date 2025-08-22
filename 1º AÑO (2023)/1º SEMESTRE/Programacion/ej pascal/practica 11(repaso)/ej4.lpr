program ej4;

type
  fechas = record
    mes:1..12;
    dia:1..31;
  end;
  direcciones = record
    calle:1..122;
    numero:integer;
    piso:integer;
    departamento:integer;
  end;
  paquete = record
    fecha:fechas;
    entregado:boolean;
    direccion:direcciones;
  end;
  lista = ^nodo;
  nodo = record
    datos:paquete;
    sig:lista;
  end;
  vectorCalle = array[1..122] of integer;
  vectorMes = array[1..12] of integer;
  vector1120 = array[11..20] of lista;

procedure eliminar(var l:lista; envio:paquete);
var act,ant:lista;
begin
  act:=l;
  while (act <> nil) and (act^.datos <> envio) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act <> nil) then begin
    if act = l then l:=act^.sig
    else ant^.sig:=act^.sig;
    dispose(act);
  end;
end;

procedure cargarLista1120(var l:lista; datos:paquete);
var nue,act,ant:lista;
begin
  new(nue);
  nue^.datos:=datos;
  act:=l;
  ant:=l;
  while (act <> nil) and (act^.datos.direccion.numero < datos.direccion.numero) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if ant = act then l:=nue {si esta en el primer nodo}
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure liberarMemoria(var l:lista);
var sig:lista;
begin
  while (l <> nil) do begin
    sig:=l^.sig;
    dispose(l);
    l:=sig;
  end;
end;

var
  l,act:lista;
  listas:vector1120;
  calles:vectorCalle;
  meses:vectorMes;
  i,maxMes,maxEnvios:integer;

begin
  l:=nil;
  cargarLista(l); {se dispone}
  act:=l;
  for i:=1 to 122 do calles[i]:=0;
  for i:=1 to 12 do meses[i]:=0;
  for i:=11 to 22 do listas[i]:=nil;
  while (act <> nil) do begin
    calles[act^.datos.direccion.calle]:=calles[act^.datos.direccion.calle]+1;
    meses[act^.datos.fecha.mes]:=meses[act^.datos.fecha.mes]+1;
    if (act^.datos.entregado = false) then eliminar(l,act^.datos);
    if (act^.datos.direccion.calle >= 11) and (act^.datos.direccion.calle <= 20) then cargarLista1120(listas[act^.datos.direccion.calle,act^.datos]);
    act:=act^.sig;
  end;
  for i:=1 to 122 do writeln('La cantidad de envios realizados en la calle ',i,' son: ',calles[i]);
  maxMes:=-1;
  maxEnvios:=-1;
  for i:=1 to 12 do begin
    if meses[i] > maxEnvios then begin
      maxEnvios:=meses[i];
      maxMes:=i;
    end;
  end;
  writeln('El mes en donde se hicieron mas envios fue el mes numero :',maxMes);
  liberarMemoria(l);
  liberarMemoria(act);
end.
