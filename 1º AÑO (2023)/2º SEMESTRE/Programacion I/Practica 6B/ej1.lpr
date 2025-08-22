program ej1;

const
  dimF=10;

type
  rango=0..dimF;
  rangoVec=1..dimF;
  vector=array[rangoVec] of integer;

procedure cargarVector(var v:vector; var dimL:rango);
var
  num:integer;
begin
  dimL:=0;
  write('Ingrese un numero: ');
  readln(num);
  while (dimL<dimF) and (num<>-1) do begin
    dimL:=dimL+1;
    v[dimL]:=num;
    if (dimF<>dimL) and (num<>-1) then begin
      write('Ingrese un numero: ');
      readln(num);
    end;
  end;
end;

procedure IenN(var v:vector; N:rango; I:integer; var dimL:rango);
var
  j:rango;
begin
  if (dimL<dimF) and (N>=1) and (N<=dimL) then begin
    for j:=dimL downto N do v[j+1]:=v[j];
    v[N]:=I;
    dimL:=dimL+1;
  end;
end;

procedure imprimirVector(v:vector; dimL:rango);
var
  i:rango;
begin
  for i:=1 to dimL do write(v[i],' ');
end;

var
  v:vector;
  N:rango;
  I:integer;
  dimL:rango;

begin
  cargarVector(v,dimL);
  write('El vector es: ');
  imprimirVector(v,dimL);
  write('Ingrese la posicion donde ingresar el valor I: ');
  readln(N);
  write('Ingrese el valor I: ');
  readln(I);
  IenN(v,N,I,dimL);
  write('El vector es: ');
  imprimirVector(v,dimL);
  readln;
end.
