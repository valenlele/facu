program ej1;

const
  fin = 999;

type
  lista = ^nodo;
  nodo = record
    dato:integer;
    sig:lista;
  end;

var
  pri:lista;
  num:integer;
  n:integer;

procedure cargar(var pri:lista; num:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:=num;
  nue^.sig:=pri;
  pri:=nue;
end;

function cant_tres_digitos(pri:lista):integer;
var
  tres_dig:integer;
  cant_dig:integer;
  nue:lista;
  aux:integer;
begin
  tres_dig:=0;
  nue:=pri;
  while (nue <> nil) do
  begin
    cant_dig:=0;
    aux:=nue^.dato;
    while (aux <> 0) do
    begin
      cant_dig:=cant_dig+1;
      aux:=aux div 10;
    end;
    if cant_dig = 3 then
    tres_dig:=tres_dig+1;
    nue:=nue^.sig;
  end;
  cant_tres_digitos:=tres_dig;
end;

function esta_en_lista(pri:lista; n:integer):boolean;
var
  exito:boolean;
  nue:lista;
begin
  exito:=false;
  nue:=pri;
  while (nue <> nil) and (exito = false) do
  begin
    if (nue^.dato = n) then
    begin
      exito:=true;
    end;
    nue:=nue^.sig;
  end;
  esta_en_lista:=exito;
end;

procedure liberar_lista(var pri:lista);
var
  aux:lista;
begin
  while (pri <> nil) do
  begin
    aux:=pri;
    pri:=pri^.sig;
    dispose(aux);
  end;
end;

begin
  pri:=nil;
  writeln('Ingrese un numero: ');
  readln(num);
  while num <> fin do
  begin
    cargar(pri,num);
    writeln('Ingrese un numero: ');
    readln(num);
  end;
  writeln('La cantidad de numeros con 3 digitos es: ',cant_tres_digitos(pri));
  writeln('Ingrese un numero para ver si esta o no en la lista: ');
  readln(n);
  if esta_en_lista(pri,n) then
  begin
    writeln('El numero se encuentra en la lista');
  end
  else
  begin
    writeln('El numero no se encuentra en la lista');
  end;
  liberar_lista(pri);
  readln;
end.

