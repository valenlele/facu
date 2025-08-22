program ej2;

const
  dimF=10;

type
  rango=0..dimF;
  rangoVec=1..dimF;
  vector=array[rangoVec] of integer;

procedure cargarVector(var A:vector; var dimL:rango);
var
  num:integer;
begin
  dimL:=0;
  write('Ingrese un numero: ');
  readln(num);
  while (dimL<dimF) and (num<>-1) do begin
    dimL:=dimL+1;
    A[dimL]:=num;
    if (dimF<>dimL) and (num<>-1) then begin
      write('Ingrese un numero: ');
      readln(num);
    end;
  end;
end;

procedure borrarEntreIyJ(var A:vector; I,J:integer; var dimL:rango);
var
  k,l:rango;
begin
  if ((I<=dimL) and (I>=1)) and ((J<=dimL) and (J>=1)) then begin
    for k:=I to J do begin
      for l:=I to dimL-1 do A[L]:=A[L+1];
      dimL:=dimL-1;
    end;
  end;
end;

procedure imprimirVector(A:vector; dimL:rango);
var
  i:rango;
begin
  for i:=1 to dimL do write(A[i],' ');
end;

var
  A:vector;
  I,J:integer;
  dimL:rango;

begin
  cargarVector(A,dimL);
  write('El vector es: ');
  imprimirVector(A,dimL);
  write('Ingrese el valor de I: ');
  readln(I);
  write('Ingrese el valor de J: ');
  readln(J);
  borrarEntreIyJ(A,I,J,dimL);
  write('El vector es: ');
  imprimirVector(A,dimL);
  readln;
end.
