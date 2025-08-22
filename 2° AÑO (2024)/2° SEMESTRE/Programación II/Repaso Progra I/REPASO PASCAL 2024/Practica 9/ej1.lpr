program ej1;

type
  lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
  end;

procedure insertarFinal(var l:lista; num:integer);
var
  nue,act:lista;
begin
  new(nue);
  nue^.datos:=num;
  nue^.sig:=nil;
  if (l<>nil) then begin
    act:=l;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else l:=nue;
end;

procedure cargarLista(var l:lista);
var
  num:integer;
begin
  write('Ingrese un numero: ');
  readln(num);
  while (num<>999) do begin
    insertarFinal(l,num);
    write('Ingrese un numero: ');
    readln(num);
  end;
end;

function tieneTresDig(num:integer):boolean;
var
  cantDig:integer;
begin
  tieneTresDig:=false;
  cantDig:=0;
  while (num<>0) do begin
    cantDig:=cantDig+1;
    num:=num div 10;
  end;
  if (cantDig=3) then tieneTresDig:=true;
end;

function cantTresDig(l:lista):integer;
begin
  cantTresDig:=0;
  while (l<>nil) do begin
    if (tieneTresDig(l^.datos)) then cantTresDig:=cantTresDig+1;
    l:=l^.sig;
  end;
end;

function estaEnLista(l:lista; n:integer):boolean;
begin
  estaEnLista:=false;
  while (l<>nil) and (l^.datos<>n) do l:=l^.sig;
  if (l<>nil) then estaEnLista:=true;
end;

procedure liberarMemoria(var l:lista);
var
  aux:lista;
begin
  while (l<>nil) do begin
    aux:=l;
    l:=l^.sig;
    dispose(aux);
  end;
end;

procedure imprimirLista(l:lista);
begin
  writeln('LISTA: ');
  while (l<>nil) do begin
    writeln(l^.datos);
    l:=l^.sig;
  end;
end;

var
  l:lista;
  n:integer;

begin
  l:=nil;
  cargarLista(l);
  writeln(' ');
  //imprimirLista(l);
  write('La cantidad de numeros en la lista que tienen 3 digitos es: ',cantTresDig(l));
  writeln(' ');
  write('Ingrese un numero para saber si esta o no en la lista: ');
  readln(n);
  if (estaEnLista(l,n)) then write('El numero esta en la lista')
  else write('El numero no esta en la lista');
  liberarMemoria(l);
  //imprimirLista(l);
  readln;
end.
