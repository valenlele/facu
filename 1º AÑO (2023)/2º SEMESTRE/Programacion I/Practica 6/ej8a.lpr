program ej8a;

const
  dimF=15;

type
  rango=0..dimF;
  vector=array[1..dimF] of char;

procedure cargarVector(var v:vector; var dimL:rango);
var
  carac:char;
begin
  dimL:=0;
  write('Ingrese un caracter para cargar el vector: ');
  readln(carac);
  while (dimL<dimF) do begin
    dimL:=dimL+1;
    v[dimL]:=carac;
    if (dimL<>dimF) then begin
      write('Ingrese un caracter para cargar el vector: ');
      readln(carac);
    end;
  end;
end;

function contarPalabras(v:vector; dimL:rango):integer;
var
  cantP:integer;
  i:rango;
begin
  cantP:=0;
  for i:=1 to dimL do if (v[i]<>' ') and ((v[i-1]=' ') or (i=1)) then cantP:=cantP+1;
  contarPalabras:=cantP;
end;

var
  v:vector;
  dimL:rango;

begin
  cargarVector(v,dimL);
  write('La cantidad de palabras en el vector es: ',contarPalabras(v,dimL));
  readln;
end.
