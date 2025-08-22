program ej4;

const
  maxCiudades=5;

type
  NombreCiudad=string[50];
  PtrNombreCiudad=^ NombreCiudad;
  PtrNombreCiudades=array[1..maxCiudades] of PtrNombreCiudad;

procedure reservarMemoriaCiudades(var Punteros:PtrNombreCiudades);
var
  i:integer;
begin
  for i:=1 to maxCiudades do new(Punteros[i]);
end;

procedure cargarNombres(var Punteros:PtrNombreCiudades);
var
  i:integer;
  nombre:nombreCiudad;
begin
  for i:=1 to maxCiudades do begin
    write('Ingrese el nombre de una ciudad: ');
    readln(nombre);
    punteros[i]^:=nombre;
  end;
end;

var
  Punteros:PtrNombreCiudades;
  i:integer;

begin
  reservarMemoriaCiudades(Punteros);
  cargarNombres(Punteros);
  readln;
end.
