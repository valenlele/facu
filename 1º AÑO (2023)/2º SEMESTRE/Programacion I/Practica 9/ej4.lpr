program ej4;

type
  avion=record
    marca,modelo:string;
    asientos:integer;
  end;
  lista=^nodo;
  nodo=record
    datos:avion;
    sig:lista;
  end;

procedure agregarOrdenado(var pri:lista; marc,mode:string; cantAs:integer);
var
  nue,ant,act:lista;
  encontre:boolean;  //me dice si se encontro lugar para insertar el nuevo nodo
begin
  encontre:=false;
  new(nue);
  nue^.datos.marca:=marc;
  nue^.datos.modelo:=mode;
  nue^.datos.asientos:=cantAs;
  ant:=pri;
  act:=pri;
  while (act<>nil) and (not encontre) do begin
    if (marc<act^.datos.marca) then encontre:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
  end;
  if (ant=act) then pri:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure eliminarElemLista(var pri:lista; marc,mode:string; cantAs:integer);
var
  act,ant:lista;
  ok:boolean;
begin
  ok:=false;
  ant:=pri;
  act:=pri;
  while (act<>nil) and (not ok) do begin
    if (marc=act^.datos.marca) and (mode=act^.datos.modelo) and (cantAs=act^.datos.asientos) then ok:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
    if (ok) then begin
      if (act=pri) then pri:=act^.sig
      else ant^.sig:=act^.sig;
      dispose(act);
    end
    else writeln('El elemento no se pudo eliminar de la lista');
  end;
end;

procedure imprimirLista(pri:lista);
begin
  while (pri<>nil) do begin
    writeln('DATOS DE UN AVION: ');
    writeln('MARCA: ',pri^.datos.marca);
    writeln('MODELO: ',pri^.datos.modelo);
    writeln('CANTIDAD DE ASIENTOS: ',pri^.datos.asientos);
    pri:=pri^.sig;
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

var
  pri:lista;
  marc,mode:string;
  cantAs:integer;

begin
  pri:=nil;
  writeln('INGRESE LOS DATOS PARA UN AVION: ');
  write('Ingrese la marca: ');
  readln(marc);
  while (marc<>'.') do begin
    write('Ingrese el modelo: ');
    readln(mode);
    write('Ingrese la cantidad de asientos: ');
    readln(cantAs);
    agregarOrdenado(pri,marc,mode,cantAs);
    writeln('INGRESE LOS DATOS PARA UN AVION: ');
    write('Ingrese la marca: ');
    readln(marc);
  end;
  imprimirLista(pri);
  write('Ingrese un avion para ingresarlo a la lista: ');
  write('Ingrese la marca: ');
  readln(marc);
  write('Ingrese el modelo: ');
  readln(mode);
  write('Ingrese la cantidad de asientos: ');
  readln(cantAs);
  agregarOrdenado(pri,marc,mode,cantAs);
  imprimirLista(pri);
  write('Ingrese un avion para borrarlo de la lista: ');
  write('Ingrese la marca: ');
  readln(marc);
  write('Ingrese el modelo: ');
  readln(mode);
  write('Ingrese la cantidad de asientos: ');
  readln(cantAs);
  eliminarElemLista(pri,marc,mode,cantAs);
  imprimirLista(pri);
  liberarMemoria(pri);
  readln;
end.
