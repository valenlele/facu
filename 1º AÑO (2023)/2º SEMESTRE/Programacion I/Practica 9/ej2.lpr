program ej2;

const
  fin=0;

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

function mayorNumeroLista(pri:lista):integer;
var
  max:integer;
begin
  max:=-1;
  while (pri<>nil) do begin
    if (pri^.num>max) then max:=pri^.num;
    pri:=pri^.sig;
  end;
  mayorNumeroLista:=max;
end;

function cantidadNumDigImpar(pri:lista):integer;
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
    if (cantDig mod 2<>0) then cant:=cant+1;
    pri:=pri^.sig;
  end;
  cantidadNumDigImpar:=cant;
end;

procedure dosUltNumPares(pri:lista);
var
  ant,ult:integer;
begin
  while (pri<>nil) do begin
    if (pri^.num mod 2=0) then begin
      ant:=ult;
      ult:=pri^.num;
    end;
    pri:=pri^.sig;
  end;
  write('Los dos ultimos numeros pares de la lista son: ',ant,' y ',ult);
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
  writeln('El mayor numero en la lista es: ',mayorNumeroLista(pri));
  writeln('La cantidad de numeros cuya cantidad de digitos es impar es: ',cantidadNumDigImpar(pri));
  dosUltNumPares(pri);
  liberarMemoria(pri);
  readln;
end.

