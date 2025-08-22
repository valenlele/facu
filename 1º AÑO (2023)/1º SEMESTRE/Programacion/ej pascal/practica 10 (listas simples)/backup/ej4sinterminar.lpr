program ej4sinterminar;

const
  fin = 'xxx';

type
  cadena20 = string[20];
  aviones = record
    marca:cadena20;
    modelo:cadena20;
    cant_asientos:integer;
  end;
  lista = ^nodo;
  nodo = record
    datos:aviones;
    sig:lista;
  end;

var
  l:lista;
  ma:cadena20;
  mo:cadena20;
  cant:integer;
  exito:boolean;

procedure leer_datos(var ma:cadena20; var mo:cadena20; var cant:integer);
begin
  writeln('Ingrese la marca del avion: ');
  readln(ma);
  writeln('Ingrese el modelo del avion: ');
  readln(mo);
  writeln('Ingrese la cantidad de asientos del avion: ');
  readln(cant);
end;

procedure insertar_ordenado(var l:lista; ma:cadena20; mo:cadena20; cant:integer); {se almacenan en lista de forma ordenada}
var
  nue:lista;{nodo de datos a insertar}
  act:lista; {nodo posterior a nue}
  ant:lista; {nodo anterior a nue}
begin
  new(nue); {se reserva memoria dinamica}
  nue^.datos.marca:=ma;
  nue^.datos.modelo:=mo;
  nue^.datos.cant_asientos:=cant;
  act:=l;
  ant:=l;
  while (act <> nil) and (nue^.datos.marca < act^.datos.marca) do {se compara con la marca actual de la lista}
  begin
    ant:=act;
    act:=act^.sig; {siguiente nodo}
  end;
  {termina el while}
  if (ant = act) then l:=nue {si ni se entro al while el nuevo nodo va al principio}
  else ant^.sig:=nue; {va entre dos nodos o al final}
  nue^.sig:=act;
end;

procedure cargar_lista(var l:lista);
begin
  l:=nil;
  repeat
    leer_datos(ma,mo,cant);
    if ma <> fin then
    insertar_ordenado(l,ma,mo,cant);
  until ma = fin;
end;

procedure eliminar_avion(var l:lista; ma:cadena20; mo:cadena20; cant:integer; var exito:boolean);
var
  ant:lista;
  act:lista;
begin
  exito:=false;
  act:=l;
  while (act <> nil) and ((act^.datos.marca <> ma) and (act^.datos.modelo <> mo) and (act^.datos.cant_asientos <> cant)) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if act <> nil then
  begin
    exito:=true;
  if (act = l) then l:=act^.sig
  else ant^.sig:=act^.sig;
  dispose(act);
  end;
end;

procedure imprimir_lista(l:lista);
begin
  while l <> nil do
  begin
    writeln('Marca: ',l^.datos.marca);
    writeln('Modelo: ',l^.datos.modelo);
    writeln('Cantidad de asientos: ',l^.datos.cant_asientos);
    l:=l^.sig;
  end;
end;

begin
  cargar_lista(l);
  imprimir_lista(l);
  writeln('Ingrese un avion para insertar ordenadamente en la lista: ');
  leer_datos(ma,mo,cant);
  if ma <> fin then
  insertar_ordenado(l,ma,mo,cant);
  imprimir_lista(l);
  writeln('Ingrese otro avion para eliminarlo si se encuentra en la lista: ');
  leer_datos(ma,mo,cant);
  eliminar_avion(l,ma,mo,cant,exito);
  if exito = true then
  writeln('El avion ha sido eliminado: ')
  else writeln('El avion no ha sido eliminado');
  imprimir_lista(l);
  readln;
end.
