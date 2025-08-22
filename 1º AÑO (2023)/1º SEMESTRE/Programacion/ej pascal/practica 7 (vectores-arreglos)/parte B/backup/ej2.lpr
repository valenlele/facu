program ej2;

const
  dimF = 5;

type
  indice = 0..dimF;
  vector = array [1..dimF] of integer;

var
  a:vector;
  i:integer;
  j:integer;
  k:integer;
  dimL:indice;

procedure leer(var a:vector; var dimL:indice);
begin
  dimL:=0;
  for k:=1 to dimF do
  begin
    writeln('Ingresa un valor: ');
    readln(a[k]);
    dimL:=dimL+1;
  end;
end;

procedure borrar_elem_modif(var a:vector; var dimL:indice; pos:indice);
var
  i:integer;
begin
  for i:=pos+1 to dimL do
  a[i-1]:=a[i];
  dimL:=dimL-1;
end;

procedure borrar_elem(var a:vector; var i:integer; var j:integer);
var
  pos:indice;
  l:integer;
begin
  pos:=i;
  for l:=i to j do
  begin
    borrar_elem_modif(a,dimL,pos);
  end;
end;

begin
  writeln('Ingrese un valor inicial: ');
  readln(i);
  writeln('Ingrese un valor final: ');
  readln(j);
  leer(a,dimL);
  borrar_elem(a,i,j);
  writeln('El vector quedo: ');
  for k:=1 to dimL do
  writeln(a[k]);
  readln;
end.
