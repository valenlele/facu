program ej9;

const
  dimF=80;
  fin=9999;

type
  vector=array[1..dimF] of integer;
  rango=0..dimF;

procedure cargarVector(var v:vector; var dimL:rango);
var
  num:integer;
begin
  dimL:=0;
  write('Ingrese un numero para cargar en el vector: ');
  readln(num);
  while (dimL<dimF) and (num<>fin) do begin
    dimL:=dimL+1;
    v[dimL]:=num;
    if (dimL<>dimF) then begin
      write('Ingrese un numero para cargar en el vector: ');
      readln(num);
    end;
  end;
end;

procedure numPosImpar(v:vector; dimL:rango);
var
  vImpar:vector;
  i,j,dimLImpar:rango;
begin
  dimLImpar:=0;
  for i:=1 to dimL do begin
    if (i mod 2<>0) then begin
      dimLImpar:=dimLImpar+1;
      vImpar[dimLImpar]:=v[i];
    end;
  end;
  write('Los numeros que estan en las posiciones impares del vector son: ');
  for j:=1 to dimLImpar do write(vImpar[j],' ');
end;

function primerPar(v:vector; dimL:rango):rango;
var
  pos:rango;
begin
  pos:=1;
  while (v[pos] mod 2<>0) and (pos<dimL) do pos:=pos+1;
  if (v[pos] mod 2=0) then primerPar:=pos
  else primerPar:=0;
end;

var
  v:vector;
  dimL:rango;

begin
  cargarVector(v,dimL);
  numPosImpar(v,dimL);
  writeln;
  write('La posicion del primer numero par es: ',primerPar(v,dimL));
  readln;
end.
