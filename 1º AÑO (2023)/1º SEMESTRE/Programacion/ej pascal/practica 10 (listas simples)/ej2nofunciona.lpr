program ej2nofunciona;

const
  fin = 0;

type
  lista = ^nodo;
  nodo = record
    dato:integer;
    sig:lista;
  end;

var
  l:lista;
  n:integer;

procedure cargar_lista(var l:lista; n:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:=n;
  nue^.sig:=l;
  l:=nue;
end;

function max_num_lista(l:lista):integer;
var
  max:integer;
  nue:lista;
  aux:integer;
begin
  max:=-1;
  nue:=l;
  while (nue <> nil) do
  begin
    aux:=nue^.dato;
    if aux > max then
    max:=aux;
    nue:=nue^.sig;
  end;
  max_num_lista:=max;
end;

function cantidad_dig_impar(l:lista):integer;
var
  cant_dig:integer;
  cant_dig_impar:integer;
  nue:lista;
  aux:integer;
begin
  cant_dig:=0;
  cant_dig_impar:=0;
  nue:=l;
  while (nue <> nil) do
  begin
    aux:=nue^.dato;
    while (aux <> 0) do
    begin
      aux:=aux div 10;
      cant_dig:=cant_dig+1;
    end;
    if (cant_dig mod 3 = 0) then
    cant_dig_impar:=cant_dig_impar+1;
    cant_dig:=0;
    nue:=nue^.sig;
  end;
  cantidad_dig_impar:=cant_dig_impar;
end;

procedure dos_ult_num_pares(l:lista);
var
  n1:integer;
  n2:integer;
  aux:integer;
  nue:lista;
begin
  nue:=l;
  n1:=0;
  n2:=0;
  while (nue <> nil) do
  begin
    aux:=nue^.dato;
    if (aux mod 2 = 0) then
    begin
      n2:=n1;
      n1:=aux;
    end;
    nue:=nue^.sig;
  end;
  writeln('Los dos ultimos numeros pares son: ',n2,' y ',n1);
end;

begin
  l:=nil;
  writeln('Ingrese un numero: ');
  readln(n);
  while n <> fin do
  begin
    cargar_lista(l,n);
    writeln('Ingrese un numero: ');
    readln(n);
  end;
  writeln('El mayor numero de la lista es: ',max_num_lista(l));
  writeln('La cantidad de numeros cuya cantidad de digitos es imapar es: ',cantidad_dig_impar(l));
  dos_ult_num_pares(l);
  readln;
end.

