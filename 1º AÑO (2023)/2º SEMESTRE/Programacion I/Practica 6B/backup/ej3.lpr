program ej3;

const
  dimF=10;

type
  rangoVec=1..dimF;
  vector=array[rangoVec] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
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

procedure vectorBenA(var A:vector; B:vector; I:integer; var dimLA:integer; dimLB:integer);
var
  j,k:integer;
begin
  if (dimLA+dimLB<=dimF) and (I>=1) and (I<=dimLA) then begin
    for j:=1 to dimLB do begin
      for k:=dimLA downto i+1 do A[k+1]:=A[k];
      A[i+1]:=B[j];
      dimLA:=dimLA+1;
      i:=i+1;
    end;
  end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do write(v[i],' ');
end;

var
  A,B:vector;
  dimLA,dimLB:integer;
  I:integer;

begin
  write('Cargue el vector A: ');
  cargarVector(A,dimLA);
  write('El vector A es: ');
  imprimirVector(A,dimLA);
  write('Cargue el vector B: ');
  cargarVector(B,dimLB);
  write('El vector B es: ');
  imprimirVector(B,dimLB);
  write('Ingrese el valor de I: ');
  readln(I);
  vectorBenA(A,B,I,dimLA,dimLB);
  write('El vector A es: ');
  imprimirVector(A,dimLA);
  readln;
end.
