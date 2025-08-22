program ej11;

const dimF = 3;

type
  listaMaratones = ^nodo;
  nodo = record
    min,seg:integer;
    sig:listaMaratones;
  end;
  maratonista = record
    nombre,apellido,genero:string;
    tiempo:listaMaratones;
  end;
  vector = array[1..dimF] of maratonista;

procedure inicializarLista(var c:vector);
var i:integer;
begin
  for i:=1 to dimF do c[i].tiempo:=nil;
end;

procedure cargarListaTiempoMaratones(var l:listaMaratones; min,seg:integer);
var nue,act:listaMaratones;
begin
  new(nue);
  nue^.min:=min;
  nue^.seg:=seg;
  nue^.sig:=nil;
  act:=l;
  if act <> nil then
  begin
    while (act^.sig <> nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else l:=nue;
end;

procedure leerInfoMaratonistas(var c:vector);
var
  i:integer;
  min,seg:integer;
begin
  inicializarLista(c);
  for i:=1 to dimF do begin
    writeln('Ingrese el nombre del maratonista: ');
    readln(c[i].nombre);
    writeln('Ingrese el apellido del maratonista: ');
    readln(c[i].apellido);
    writeln('Ingrese el genero del maratonista: ');
    readln(c[i].genero);
    writeln('Ingrese el tiempo en el que hizo la maraton en minutos y segundos: ');
    readln(min);
    readln(seg);
    while (min <> -1) do begin
      cargarListaTiempoMaratones(c[i].tiempo,min,seg);
      writeln('Ingrese el tiempo en el que hizo la maraton en minutos y segundos: ');
      readln(min);
      readln(seg);
    end;
  end;
end;

function mejorTiempo(corredor:maratonista):integer;
begin
  mejorTiempo:=9999;
  while corredor.tiempo <> nil do begin
    if ((corredor.tiempo^.min*60 + corredor.tiempo^.seg) < mejorTiempo) then
    mejorTiempo:=corredor.tiempo^.min*60 + corredor.tiempo^.seg;
    corredor.tiempo:=corredor.tiempo^.sig;
  end;
end;

function promTiempo(corredor:maratonista):real;
var cantMaratones,cantTiempo:integer;
begin
  cantMaratones:=0;
  cantTiempo:=0;
  while corredor.tiempo <> nil do begin
    cantMaratones:=cantMaratones+1;
    cantTiempo:=cantTiempo + (corredor.tiempo^.min*60 + corredor.tiempo^.seg);
    corredor.tiempo:=corredor.tiempo^.sig;
  end;
  if cantMaratones <> 0 then promTiempo:=(cantTiempo/cantMaratones)
  else promTiempo:=0;
end;

var
  corredor:vector;
  i:integer;

begin
  leerInfoMaratonistas(corredor);
  for i:=1 to dimF do
  begin
    writeln('El mejor tiempo de ',corredor[i].nombre,' ',corredor[i].apellido,' es: ',mejorTiempo(corredor[i]),' segundos');
    writeln('El promedio de tiempo de ',corredor[i].nombre,' ',corredor[i].apellido,' es: ',promTiempo(corredor[i]),' segundos');
  end;
  readln;
end.
