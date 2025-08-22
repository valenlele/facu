program ej7;

const
  fin = -1;

type
  rango_dni = 0..9;
  cadena20 = string[20];
  info = record
    dni:integer;
    apellido:cadena20;
    nombre:cadena20;
    monto:integer;
  end;
  lista = ^nodo;
  nodo = record
    datos:info;
    sig:lista;
  end;
  vector = array [rango_dni] of lista;

var
  l:lista;
  listas:vector;
  datos:info;
  i:integer;
  act:lista;

procedure leer_info(var datos:info);
begin
  writeln('Ingrese el DNI: ');
  readln(datos.dni);
  if datos.dni <> fin then
  begin
    writeln('Ingrese el apellido: ');
    readln(datos.apellido);
    writeln('Ingrese el nombre: ');
    readln(datos.nombre);
    writeln('Ingrese el monto: ');
    readln(datos.monto);
  end;
end;

procedure cargar_lista(var l:lista; datos:info);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=datos;
  nue^.sig:=l;
  l:=nue;
end;

function ult_dig_dni(num:rango_dni):rango_dni;
begin
  ult_dig_dni:=num div 10;
end;

begin
  l:=nil;
  act:=l;
  for i:=0 to 9 do
  listas[i]:=nil;
  leer_info(datos);
  while datos.dni <> fin do
  begin
    cargar_lista(l,datos);
    leer_info(datos);
  end;
  while act <> nil do
  begin
    case ult_dig_dni(l^.datos.dni) of
      0:cargar_lista(listas[0],l^.datos);
      1:cargar_lista(listas[1],l^.datos);
      2:cargar_lista(listas[2],l^.datos);
      3:cargar_lista(listas[3],l^.datos);
      4:cargar_lista(listas[4],l^.datos);
      5:cargar_lista(listas[5],l^.datos);
      6:cargar_lista(listas[6],l^.datos);
      7:cargar_lista(listas[7],l^.datos);
      8:cargar_lista(listas[8],l^.datos);
      9:cargar_lista(listas[9],l^.datos);
    end;
    act:=act^.sig;
  end;
end.
