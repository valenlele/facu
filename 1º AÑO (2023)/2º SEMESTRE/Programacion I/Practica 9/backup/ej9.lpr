program ej9;

const
  fin='zzz';
  maxCodVuelo=4;
  maxCat=4;

type
  rangoVuelo=0..maxCodVuelo;
  rangoCat=1..maxCat;
  venta=record
    nom:string;
    codVuelo:rangoVuelo;
    catPasaje:rangoCat;
    numAsiento:integer;
  end;

  lista=^nodo;
  nodo=record
    datos:venta;
    sig:lista;
  end;

  costoPasaje=array[rangoVuelo,rangoCat] of integer;

  registro=record
    cod:rangoVuelo;
    totPasajes:integer;
    totMont:integer;
  end;

  listaRegistro=^nodoRegistro;
  nodoRegistro=record
    datos:registro;
    sig:listaRegistro;
  end;

  codVentas=record
    cod:rangoVuelo;
    ventas:integer;
  end;
  max5vendidos=array[1..5] of codVentas;

  listaCodigos=^nodoCodigos;
  nodoCodigos=record
    cod:integer;
    sig:listaCodigos;
  end;

procedure leerInfoVenta(var v:venta);
begin
  writeln('INFORMACION VENTA: ');
  write('Nombre: ');
  readln(v.nom);
  if (v.nom<>fin) then begin
    write('Codigo de vuelo: ');
    readln(v.codVuelo);
    write('Categoria del pasaje: ');
    readln(v.catPasaje);
    write('Numero de asiento: ');
    readln(v.numAsiento);
  end;
end;

procedure insertarListaOrdenadaVenta(var pri:lista; var v:venta);
var
  nue,act,ant:lista;
begin
  new(nue);
  ant:=pri;
  act:=pri;
  nue^.datos:=v;
  while (act<>nil) and (v.codVuelo>act^.datos.codVuelo) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarListaVentas(var pri:lista; var v:venta);  //se dispone enunciado
begin
  pri:=nil;
  leerInfoVenta(v);
  while (v.nom<>fin) do begin
    insertarListaOrdenadaVenta(pri,v);
    leerInfoVenta(v);
  end;
end;

procedure cargarEstructuraCostoPasaje(var c:costoPasaje);
var
  i:rangoVuelo;
  j:rangoCat;
begin
  for i:=1 to maxCodVuelo do begin
    for j:=1 to maxCat do begin
      write('Ingrese el costo del pasaje con codigo ',i,' y categoria ',j,': ');
      readln(c[i,j]);
    end;
  end;
end;

function precioPasaje(c:costoPasaje; codVuelo:rangoVuelo; catPasaje:rangoCat):integer;
begin
  precioPasaje:=c[codVuelo,catPasaje];
end;

procedure insertarListaRegistro(var pri2:listaRegistro; r:registro);
var
  nue,act:listaRegistro;
begin
  new(nue);
  nue^.datos:=r;
  nue^.sig:=nil;
  if (pri2<>nil) then begin
    act:=pri2;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else pri2:=nue;
end;

procedure insertarListaCodigos(var pri3:listaCodigos; cod:integer);
var
  nue,act:listaCodigos;
begin
  new(nue);
  nue^.cod:=cod;
  nue^.sig:=nil;
  if (pri3<>nil) then begin
    act:=pri3;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else pri3:=nue;
end;

procedure inicializarVector(var vec:max5Vendidos);
var
  i:integer;
begin
  for i:=1 to 5 do begin
    vec[i].ventas:=-1;
    vec[i].cod:=0;
  end;
end;

procedure corrimientoVector(var vec:max5Vendidos; pri2:listaRegistro; i:integer);
var
  j:integer;
begin
  for j:=5 downto i+1 do begin
    vec[j].cod:=vec[j-1].cod;
    vec[j].ventas:=vec[j-1].ventas;
  end;
  vec[i].ventas:=pri2^.datos.totPasajes;
  vec[i].cod:=pri2^.datos.cod;
end;

procedure cincoVuelosMasVendidos(pri2:listaRegistro; var vec:max5Vendidos);
var
  i:integer;
begin
  inicializarVector(vec);
  while (pri2<>nil) do begin
    i:=1;
    while (i<=5) and (pri2^.datos.totPasajes<vec[i].ventas) do i:=i+1;
    if (pri2^.datos.totPasajes>=vec[i].ventas) then corrimientoVector(vec,pri2,i);
    pri2:=pri2^.sig;
  end;
end;

procedure cargarListaRegistros(pri:lista; var pri2:listaRegistro; var pri3:listaCodigos; var vec:max5Vendidos; c:costoPasaje; var r:registro);
var
  codVueloAct:rangoVuelo;
begin
  pri2:=nil;
  pri3:=nil;
  if (pri<>nil) then begin
    codVueloAct:=pri^.datos.codVuelo;
    while (pri<>nil) do begin
      r.cod:=codVueloAct;
      r.totPasajes:=0;
      r.totMont:=0;
      while (pri<>nil) and (pri^.datos.codVuelo=codVueloAct) do begin
        r.totPasajes:=r.totPasajes+1;
        r.totMont:=r.totMont+precioPasaje(c,pri^.datos.codVuelo,pri^.datos.catPasaje);
        pri:=pri^.sig;
      end;
      insertarListaRegistro(pri2,r);
      cincoVuelosMasVendidos(pri2,vec);
      if (r.totPasajes>46) then insertarListaCodigos(pri3,codVueloAct);
      if (pri<>nil) then codVueloAct:=pri^.datos.codVuelo;
    end;
  end;
end;

procedure imprimirLista(pri:lista);
begin
  while (pri<>nil) do begin
    writeln('LISTA: ');
    writeln(pri^.datos.nom);
    writeln(pri^.datos.codVuelo);
    writeln(pri^.datos.catPasaje);
    writeln(pri^.datos.numAsiento);
    writeln(' ');
    pri:=pri^.sig;
  end;
end;

procedure imprimirListaRegistro(pri2:listaRegistro);
begin
  while (pri2<>nil) do begin
    writeln('LISTA REGISTROS: ');
    writeln(pri2^.datos.cod);
    writeln(pri2^.datos.totPasajes);
    writeln(pri2^.datos.totMont);
    writeln(' ');
    pri2:=pri2^.sig;
  end;
end;

procedure imprimirListaCodigos(pri3:listaCodigos);
begin
  while (pri3<>nil) do begin
    writeln('LISTA CODIGOS: ');
    writeln(pri3^.cod);
    writeln(' ');
    pri3:=pri3^.sig;
  end;
end;

procedure liberarMemoriaLista1(var pri:lista);
var
  aux:lista;
begin
  while (pri<>nil) do begin
    aux:=pri;
    pri:=pri^.sig;
    dispose(aux);
  end;
end;

procedure liberarMemoriaLista2(var pri2:listaRegistro);
var
  aux:listaRegistro;
begin
  while (pri2<>nil) do begin
    aux:=pri2;
    pri2:=pri2^.sig;
    dispose(aux);
  end;
end;

procedure liberarMemoriaLista3(var pri3:listaCOdigos);
var
  aux:listaCodigos;
begin
  while (pri3<>nil) do begin
    aux:=pri3;
    pri3:=pri3^.sig;
    dispose(aux);
  end;
end;

procedure imprimirVector(vec:max5Vendidos);
var
  i:integer;
begin
  writeln('El vector de los vuelos con las 5 mayores ventas es: ');
  for i:=1 to 5 do writeln('Posicion ',i,' de ventas: codigo ',vec[i].cod);
end;

var
  pri:lista;
  pri2:listaRegistro;
  pri3:listaCodigos;
  c:costoPasaje;
  v:venta;
  r:registro;
  vec:max5Vendidos;

begin
  cargarListaVentas(pri,v);
  imprimirLista(pri);
  cargarEstructuraCostoPasaje(c);
  cargarListaRegistros(pri,pri2,pri3,vec,c,r);
  imprimirListaRegistro(pri2);
  imprimirVector(vec);
  imprimirListaCodigos(pri3);
  liberarMemoriaLista1(pri);
  liberarMemoriaLista2(pri2);
  liberarMemoriaLista3(pri3);
  readln;
end.
