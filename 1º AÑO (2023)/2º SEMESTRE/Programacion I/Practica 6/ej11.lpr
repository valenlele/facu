program ej11;

const
  dimF=7;

type
  rangoVec=1..7;
  vector=array[rangoVec] of real;

procedure inicializarVector(var v:vector);
var
  i:rangoVec;
begin
  for i:=1 to dimF do v[i]:=-9999;
end;

procedure insertarOrdenado(var v:vector; num:real; pos:rangoVec);
var
  i:rangoVec;
begin
  for i:=dimF downto pos do v[i+1]:=v[i];
  v[pos]:=num;
end;

procedure mayores(var v:vector; num:real);
var
  pos:rangoVec;
begin
  pos:=1;
  while (pos<dimF) and (num<v[pos]) do pos:=pos+1;
  if (num>v[pos]) then insertarOrdenado(v,num,pos);
end;

procedure imprimir(v:vector);
var
  i:integer;
begin
  for i:=1 to dimF do write(v[i]:2:2,' ');
end;

var
  v:vector;
  num:real;

begin
  inicializarVector(v);
  write('Ingrese un numero: ');
  readln(num);
  while (num<>50) do begin
    mayores(v,num);
    write('Ingrese un numero: ');
    readln(num);
  end;
  imprimir(v);
  readln;
end.
