program ej6sinterminar;

const
  max_cajas = 3;

type
  tickets = record
    nro_caja:integer;
    nro_ticket:integer;
    monto:integer;
  end;
  lista = ^nodo;
  nodo = record
    datos:tickets;
    sig:lista;
  end;
  lista_mont_1000 = ^nodo2;
  nodo2 = record
    datos:tickets;
    sig:lista_mont_1000;
  end;

var
  l:lista;
  l_1000:lista_mont_1000;
  caja:integer;
  caja_act:integer;
  ticket:integer;
  mont:integer;
  cumple:boolean;
  tot_tickets:integer;
  tot_monto:integer;

procedure leer_datos(var caja:integer; var ticket:integer; var mont:integer);
begin
  writeln('INGRESE DATOS DE TICKETS: ');
  writeln(' ');
  writeln('Ingrese el numero de caja: ');
  readln(caja);
  writeln('Ingrese el numero del ticket: ');
  readln(ticket);
  writeln('Ingrese el monto del ticket: ');
  readln(mont);
end;

procedure insertar_datos(var l:lista; caja:integer; ticket:integer; mont:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.datos.nro_caja:=caja;
  nue^.datos.nro_ticket:=ticket;
  nue^.datos.monto:=mont;
  nue^.sig:=l;
  l:=nue;
end;

procedure insertar_datos_montos_1000(var l_1000:lista_mont_1000; caja:integer; ticket:integer; mont:integer);
var
  nue:lista_mont_1000;
begin
  new(nue);
  nue^.datos.nro_caja:=caja;
  nue^.datos.nro_ticket:=ticket;
  nue^.datos.monto:=mont;
  nue^.sig:=l_1000;
  l_1000:=nue;
end;

procedure menor_1000(mont:integer; var cumple:boolean);
begin
  cumple:=false;
  if mont < 1000 then
  cumple:=true;
end;

procedure sumar_tickets_monto(var tot_tickets:integer; var tot_monto:integer; mont:integer);
begin
  tot_tickets:=tot_tickets+1;
  tot_monto:=tot_monto+mont;
end;

function mont_promedio(tot_tickets:integer; tot_monto:integer):real;
begin
  mont_promedio:=tot_monto/tot_tickets;
end;

procedure cargar_lista(var l:lista; var l_1000:lista_mont_1000);
begin
  l:=nil;
  l_1000:=nil;
  tot_tickets:=0;
  tot_monto:=0;
  caja_act:=0;
  leer_datos(caja,ticket,mont);
  caja:=caja_act;
  while (caja_act <= max_cajas) and (caja = caja_act) do
  begin
    sumar_tickets_monto(tot_tickets,tot_monto,mont);
    if (caja_act <> 0) and (caja_act <= max_cajas) then
    insertar_datos(l,caja,ticket,mont);
    menor_1000(mont,cumple);
    if (cumple = true) and (caja_act <> 0) and (caja_act <= max_cajas) then
    insertar_datos_montos_1000(l_1000,caja,ticket,mont);
    leer_datos(caja,ticket,mont);
    caja:=caja_act;
  end;
end;

procedure mostrar_lista(l:lista);
begin
  writeln('La lista es: ');
  while l <> nil do
  begin
    writeln('Nro. caja: ',l^.datos.nro_caja);
    writeln('Nro. ticket: ',l^.datos.nro_ticket);
    writeln('Monto del ticket: ',l^.datos.monto);
    l:=l^.sig;
  end;
end;

procedure mostrar_lista_montos_1000(l_1000:lista_mont_1000);
begin
  writeln('La lista de los tickets con montos menores a 1000 es: ');
  while l_1000 <> nil do
  begin
    writeln('Nro. caja: ',l_1000^.datos.nro_caja);
    writeln('Nro. ticket: ',l_1000^.datos.nro_ticket);
    writeln('Monto del ticket: ',l_1000^.datos.monto);
    l_1000:=l_1000^.sig;
  end;
end;

begin
  cargar_lista(l,l_1000);
  mostrar_lista(l);
  mostrar_lista_montos_1000(l_1000);
  readln;
end.
