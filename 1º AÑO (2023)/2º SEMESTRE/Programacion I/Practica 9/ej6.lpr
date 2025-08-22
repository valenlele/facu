program ej6;

const
  maxCaja=6;

type
  rangoCaja=0..6;
  ticket=record
    numeroCaja:rangoCaja;
    numeroTicket,monto:integer;
  end;
  lista=^nodo;
  nodo=record
    datos:ticket;
    sig:lista;
  end;
  caja=record
    cant,tot:integer;
  end;
  vectorCajas=array[rangoCaja] of caja;
  conjuntoCajas=set of 1..6;

procedure leerInfo(var tick:ticket);
begin
  writeln('INGRESE INFORMACION DE UN TICKET: ');
  write('Numero de caja: ');
  readln(tick.numeroCaja);
  if (tick.numeroCaja<>-0) then begin
    write('Numero de ticket: ');
    readln(tick.numeroTicket);
    write('Monto: ');
    readln(tick.monto);
  end;
end;

procedure insertarLista(var pri:lista; var tick:ticket);
var
  nue,pos:lista;
begin
  new(nue);
  nue^.datos.numeroCaja:=tick.numeroCaja;
  nue^.datos.numeroTicket:=tick.numeroTicket;
  nue^.datos.monto:=tick.monto;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else begin
    pos:=pri;
    while (pos^.sig<>nil) do pos:=pos^.sig;
    pos^.sig:=nue;
  end;
end;

procedure cargarLista(var pri:lista; var tick:ticket);
begin
  pri:=nil;
  leerInfo(tick);
  while (tick.numeroCaja<>0) do begin
    insertarLista(pri,tick);
    leerInfo(tick);
  end;
end;

procedure listaMontosMen1000(var pri2:lista; pri:lista);
begin
  pri2:=nil;
  while (pri<>nil) do begin
    if (pri^.datos.monto<1000) then insertarLista(pri2,pri^.datos);
    pri:=pri^.sig;
  end;
end;

procedure montoPromedioCaja(var vecCajas:vectorCajas; pri:lista);
var
  i:rangoCaja;
begin
  for i:=1 to maxCaja do begin
    vecCajas[i].cant:=0;
    vecCajas[i].tot:=0;
  end;
  while (pri<>nil) do begin
    vecCajas[pri^.datos.numeroCaja].cant:=vecCajas[pri^.datos.numeroCaja].cant+1;
    vecCajas[pri^.datos.numeroCaja].tot:=vecCajas[pri^.datos.numeroCaja].tot+pri^.datos.monto;
    pri:=pri^.sig;
  end;
  for i:=1 to maxCaja do if (vecCajas[i].cant<>0) then writeln('El monto promedio recaudado en la caja ',i,' es: ',vecCajas[i].tot/vecCajas[i].cant:2:2);
end;

procedure insertarLista3(var pri3:lista; pri:lista; conj:conjuntoCajas);
begin
  while (pri<>nil) do begin
    if (pri^.datos.numeroCaja in conj) then insertarLista(pri3,pri^.datos);
    pri:=pri^.sig;
  end;
end;

procedure mas12000menos100(var pri3:lista; pri:lista; vecCajas:vectorCajas; var conj:conjuntoCajas);
var
  i:integer;
begin
  pri3:=nil;
  conj:=[];
  for i:=1 to maxCaja do if (vecCajas[i].tot>12000) and (vecCajas[i].cant<100) then conj:=conj+[i];
  insertarLista3(pri3,pri,conj);
end;

procedure imprimirLista(pri:lista);
begin
  writeln('LISTA: ');
  while (pri<>nil) do begin
    writeln('Numero de caja: ',pri^.datos.numeroCaja);
    writeln('Numero de ticket: ',pri^.datos.numeroTicket);
    writeln('Monto: ',pri^.datos.monto);
    pri:=pri^.sig;
  end;
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
  pri,pri2,pri3:lista;
  tick:ticket;
  vecCajas:vectorCajas;
  conj:conjuntoCajas;

begin
  cargarLista(pri,tick);
  listaMontosMen1000(pri2,pri);
  writeln(' ');
  imprimirLista(pri);
  writeln(' ');
  imprimirLista(pri2);
  montoPromedioCaja(vecCajas,pri);
  mas12000menos100(pri3,pri,vecCajas,conj);
  writeln(' ');
  imprimirLista(pri3);
  liberarMemoria(pri);
  liberarMemoria(pri2);
  liberarMemoria(pri3);
  readln;
end.
