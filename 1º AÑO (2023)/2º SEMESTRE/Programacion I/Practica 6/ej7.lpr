program ej7;

const
  dimF=26;

type
  rangoAlfa='a'..'{';
  conjCar=array[1..dimF] of rangoAlfa;
  rango=0..dimF;

procedure cargarVector(var c:conjCar; var dimL:rango);
var
  car:char;
begin
  dimL:=0;
  writeln('Introduzca un valor para insertar en el vector: ');
  readln(car);
  while (dimL<dimF) and (car<>'{') do begin
    dimL:=dimL+1;
    c[dimL]:=car;
    writeln('Introduzca un valor para insertar en el vector: ');
    readln(car);
  end;
end;

procedure union(c1,c2:conjCar; dimL1,dimL2:rango);
var
  cRes:conjCar;
  dimLRes:rango;
  i,j,pos,k:integer;
  estaEnConj:boolean;
begin
  dimLRes:=0;
  for i:=1 to dimL1 do begin
    cRes[i]:=c1[i];
    dimLRes:=dimLRes+1;
  end;
  for j:=1 to dimL2 do begin
    estaEnConj:=false;
    pos:=1;
    while (estaEnConj=false) and (pos<=dimLRes) do begin
      if (cRes[pos]=c2[j]) then estaEnConj:=true;
      pos:=pos+1;
    end;
    if (estaEnConj=false) and (dimLRes<dimF) then begin
      dimLRes:=dimLRes+1;
      cRes[dimLRes]:=c2[j];
    end;
  end;
  writeln('El conjunto resultante de la union entre los dos es: ');
  for k:=1 to dimLRes do writeln(cRes[k]);
end;

procedure diferencia(c1,c2:conjCar; dimL1,dimL2:rango);
var
  cRes:conjCar;
  dimLRes:rango;
  i,j,pos,k,l:integer;
begin
  dimLRes:=0;
  for i:=1 to dimL1 do begin
    cRes[i]:=c1[i];
    dimLRes:=dimLRes+1;
  end;

  for j:=1 to dimL2 do begin
    pos:=1;
    while (pos<=dimLRes) do begin
      if (cRes[pos]=c2[j]) then begin
        for k:=pos to dimLRes-1 do cRes[k]:=cRes[k+1];
        dimLRes:=dimLRes-1;
      end
      else pos:=pos+1;
    end;
  end;

  writeln('El conjunto resultante de la diferencia entre los dos es: ');
  for l:=1 to dimLRes do writeln(cRes[l]);
end;

function estaEnConj(c:conjCar; dimL:rango; elem:rangoAlfa; var esta:boolean):boolean;
var
  i:integer;
begin
  esta:=false;
  for i:=1 to dimL do if c[i]=elem then esta:=true;
  estaEnConj:=esta;
end;

var
  c1,c2:conjCar;
  dimL1,dimL2:rango;
  elem:rangoAlfa;
  esta:boolean;

begin
  writeln('Ingrese los caracteres para el conjunto 1: ');
  cargarVector(c1,dimL1);
  writeln('Ingrese los caracteres para el conjunto 2: ');
  cargarVector(c2,dimL2);
  union(c1,c2,dimL1,dimL2);
  diferencia(c1,c2,dimL1,dimL2);
  writeln('Ingrese un elemento para saber si esta en los conjuntos: ');
  readln(elem);
  estaEnConj(c1,dimL1,elem,esta);
  if esta=true then writeln('El elemento ',elem,' esta en el conjunto 1')
  else writeln('El elemento ',elem,' no esta en el conjunto 1');
  estaEnConj(c2,dimL2,elem,esta);
  if esta=true then writeln('El elemento ',elem,' esta en el conjunto 2')
  else writeln('El elemento ',elem,' no esta en el conjunto 2');
  readln;
end.
