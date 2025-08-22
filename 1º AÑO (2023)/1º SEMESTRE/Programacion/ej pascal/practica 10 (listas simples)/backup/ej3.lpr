program ej3;

const
  fin = 'xxx';

type
  cadena20 = string[20];
  lugares = record
    nombre:cadena20;
    pais:cadena20;
  end;
  lista = ^nodo;
  nodo = record
    datos:lugares;
    sig:lista;
  end;
  lista_lugares = ^nodo_lugares;
    nodo_lugares = record
      nombre:cadena20;
      sig:lista_lugares;
    end;

var
  l:lista;
  l_l:lista_lugares;
  n:cadena20;
  p:cadena20;

procedure cargar(var l:lista; n:cadena20; p:cadena20);
var
  nue:lista;
begin
  new(nue);
  nue^.datos.nombre:=n;
  nue^.datos.pais:=p;
  nue^.sig:=l;
  l:=nue;
end;

function longitud(l:lista):integer;
var
  nue:lista;
  long:integer;
begin
  nue:=l;
  long:=0;
  while (nue <> nil) do
  begin
    long:=long+1;
    nue:=nue^.sig;
  end;
  longitud:=long;
end;

function cant_veces_pais(l:lista; p:cadena20):integer;
var
  nue:lista;
  cant:integer;
begin
  nue:=l;
  cant:=0;
  while (nue <> nil) do
  begin
    if p = nue^.datos.pais then
    cant:=cant+1;
    nue:=nue^.sig;
  end;
  cant_veces_pais:=cant;
end;

procedure cargar_lista_lugares(var l_l:lista_lugares; n:cadena20);
var
  nue:lista_lugares;
begin
  new(nue);
  nue^.nombre:=n;
  nue^.sig:=l_l;
  l_l:=nue;
end;

procedure lista_lugares_turisticos(l:lista; var l_l:lista_lugares; p:cadena20);
var
  nue:lista;
  exito:boolean;
begin
  nue:=l;
  exito:=false;
  while (nue <> nil) and (not exito) do
  begin
    if p = nue^.datos.pais then
    begin
      exito:=true;
    end
    else
    begin
      nue:=nue^.sig;
    end;
  end;
  if exito then
  begin
    l_l:=nil;
    writeln('Ingrese un lugar del pais para insertar a la lista: ');
    readln(n);
    while (n <> fin) do
    begin
      cargar_lista_lugares(l_l,n);
      writeln('Ingrese un lugar del pais para insertar a la lista: ');
      readln(n);
    end;
  end;
end;

procedure agregar_final(var l_l:lista_lugares; p:cadena20);
var
  nue:lista_lugares;
  act:lista_lugares;
begin
  new(nue);
  nue^.nombre:=p;
  nue^.sig:=nil;
  if (l_l <> nil) then
  begin
    act:=l_l;
    while (act^.sig <> nil) do
    act:=act^.sig;
    act^.sig:=nue;
  end
  else
  begin
    l_l:=nue;
  end;
end;

begin
  l:=nil;
  writeln('Ingrese el nombre de un lugar turistico: ');
  readln(n);
  writeln('Ingrese el pais donde se encuentra: ');
  readln(p);
  while (n <> fin) and (p <> fin) do
  begin
    cargar(l,n,p);
    writeln('Ingrese el nombre de un lugar turistico: ');
    readln(n);
    writeln('Ingrese el pais donde se encuentra: ');
    readln(p);
  end;
  writeln('La longitud de la lista es: ',longitud(l));
  writeln('Ingrese un pais para saber cuantas veces esta en la lista: ');
  readln(p);
  writeln('La cantidad de veces que esta el pais en la lista es: ',cant_veces_pais(l,p));
  writeln('Ingrese un pais para crear una lista a partir de sus lugares turisticos: ');
  readln(p);
  lista_lugares_turisticos(l,l_l,p);
  writeln('Ingrese un lugar turistico para agregar al final de la lista: ');
  readln(p);
  agregar_final(l_l,p);
  readln;
end.
