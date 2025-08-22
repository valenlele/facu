program ej8;

const
  fin = -1;

type
  cadena20 = string[20];
  info = record
    codEmp:integer;
    apellido:cadena20;
    nom:cadena20;
    prof:cadena20;
    codDep:integer;
    sueldo:integer;
    ant:integer;
  end;
  lista = ^nodo;
  nodo = record
    datos:info;
    sig:lista;
  end;

var
  l:lista;
  datos:info;

procedure leerInfo(var datos:info);
begin
  writeln('Ingrese el codigo del empleado: ');
  readln(datos.codEmp);
  if datos.codEmp<> fin then
  begin
    writeln('Ingrese el apellido del empleado: ');
    readln(datos.apellido);
    writeln('Ingrese el nombre del empleado: ');
    readln(datos.nom);
    writeln('Ingrese la profesion del empleado: ');
    readln(datos.prof);
    writeln('Ingrese el codigo del departamento: ');
    readln(datos.codDep);
    writeln('Ingrese el sueldo del empleado: ');
    readln(datos.sueldo);
    writeln('Ingrese la antiguedad del empleado: ');
    readln(datos.ant);
  end;
end;

procedure cargarLista(var l:lista; datos:info);
var
  nue,act,ant:lista;
begin
  new(nue);
  act:=l;
  ant:=l;
  nue^.datos:=datos;
  while (act <> nil) and (act^.datos.codEmp < datos.codEmp) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if act = ant then l:=nue {se inserta el dato en el primer nodo}
  else ant^.sig:=nue; {se inserta entre dos nodos o al final}
  nue^.sig:=act; {se avanza en la lista}
end;

procedure ingresarNuevoEmpleado(var l:lista; datos:info);
begin
  cargarLista(l,datos);
end;

function existe(l:lista; dep:integer):boolean;
begin
  existe:=false;
  while (l <> nil) and (not existe) do
  begin
    if l^.datos.codDep <> dep then l:=l^.sig
    else existe:=true;
  end;
end;

procedure eliminarDep4o10(var l:lista);
var ant,act:lista;
begin
  while existe(l,4) or existe(l,10) do
  begin
    act:=l; {si existe, apunta al primer nodo de la lista}
    while (act <> nil) and ((act^.datos.codDep <> 4) or (act^.datos.codDep <> 10)) do
    begin
      ant:=act;
      act:=act^.sig;
    end;
    if act <> nil then {si no se llego al fin}
    begin
      if act = l then act:=act^.sig
      else ant^.sig:=act^.sig;
      dispose(act);
    end;
  end;
end;

begin
  leerInfo(datos);
  while datos.codEmp <> fin do
  begin
    cargarLista(l,datos);
    leerInfo(datos);
  end;
  writeln('Ingrese la informacion de un nuevo empleado: ');
  leerInfo(datos);
  ingresarNuevoEmpleado(l,datos);
  eliminarDep4o10(l);
end.

