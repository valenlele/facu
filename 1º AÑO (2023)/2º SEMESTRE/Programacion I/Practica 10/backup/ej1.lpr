program ej1;

const
  fin=-1;
  maxCodImpuestos=9;

type
  rangoCodImpuestos=1..maxCodImpuestos;
  cliente=record
    dni:integer;
    nomYap:string;
    cod:rangoCodImpuestos;
    mont:real;
  end;

  lista=^nodo;
  nodo=record
    datos:cliente;
    sig:lista;
  end;

  vecCodImpuestos=array[rangoCodImpuestos] of integer;

procedure leerInfoClientes(var c:cliente);
begin
  writeln('INGRESE INFORMACION DE UN CLIENTE: ');
  write('DNI: ');
  readln(c.dni);
  if (c.dni<>fin) then begin
    write('Nombre y apellido: ');
    readln(c.nomYap);
    write('Codigo de impuesto a pagar: ');
    readln(c.cod);
    write('Monto a pagar: ');
    readln(c.mont);
  end;
end;

procedure insertarFinal(var pri,ult:lista; c:cliente);
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
  leerInfoClientes(c);
  while (c.dni<>fin) do begin
    insertarFinal(pri,ult,c);
    leerInfoClientes(c);
  end;
end;

procedure imprimirLista(pri:lista);
begin
  writeln('NOMBRE Y APELLIDO: ',pri^.datos.nomYap);
  writeln('CODIGO DE IMPUESTO A PAGAR: ',pri^.datos.cod);
  writeln('MONTO A PAGAR: ',pri^.datos.mont:2:2);
end;

procedure inicializarVectorCodigoImpuestos(var vci:vecCodImpuestos);
var
  i:rangoCodImpuestos;
begin
  for i:=1 to maxCodImpuestos do vci[i]:=0;
end;

procedure insertarVecCodImpuestos(var vci:vecCodImpuestos; cod:rangoCodImpuestos);
begin
  vci[cod]:=vci[cod]+1;
end;

procedure atencionClientes(pri:lista; var vci:vecCodImpuestos);
var
  totMont:real;
  sinAtender:integer;
begin
  totMont:=0;
  sinAtender:=0;
  inicializarVectorCodigoImpuestos(vci);
  writeln('ATENCION DE CLIENTES: ');
  writeln(' ');
  while (pri<>nil) and (totMont<100000) do begin
    writeln('CLIENTE CON DNI ',pri^.datos.dni,': ');
    imprimirLista(pri);
    totMont:=totMont+pri^.datos.mont;
    insertarVecCodImpuestos(vci,pri^.datos.cod);
    writeln(' ');
    pri:=pri^.sig;
  end;
  if (totMont>=100000) then begin
    writeln('La recaudacion total llego a 100000 pesos');
    while (pri<>nil) do begin
      sinAtender:=sinAtender+1;
      pri:=pri^.sig;
    end;
  end;
  writeln('La cantidad de clientes que quedaron sin atender es: ',sinAtender)
end;

procedure informarMaxCodImpuestos(vci:vecCodImpuestos);
var
  i,maxCod:rangoCodImpuestos;
  maxCant:integer;
begin
  maxCant:=-1;
  for i:=1 to maxCodImpuestos do begin
    if (vci[i]>maxCant) then begin
      maxCant:=vci[i];
      maxCod:=i;
    end;
  end;
  writeln('El codigo de impuesto que mas veces se pago es: ',maxCod);
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
  vci:vecCodImpuestos;

begin
  pri:=nil;
  cargarListaClientes(pri,ult); //se dispone enunciado
  atencionClientes(pri,vci);
  informarMaxCodImpuestos(vci);
  liberarMemoria(pri);
  readln;
end.
