program ej4;

const
  fin=0;
  maxCalle=122;

type
  rangoMes=1..12;
  rFecha=record
    dia:0..31;
    mes:rangoMes;
  end;
  rangoCalle=1..maxCalle;
  rDirec=record
    calle:rangoCalle;
    num:integer;
    piso:integer;
    dep:string;
  end;

  paquete=record
    fecha:rFecha;
    entregado:boolean;
    direc:rDirec;
  end;

  lista=^nodo;
  nodo=record
    datos:paquete;
    sig:lista;
  end;

  vecEnviosCalle=array[rangoCalle] of integer;

  vecPaquetesMes=array[rangoMes] of integer;

  rangoListas=11..20;
  listas_11_20=array[rangoListas] of lista;

procedure leerInfoPaquete(var p:paquete);
var
  resp:string;
begin
  with p do begin
    writeln('INGRESE INFORMACION DE UN PAQUETE: ');
    writeln('Fecha de envio: ');
    write('Dia: ');
    readln(fecha.dia);
    if (fecha.dia<>fin) then begin
      write('Mes: ');
      readln(fecha.mes);
      writeln('¿Pudo ser entregado al destinatario?: ');
      read(resp);
      if (resp='si') then entregado:=true
      else if (resp='no') then entregado:=false;
      writeln('Direccion: ');
      write('Calle: ');
      readln(direc.calle);
      write('Numero: ');
      readln(direc.num);
      write('Piso: ');
      readln(direc.piso);
      write('Departamento: ');
      readln(direc.dep);
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var pri,ult:lista; p:paquete);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=p;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarLista(var pri,ult:lista); //se dispone enunciado
var
  p:paquete;
begin
  leerInfoPaquete(p);
  while (p.fecha.dia<>fin) do begin
    insertarFinal(pri,ult,p);
    leerInfoPaquete(p);
  end;
end;

procedure inicializarVecEnviosCalle(var enviosCalle:vecEnviosCalle);
var
  i:rangoCalle;
begin
  for i:=1 to maxCalle do enviosCalle[i]:=0;
end;

procedure insertarVecEnviosCalle(var enviosCalle:vecEnviosCalle; calle:rangoCalle);
begin
  enviosCalle[calle]:=enviosCalle[calle]+1;
end;

procedure informarVecEnviosCalle(enviosCalle:vecEnviosCalle);
var
  i:rangoCalle;
begin
  for i:=1 to maxCalle do writeln('Cantidad de envios realizados para la calle: ',i,': ',enviosCalle[i]);
end;

procedure inicializarVecPaquetesMes(var paquetesMes:vecPaquetesMes);
var
  i:rangoMes;
begin
  for i:=1 to 12 do paquetesMes[i]:=0;
end;

procedure insertarVecPaquetesMes(var paquetesMes:vecPaquetesMes; mes:rangoMes);
begin
  paquetesMes[mes]:=paquetesMes[mes]+1;
end;

procedure calcularInformarMaxMes(paquetesMes:vecPaquetesMes);
var
  i,maxMes:rangoMes;
  maxPaquetes:integer;
begin
  maxPaquetes:=-1;
  for i:=1 to 12 do begin
    if (paquetesMes[i]>maxPaquetes) then begin
      maxPaquetes:=paquetesMes[i];
      maxMes:=i;
    end;
  end;
  case maxMes of
    1:writeln('El mes con mayor cantidad de paquetes enviados es enero');
    2:writeln('El mes con mayor cantidad de paquetes enviados es febrero');
    3:writeln('El mes con mayor cantidad de paquetes enviados es marzo');
    4:writeln('El mes con mayor cantidad de paquetes enviados es abril');
    5:writeln('El mes con mayor cantidad de paquetes enviados es mayo');
    6:writeln('El mes con mayor cantidad de paquetes enviados es junio');
    7:writeln('El mes con mayor cantidad de paquetes enviados es julio');
    8:writeln('El mes con mayor cantidad de paquetes enviados es agosto');
    9:writeln('El mes con mayor cantidad de paquetes enviados es septiembre');
    10:writeln('El mes con mayor cantidad de paquetes enviados es octubre');
    11:writeln('El mes con mayor cantidad de paquetes enviados es noviembre');
    12:writeln('El mes con mayor cantidad de paquetes enviados es diciembre');
  end;
end;

procedure eliminar(var pri:lista; p:paquete);
var
  ant,act:lista;
begin
  ant:=pri;
  act:=pri;
  while (act<>nil) and (act^.datos.direc.calle<>p.direc.calle) and (act^.datos.direc.num<>p.direc.num) and (act^.datos.direc.piso<>p.direc.piso) and (act^.datos.direc.dep<>p.direc.dep) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act<>nil) then begin
    if (pri=act) then pri:=act^.sig
    else ant^.sig:=act^.sig;
    dispose(act);
  end;
end;

procedure inicializarListas(var l_11_20:listas_11_20);
var
  i:rangoListas;
begin
  for i:=11 to 20 do l_11_20[i]:=nil;
end;

procedure insertarOrdenado(var pri:lista; p:paquete);
var
  nue,ant,act:lista;
begin
  new(nue);
  nue^.datos:=p;
  ant:=pri;
  act:=pri;
  while (act<>nil) and (p.direc.num>act^.datos.direc.num) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure recorrerLista(var pri:lista; var enviosCalle:vecEnviosCalle; var paquetesMes:vecPaquetesMes; var l_11_20:listas_11_20);
var
  aux:lista;
begin
  aux:=pri;
  while (aux<>nil) do begin
    insertarVecEnviosCalle(enviosCalle,aux^.datos.direc.calle);
    insertarVecPaquetesMes(paquetesMes,aux^.datos.fecha.mes);
    if (aux^.datos.direc.calle>=11) and (aux^.datos.direc.calle<=20) then insertarOrdenado(l_11_20[aux^.datos.direc.calle],aux^.datos);
    if (aux^.datos.entregado=false) then eliminar(pri,aux^.datos);
    aux:=aux^.sig;
  end;
  informarVecEnviosCalle(enviosCalle);
  writeln(' ');
  calcularInformarMaxMes(paquetesMes);
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

procedure liberarMemoriaListas(var l_11_20:listas_11_20);
var
  aux:lista;
  i:rangoListas;
begin
  for i:=11 to 20 do begin
    while (l_11_20[i]<>nil) do begin
      aux:=l_11_20[i];
      l_11_20[i]:=l_11_20[i]^.sig;
      dispose(aux);
    end;
  end;
end;

var
  pri,ult:lista;
  enviosCalle:vecEnviosCalle;
  paquetesMes:vecPaquetesMes;
  l_11_20:listas_11_20;

begin
  pri:=nil;
  cargarLista(pri,ult); //se dispone enunciado
  inicializarVecEnviosCalle(enviosCalle);
  inicializarVecPaquetesMes(paquetesMes);
  inicializarListas(l_11_20);
  recorrerLista(pri,enviosCalle,paquetesMes,l_11_20);
  liberarMemoria(pri);
  liberarMemoriaListas(l_11_20);
  readln;
end.

