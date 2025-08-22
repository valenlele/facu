program parcial_13_11_2023;

const
  maxDias=30;
  maxPersonas=10;
  maxCabania=8;
  fin=-1;

type
  rangoDias=0..maxDias;
  rangoPersonas=1..maxPersonas;
  rangoCabania=1..maxCabania;

  rFecha=record
    dia:rangoDias;
    mes:1..12;
    anio:1990..2023;
  end;

  estadia=record
    cod:integer;
    nom:string;
    fecha:rFecha;
    cantDias:rangoDias;
    cantPersonas:rangoPersonas;
    tCabania:rangoCabania;
  end;

  tablaPrecios=array[rangoPersonas,rangoDias] of real;

  lista=^nodo;
  nodo=record
    datos:estadia;
    sig:lista;
  end;

  listasCabanias=array[rangoCabania] of lista;

procedure cargarTablaPrecios(var tp:tablaPrecios);  //se dispone enunciado
var
  i:rangoPersonas;
  j:rangoDias;
begin
  writeln('CARGA LISTA PRECIOS: ');
  for i:=1 to maxPersonas do begin
    for j:=1 to maxDias do begin
      write('Ingrese el precio para ',i,' personas y ',j,' dia(s): ');
      readln(TP[i,j]);
    end;
  end;
end;

procedure leerInfoEstadia(var e:estadia);
begin
  writeln('INGRESE INFORMACION DE ESTADIA: ');
  write('Codigo: ');
  readln(e.cod);
  if (e.cod<>fin) then begin
    write('Nombre del cliente: ');
    readln(e.nom);
    writeln('Fecha(dia/mes/anio): ');
    read(e.fecha.dia); write('/'); read(e.fecha.mes); write('/'); read(e.fecha.anio);
    write('Cantidad de dias: ');
    readln(e.cantDias);
    write('Cantidad de personas: ');
    readln(e.cantPersonas);
    write('Tipo de cabana: ');
    readln(e.tCabania);
  end;
end;

procedure insertarOrdenado(var pri:lista; e:estadia);
var
  nue,ant,act:lista;
begin
  new(nue);
  nue^.datos:=e;
  ant:=pri;
  act:=pri;
  while (act<>nil) and (e.nom>act^.datos.nom) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarListaEstadias(var pri:lista);  //se dispone enunciado
var
  e:estadia;
begin
  leerInfoEstadia(e);
  while (e.cod<>fin) do begin
    insertarOrdenado(pri,e);
    leerInfoEstadia(e);
  end;
end;

procedure sumarTotDiasCliente(var totDiasCliente:integer; dias:rangoDias);
begin
  totDiasCliente:=totDiasCliente+dias;
end;

procedure sumarGastoCliente(var totGastoCliente:real; tp:tablaPrecios; dias:rangoDias; personas:rangoPersonas);
begin
  totGastoCliente:=totGastoCliente+tp[dias,personas];
end;

procedure dosClientesMayorGasto(totGastoCliente:real; cliente:string; var maxC1,maxC2:string; var maxG1,maxG2:real);
begin
  if (totGastoCliente>maxG1) then begin
    maxC2:=maxC1;
    maxG2:=maxG1;
    maxC1:=cliente;
    maxG2:=totGastoCliente;
  end
  else if (totGastoCliente>maxG2) then begin
    maxC2:=cliente;
    maxG2:=totGastoCliente;
  end;
end;

function sumaDigitosDias(dias:rangoDias):integer;
begin
  sumaDigitosDias:=0;
  while (dias<>0) do begin
    sumaDigitosDias:=sumaDigitosDias+dias mod 10;
    dias:=dias div 10;
  end;
end;

function sumaDigitosCodigo(cod:integer):integer;
begin
  sumaDigitosCodigo:=0;
  while (cod<>0) do begin
    sumaDigitosCodigo:=sumaDigitosCodigo+cod mod 10;
    cod:=cod div 10;
  end;
end;

procedure inicializarListasCabanias(var lc:listasCabanias);
var
  i:rangoCabania;
begin
  for i:=1 to maxCabania do lc[i]:=nil;
end;

procedure insertarFinal(var lc:lista; var ult:lista; e:estadia);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=e;
  nue^.sig:=nil;
  if (lc=nil) then lc:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure recorrerLista(pri:lista; tp:tablaPrecios; var lc:listasCabanias; var ult:lista);
var
  clienteAct,maxC1,maxC2:string;
  totDiasCliente:integer;
  totGastoCliente,maxG1,maxG2:real;
begin
  maxG1:=-1;
  maxG2:=-1;
  inicializarListasCabanias(lc);
  while (pri<>nil) do begin
    clienteAct:=pri^.datos.nom;
    totDiasCliente:=0;
    totGastoCliente:=0;
    while (pri<>nil) and (pri^.datos.nom=clienteAct) do begin
      sumarTotDiasCliente(totDiasCliente,pri^.datos.cantDias);
      sumarGastoCliente(totGastoCliente,tp,pri^.datos.cantDias,pri^.datos.cantPersonas);
      if (sumaDigitosDias(pri^.datos.cantDias)=sumaDigitosCodigo(pri^.datos.cod)) then writeln('El cliente con codigo de estadia ',pri^.datos.cod,' de nombre ',pri^.datos.nom,' es legible para el descuento');
      insertarFinal(lc[pri^.datos.tCabania],ult,pri^.datos);
      pri:=pri^.sig;
    end;
    writeln('La suma total de dias de todas las estadias del cliente ',clienteAct,' es: ',totDiasCliente);
    dosClientesMayorGasto(totGastoCliente,clienteAct,maxC1,maxC2,maxG1,maxG2);
  end;
  writeln('Los dos clientes que mas gastaron fueron: ',maxC1,' y ',maxC2);
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

procedure liberarMemoriaListasCabanias(var lc:listasCabanias);
var
  i:integer;
  aux:lista;
begin
  for i:=1 to maxCabania do begin
    while (lc[i]<>nil) do begin
      aux:=lc[i];
      lc[i]:=lc[i]^.sig;
      dispose(aux);
    end;
  end;
end;

var
  tp:tablaPrecios;
  pri,ult:lista;
  lc:listasCabanias;

begin
  pri:=nil;
  cargarTablaPrecios(tp);
  cargarListaEstadias(pri);
  recorrerLista(pri,tp,lc,ult);
  liberarMemoria(pri);
  liberarMemoriaListasCabanias(lc);
  readln;
end.
