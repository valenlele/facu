program ej9sinterminar;

const
  fin = 'xxx';

type
  cadena20 = string[20];
  venta = record
    nom:cadena20;
    cod:integer;
    cat:cadena20;
    numAsiento:integer;
  end;
  lista = ^nodo
  nodo = record
    datos:venta;
    sig:lista;
  end;

  matriz = array[1..30,1..4] of real;

  listaReg = record
    cod:integer;
    totPasajes:integer;
    totMont:integer;
  end;

  listaReg = ^nodoReg;
  nodoReg = record
    datosReg:listaReg;
    sig:listaReg;
  end;

var
  l:lista
  datos:venta;
  l2:listaReg;
  datosReg:listaReg;

procedure leerInfo(var datos:venta);
begin
  writeln('Ingrese el nombre de la persona: ');
  readln(datos^.nom);
  if datos^.nom <> fin then
  begin
    writeln('Ingrese el codigo de vuelo: ');
    readln(datos^.cod);
    writeln('Ingrese la categoria del pasaje: ');
    readln(datos^.cat);
    writeln('Ingrese el numero de asiento: ');
    readln(datos^.numAsiento);
  end;
end;

procedure cargarLista1(var l:lista; datos:info);
var nue,act,ant:lista;
begin
  new(nue);
  act,ant:l;
  nue^.datos:=datos;
  while (act <> nil) and (nue^.datos.cod < act^.datos.cod) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if ant = act then l:=nue;
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarListaReg(var listaReg:l2; datosReg:nodoReg);
var nue:listaReg;
begin
  new(nue);
  nue^.datosReg:=datosReg;
  nue^.sig:=listaReg;
  listaReg:=nue;
end;

begin
end;


