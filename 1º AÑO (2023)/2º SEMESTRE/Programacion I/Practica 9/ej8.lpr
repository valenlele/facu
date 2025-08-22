program ej8;

const
  fin=-1;

type
  empleado=record
    cod,dep,sueldo,ant:integer;
    ap,nom,prof:string;
  end;
  lista=^nodo;
  nodo=record
    datos:empleado;
    sig:lista;
  end;

procedure leerInfoEmpleado(var e:empleado);
begin
  writeln('INGRESE INFORMACION DE UN EMPLEADO: ');
  write('Codigo: ');
  readln(e.cod);
  if (e.cod<>fin) then begin
    write('Nombre: ');
    readln(e.nom);
    write('Apellido: ');
    readln(e.ap);
    write('Profesion: ');
    readln(e.prof);
    write('Codigo de departamento: ');
    readln(e.dep);
    write('Sueldo basico: ');
    readln(e.sueldo);
    write('Antiguedad: ');
    readln(e.ant);
  end;
end;

procedure insertarListaOrdenada(var pri:lista; e:empleado);
var
  nue,act,ant:lista;
begin
  new(nue);
  ant:=pri;
  act:=pri;
  nue^.datos:=e;
  while (act<>nil) and (e.cod>act^.datos.cod) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargarLista(var pri:lista; var e:empleado);
begin
  pri:=nil;
  leerInfoEmpleado(e);
  while (e.cod<>fin) do begin
    insertarListaOrdenada(pri,e);
    leerInfoEmpleado(e);
  end;
end;

function existe(pri:lista):boolean;
begin
  existe:=false;
  while (pri<>nil) and (not existe) do begin
    if (pri^.datos.dep=4) or (pri^.datos.dep=10) then existe:=true
    else pri:=pri^.sig;
  end;
end;

procedure eliminarDep4o10(var pri:lista);
var
  ant,act:lista;
begin
  while (existe(pri)) do begin //recorre la lista y se fija si existe dep 4 o 10
    act:=pri;                  //si existe alguno, recorre la lista y lo elimina
    ant:=pri;
    while (act<>nil) and ((act^.datos.dep<>4) and (act^.datos.dep<>10)) do begin
      ant:=act;
      act:=act^.sig;
    end;
    if (act<>nil) then begin
      if (act=pri) then pri:=act^.sig
      else ant^.sig:=act^.sig;
      dispose(act);
    end;
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

procedure imprimirLista(pri:lista);
begin
  writeln('LISTA: ');
  while (pri<>nil) do begin
    writeln(pri^.datos.cod);
    writeln(pri^.datos.ap);
    writeln(pri^.datos.nom);
    writeln(pri^.datos.prof);
    writeln(pri^.datos.dep);
    writeln(pri^.datos.sueldo);
    writeln(pri^.datos.ant);
    writeln(' ');
    pri:=pri^.sig;
  end;
end;

var
  pri:lista;
  e:empleado;

begin
  cargarLista(pri,e);
  imprimirLista(pri);
  write('Ingrese un empleado para ingresarlo en la lista: ');
  leerInfoEmpleado(e);
  insertarListaOrdenada(pri,e);
  imprimirLista(pri);
  eliminarDep4o10(pri);
  imprimirLista(pri);
  liberarMemoria(pri);
  readln;
end.
