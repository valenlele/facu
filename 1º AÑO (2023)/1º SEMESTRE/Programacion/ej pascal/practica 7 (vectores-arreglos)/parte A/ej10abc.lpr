program ej10abc;

const
  dimF = 5;

type
  indice = 0..dimF;
  personas = string[20];
  nombres = array[1..dimF] of personas;

var
  n:nombres;
  i:integer;
  nombre:personas;
  nombre2:personas;
  dimL:indice;
  exito:boolean;
  nombre3:personas;

procedure carga(var n:nombres);
begin
  dimL:=0;
  writeln('Ingrese el nombre de la persona ',1,': ');
  readln(n[1]);
  dimL:=dimL+1;
  for i:=2 to dimF do
  begin
    writeln('Ingrese el nombre de la persona ',i,': ');
    readln(n[i]);
    dimL:=dimL+1;
    while (n[i]) < (n[i-1]) do
    begin
      writeln('Ingrese el nombre de la persona ',i,': ');
      readln(n[i]);
    end;
  end;
end;

procedure posicion_nombre(var n:nombres; nombre:personas);
var
  pos_nombre:boolean;
begin
  pos_nombre:=false;
  for i:=1 to dimF do
  begin
    if nombre = n[i] then
    begin
      pos_nombre:=true;
      writeln('La posicion del nombre ',nombre,' es: ',i);
    end;
  end;
  if pos_nombre = false then
  writeln('El nombre elegido no se encuentra en la lista');
end;

function determinar_posicion(x:personas; n:nombres; dimL:indice):indice;
var
  pos:indice;
begin
  pos:=1;
  while (pos <= dimF) and (x > n[pos]) do
  pos:=pos+1;
  determinar_posicion:=pos;
end;

procedure insertar(var n:nombres; var dimL:indice; pos:indice; nombre:personas);
var
  j:indice;
begin
  for j:=dimL downto pos do
  n[j+1]:=n[j];
  n[pos]:=nombre;
  dimL:=dimL+1;
end;

procedure insertar_elemento(var n:nombres; var dimL:indice; nombre:personas; var exito:boolean);
var
  pos:indice;
begin
  exito:=false;
  if(dimL < dimF) then
  begin
    pos:=determinar_posicion(nombre,n,dimL);
    insertar(n,dimL,pos,nombre);
    exito:=true;
  end;
  if exito = true then
  begin
    writeln('El nombre se ingreso en la posicion numero ',pos);
  end
  else
  begin
    writeln('No hay lugar en la lista');
  end;
end;

function buscar_pos_elem(nombre:personas; n:nombres; dimL:indice):indice;
var
  pos:indice;
  exito:boolean;
begin
  pos:=1;
  exito:=false;
  while (pos <= dimL) and (not exito) do
  begin
    if (nombre = n[pos]) then
    exito:=true
    else
    pos:=pos+1;
  end;
  if exito = false then
  pos:=0;
  buscar_pos_elem:=pos;
end;

procedure borrar_pos_modif(var n:nombres; var dimL:indice; pos:indice);
var
  i:integer;
begin
  for i:=pos+1 to dimL do
  n[i-1]:=n[i];
  dimL:=dimL-1;
end;

procedure borrar_elem(var n:nombres; var dimL:indice; nombre:personas; var exito: boolean);
var
  pos:indice;
begin
  exito:=false;
  pos:=buscar_pos_elem(nombre,n,dimL);
  if pos <> 0 then
  begin
    borrar_pos_modif(n,dimL,pos);
    exito:=true;
  end;
  if exito = false then
  writeln('El nombre no existe');
end;

begin
  carga(n);
  writeln('Ingrese un nombre para ver si esta en la lista: ');
  readln(nombre);
  posicion_nombre(n,nombre);
  writeln('Ingresar un nombre en caso que haya lugar en la lista: ');
  readln(nombre2);
  insertar_elemento(n,dimL,nombre2,exito);
  writeln('Ingresar un nombre para borrar en caso de existir: ');
  readln(nombre3);
  borrar_elem(n,dimL,nombre,exito);
  readln;
end.

