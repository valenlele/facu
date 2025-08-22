program ej7v2;

const fin='e';

type
  rangoAlfa='a'..fin;
  conjCar=array[rangoAlfa] of boolean;

procedure cargarVector(var c:conjCar);
var
  i:rangoAlfa;
  car:char;
begin
  for i:='a' to fin do begin
    write('Ingrese el caracter ',i,' si esta en el conjunto: ');
    readln(car);
    if (car=i) then c[i]:=true
    else c[i]:=false;
  end;
end;

procedure union(c1,c2:conjCar);
var
  cRes:conjCar;
  i:rangoAlfa;
begin
  for i:='a' to fin do cRes[i]:=c1[i] or c2[i];
  writeln('El conjunto resultante por la union de los dos conjuntos es: ');
  for i:='a' to fin do if (cRes[i]) then write(i,' ');
end;

procedure diferencia(c1,c2:conjCar);
var
  cRes:conjCar;
  i:rangoAlfa;
begin
  for i:='a' to fin do begin
    if (c1[i]) and (not c2[i]) then cRes[i]:=true
    else cRes[i]:=false;
  end;
  writeln('El conjunto resultante por la diferencia de los dos conjuntos es: ');
  for i:='a' to fin do if (cRes[i]) then write(i,' ');
end;

function pertenencia(c:conjCar; elem:rangoAlfa; var estaEnConj:boolean):boolean;
var
  i:rangoAlfa;
begin
  estaEnConj:=false;
  for i:='a' to fin do if (i=elem) and (c[i]) then estaEnConj:=true;
  pertenencia:=estaEnConj;
end;

var
  c1,c2:conjCar;
  elem:rangoAlfa;
  estaEnConj:boolean;

begin
  writeln('Cargue el vector 1: ');
  cargarVector(c1);
  writeln('Cargue el vector 2: ');
  cargarVector(c2);
  union(c1,c2);
  diferencia(c1,c2);
  writeln('Ingrese un elemento para saber si esta en uno de los dos conjuntos: ');
  readln(elem);
  pertenencia(c1,elem,estaEnConj);
  if (estaEnConj) then writeln('El elemento se encuentra en el conjunto 1')
  else writeln('El elemento no se encuentra en el conjunto 1');
  pertenencia(c2,elem,estaEnConj);
  if (estaEnConj) then writeln('El elemento se encuentra en el conjunto 2')
  else writeln('El elemento no se encuentra en el conjunto 2');
  readln;
end.
