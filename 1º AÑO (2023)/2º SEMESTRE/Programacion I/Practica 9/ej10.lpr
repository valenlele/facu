program ej10;

const
  maxPlatos=3;
  fin=-1;

type
  cliente=record
    cod,tel:integer;
    ap,nom,dom:string;
  end;
  lista=^nodo;
  nodo=record
    datos:cliente;
    sig:lista;
  end;

  plato=record
    nom:string;
    stock:integer;
  end;
  rangoPlatos=1..100;
  vecPlatos=array[rangoPlatos] of plato;

  pedido=record
    codCliente,cant:integer;
    codPlato:rangoPlatos;
  end;

procedure leerInfoCliente(var c:cliente);
begin
  writeln('INGRESAR INFORMACION CLIENTE: ');
  write('Codigo: ');
  readln(c.cod);
  if (c.cod<>fin) then begin
    write('Apellido: ');
    readln(c.ap);
    write('Nombre: ');
    readln(c.nom);
    write('Domicilio: ');
    readln(c.dom);
    write('Telefono: ');
    readln(c.tel);
  end;
end;

procedure insertarFinalLista(var pri,ult:lista; c:cliente);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=c;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarListaClientes(var pri,ult:lista); //se dispone enunciado
var
  c:cliente;
begin
  leerInfoCliente(c);
  while (c.cod<>fin) do begin
    insertarFinalLista(pri,ult,c);
    leerInfoCliente(c);
  end;
end;

procedure cargarPlatos(var vc:vecPlatos); //se dispone enunciado
var
  i:integer;
begin
  for i:=1 to maxPlatos do begin
    writeln('INFORMACION DE UN PLATO: ');
    write('Nombre: ');
    readln(vc[i].nom);
    write('Stock disponible: ');
    readln(vc[i].stock);
  end;
end;

function existeCodCliente(pri:lista; cod:integer):boolean;
begin
  existeCodCliente:=false;
  while (pri<>nil) and (not existeCodCliente) do begin
    if (pri^.datos.cod=cod) then existeCodCliente:=true;
    pri:=pri^.sig;
  end;
end;

function hayStockPlato(var vc:vecPlatos; stock:integer; codPlato:rangoPlatos):boolean;
begin
  hayStockPlato:=false;
  if (stock<=vc[codPlato].stock) then hayStockPlato:=true;
end;

procedure leerPedidos(pri:lista; var vc:vecPlatos);
var
  p:pedido;
begin
  writeln('INGRESE INFORMACION DE UN PEDIDO: ');
  write('Codigo de cliente: ');
  readln(p.codCliente);
  while (p.codCliente<>fin) do begin
    if (not existeCodCliente(pri,p.codCliente)) then writeln('El codigo de cliente no existe: ')
    else begin
      write('Codigo de plato: ');
      readln(p.codPlato);
      write('Cantidad del plato: ');
      readln(p.cant);
      if (not hayStockPlato(vc,p.cant,p.codPlato)) then writeln('No hay stock disponible del plato ',vc[p.codPlato].nom)
      else begin
        writeln('El pedido se realizo con exito');
        vc[p.codPlato].stock:=vc[p.codPlato].stock-p.cant;
      end;
    end;
    writeln('INGRESE INFORMACION DE UN PEDIDO: ');
    write('Codigo de cliente: ');
    readln(p.codCliente);
  end;
end;

procedure platosSinStock(vc:vecPlatos);
var
  i:rangoPlatos;
begin
  for i:=1 to maxPlatos do if (vc[i].stock=0) then writeln('El plato ',vc[i].nom,' no tiene mas stock');
end;

procedure liberarMemoria(var pri:lista);
var
  aux:lista;
begin
  while (pri<>nil) do begin
    aux:=pri;
    pri:=pri^.sig;
    dispose(aux);
  end;
end;

var
  pri,ult:lista;
  vc:vecPlatos;

begin
  pri:=nil;
  cargarListaClientes(pri,ult);
  cargarPlatos(vc);
  leerPedidos(pri,vc);
  platosSinStock(vc);
  liberarMemoria(pri);
  readln;
end.
