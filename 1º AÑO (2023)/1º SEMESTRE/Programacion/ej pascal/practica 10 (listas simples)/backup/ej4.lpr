program ej4;

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

procedure leer_avion(var ma:cadena20; var mo:cadena20; var cant:integer);
begin
  writeln('Cargue la lista de aviones: ');
  writeln(' ');
  writeln('Ingrese la marca: ');
  readln(ma);
  writeln('Ingrese el modelo: ');
  readln(mo);
  writeln('Ingrese la cantidad de asientos: ');
  readln(cant);
end;

procedure cargar_avion(var l:lista; var ma:cadena20; var mo:cadena20; var cant:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.datos.marca:=ma;
  nue^.datos.modelo:=mo;
  nue^.datos.cant_asientos:=cant;
  nue^.sig:=l;
  l:=nue;
end;

procedure crear_lista(var l:lista);
begin
  leer_avion(ma,mo,cant);
  while (ma <> fin) do
  begin
    cargar_avion(l,ma,mo,cant);
    leer_avion(ma,mo,cant);
  end;
end;

begin
  l:=nil;
  crear_lista(l);
  readln;
end.

