program ej7;

const
  maxCat=10;
  fin='zzz';

type
  rangoCat=1..maxCat;
  rangoMes=1..12;
  vecMontoXmes=array[rangoMes] of real;
  factura=record
    cod:string;
    cat:rangoCat;
    m3,mont:real;
    montoXmes:vecMontoxMes;
  end;
  lista=^nodo;
  nodo=record
    datos:factura;
    sig:lista;
  end;

  nomYm3=record
    nom:string;
    m3:real;
  end;

  nombresYm3Categoria=array[rangoCat] of nomYm3;

procedure leerInfoFactura(var f:factura);
var
  i:rangoMes;
begin
  with f do begin
    writeln('INGRESE INFORMACION DE UNA FACTURA: ');
    write('Codigo de cliente: ');
    readln(cod);
    if (cod<>fin) then begin
      write('Categoria de consumo: ');
      readln(cat);
      write('Metros cubicos consumidos: ');
      readln(m3);
      write('Monto total de la factura: ');
      readln(mont);
      writeln('Monto facturado durante los 12 meses del anio anterior: ');
      for i:=1 to 12 do begin
        write('Mes ',i,': ');
        readln(montoXmes[i]);
      end;
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var pri,ult:lista; f:factura);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=f;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarLista(var pri,ult:lista); //se dispone enunciado
var
  f:factura;
begin
  leerInfoFactura(f);
  while (f.cod<>fin) do begin
    insertarFinal(pri,ult,f);
    leerInfoFactura(f);
  end;
end;

procedure cargarNombresCategoria(var n_m3_c:nombresYm3Categoria);
var
  i:rangoCat;
begin
  writeln('CARGA DE NOMBRES DE CATEGORIAS: ');
  for i:=1 to maxCat do begin
    write('Ingrese el nombre de la categoria ',i,': ');
    readln(n_m3_c[i].nom);
  end;
end;

procedure insertarOrdenado(var pri:lista; f:factura);
var
  nue,ant,act:lista;
begin
  new(nue);
  nue^.datos:=f;
  ant:=nil;
  act:=nil;
  while (act<>nil) and (pri^.datos.cod>act^.datos.cod) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

function promAnio(montoXmes:vecMontoXmes):real;
var
  i:rangoMes;
  montTot:real;
begin
  montTot:=0;
  for i:=1 to 12 do montTot:=montTot+montoXmes[i];
  promAnio:=montTot/12;
end;

procedure inicializarM3(var n_m3_c:nombresYm3Categoria);
var
  i:rangoCat;
begin
  for i:=1 to maxCat do n_m3_c[i].m3:=0;
end;

procedure insertarM3(var n_m3_c:nombresYm3Categoria; cat:rangoCat; m3:real);
begin
  n_m3_c[cat].m3:=n_m3_c[cat].m3+m3;
end;

procedure informarM3xCat(n_m3_c:nombresYm3Categoria);
var
  i:rangoCat;
begin
  for i:=1 to maxCat do begin
    writeln('El consumo de la categoria ',n_m3_c[i].nom,' fue: ',n_m3_c[i].m3:2:2);
  end;
end;

procedure recorrerLista(pri:lista; var lSinRev,lRev,lRefact:lista; var n_m3_c:nombresYm3Categoria);
begin
  while (pri<>nil) do begin
    if (pri^.datos.mont<promAnio(pri^.datos.montoXmes)) then insertarOrdenado(lSinRev,pri^.datos)
    else if (pri^.datos.mont>promAnio(pri^.datos.montoXmes)) and (pri^.datos.m3>1000) then insertarOrdenado(lRev,pri^.datos)
    else if (pri^.datos.mont>promAnio(pri^.datos.montoXmes)) and (pri^.datos.m3<1000) then insertarOrdenado(lRefact,pri^.datos);
    insertarM3(n_m3_c,pri^.datos.cat,pri^.datos.m3);
    pri:=pri^.sig;
  end;
  informarM3xCat(n_m3_c);
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
  pri,ult,lSinRev,lRev,lRefact:lista;
  n_m3_c:nombresYm3Categoria;

begin
  pri:=nil;
  lSinRev:=nil;
  lRev:=nil;
  lRefact:=nil;
  cargarLista(pri,ult); //se dispone enunciado
  writeln(' ');
  cargarNombresCategoria(n_m3_c);
  inicializarM3(n_m3_c);
  recorrerLista(pri,lSinRev,lRev,lRefact,n_m3_c);
  liberarMemoria(pri);
  liberarMemoria(lSinRev);
  liberarMemoria(lRev);
  liberarMemoria(lRefact);
  readln;
end.
