program ej4;

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

procedure ordenarVector(var v:vector; dimL:integer);
var
  i,j,item:integer;
begin
  for i:=2 to dimL do begin
    item:=v[i];
    j:=i-1;
    while (j>0) and (v[j]>item) do begin
      v[j+1]:=v[j];
      j:=j-1;
    end;
    v[j+1]:=item;
  end;
end;

function buscarN(var v:vector; N:integer; dimL:integer):boolean;
var
  esta:boolean;
  res,i,j:integer;
begin
  i:=1;
  j:=dimL;
  res:=((i+j)div 2);
  esta:=true;
  while (i<=j) and (v[res]<>N) do begin
    res:=((i+j)div 2);
    if (v[res]<N) then i:=res+1
    else if (v[res]>N) then j:=res-1;
  end;
  if (i>j) or (v[res]<>N) then esta:=false;
  buscarN:=esta;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do write(v[i],' ');
end;

var
  v:vector;
  dimL:integer;
  N:integer;

begin
  write('Cargue el vector: ');
  cargarVector(v,dimL);
  ordenarVector(v,dimL);
  write('El vector es: ');
  imprimirVector(v,dimL);
  write('Ingrese el valor a buscar: ');
  readln(N);
  if (buscarN(v,N,dimL)) then write('El valor N se encuentra en el vector')
  else write('El valor N no se encuentra en el vector');
  readln;
end.
