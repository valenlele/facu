program ej10;

type
  infoClientes = record
    codCliente,tel:integer;
    apeliido,nom,dom:string;
  end;
  listaClientes = ^nodoClientes;
  nodoClientes = record
    datos:infoClientes;
    sig:listaClientes;
  end;

  infoPlatos = record
    nombre:string;
    stock:integer;
  end;
  vector = array[0..100] of infoPlatos;

function encontroCliente(l:listaCLientes; codCliente:integer):boolean;
begin
  while (l <> nil) and (codCliente <> l^.datos.codCliente) do l:=l^.sig;
  if CodCliente = l^.datos.codCliente then encontroCliente:=true
  else encontroCliente:=false;
end;

function hayStock(platos:vector; codPlato:integer; cant:integer):boolean;
begin
  if platos[codPlato].stock >= cant then hayStock:=true
  else hayStock:=false;
end;

procedure leerPedido(l:listaClientes; platos:vector);
var
  codCliente,codPlato,cantPlato:integer;
begin
  writeln('Ingrese el codigo de cliente, el codigo del plato y la cantidad que se desea pedir: ');
  readln(codCliente);
  readln(codPlato);
  readln(cantPlato);
  while codCliente <> -1 do
  begin
    if encontroCliente(l,codCliente) and hayStock(platos,codPlato,cantPlato) then
    begin
      platos[codPlato].stock:=platos[codPlato].stock-cantPlato;
      writeln('El pedido se realizo con exito');
    end
    else
    begin
      if not hayStock(platos,codPlato,cantPlato) then writeln('No hay stock del plato')
      else writeln('El cliente no se encunetra en la base de datos');
    end;
    writeln('Ingrese el codigo de cliente, el codigo del plato y la cantidad que se desea pedir: ');
    readln(codCliente);
    readln(codPlato);
    readln(cantPlato);
  end;
end;

procedure noStock(platos:vector);
var
  plato:integer;
begin
  for plato:=1 to 100 do
  if platos[plato].stock = 0 then writeln('No hay stock del plato',plato,': ',platos[plato].nombre);
end;

var
  l:listaClientes;
  platos:vector;

begin
  leerPedido(l,platos);
  noStock(platos);
end.
