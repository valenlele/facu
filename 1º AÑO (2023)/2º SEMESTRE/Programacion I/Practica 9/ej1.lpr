program ej1;

const
  fin=999;

type
  lista=^nodo;
  nodo=record
    num:integer;
    sig:lista;
  end;

procedure agregarLista(var pri:lista; n:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.num:=n;
  nue^.sig:=pri;
  pri:=nue;
end;

function cantTresDig(pri:lista):integer;
var
  cant,cantDig,aux:integer;
begin
  cant:=0;
  while (pri<>nil) do begin
    cantDig:=0;
    aux:=pri^.num;
    while (aux<>0) do begin
      cantDig:=cantDig+1;
      aux:=aux div 10;
    end;
    if (cantDig=3) then cant:=cant+1;
    pri:=pri^.sig;
  end;
  cantTresDig:=cant;
end;

function estaEnLista(pri:lista; n:integer):boolean;
var
  esta:boolean;
begin
  esta:=false;
  while (pri<>nil) and (not esta) do begin
    if (pri^.num=n) then esta:=true;
    pri:=pri^.sig;
  end;
  estaEnLista:=esta;
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
  pri:lista;
  n:integer;

begin
  pri:=nil;
  write('Ingrese un numero para ingresar en la lista: ');
  readln(n);
  while (n<>fin) do begin
    agregarLista(pri,n);
    write('Ingrese un numero para ingresar en la lista: ');
    readln(n);
  end;
  writeln('La cantidad de numeros con tres digitos en la lista es: ',cantTresDig(pri));
  write('Ingrese un numero para saber si esta en la lista: ');
  readln(n);
  if (estaEnLista(pri,n)) then write('El numero esta en la lista')
  else write('El numero no esta en la lista');
  liberarMemoria(pri);
  readln;
end.

