program ej1;

const
  maxVec=10;

type
  rangoVec=1..maxVec;
  vector=array[rangoVec] of integer;
  numeros=1..20;
  rango=set of numeros;


procedure cargarVec(var v:vector);
var
  i:rangoVec;
  num:integer;
begin
  writeln('Cargar vector: ');
  for i:=1 to maxVec do begin
    readln(num);
    v[i]:=num;
  end;
end;

procedure imprimirVec(v:vector);
var
  i:integer;
begin
  writeln('El vector es: ');
  for i:=1 to maxVec do writeln(v[i]);
end;

function promVec(v:vector):real;
var
  i,totNum:integer;
begin
  totNum:=0;
  for i:=1 to maxVec do totNum:=totNum+v[i];
  promVec:=totNum/maxVec;
end;

function cantEnRango(v:vector; rang:rango):integer;
var
  i:rangoVec;
begin
  cantEnRango:=0;
  for i:=1 to maxVec do if (v[i] in rang) then cantEnRango:=cantEnRango+1;
end;

procedure dosMaxNum(v:vector);
var
  i:rangoVec;
  max1,max1Pos,max2,max2Pos:integer;
begin
  max1:=-1;
  max2:=-1;
  for i:=1 to maxVec do begin
    if (v[i]>max1) then begin
      max2:=max1;
      max2Pos:=max1Pos;
      max1:=v[i];
      max1Pos:=i;
    end
    else if (v[i]>max2) then begin
      max2:=v[i];
      max2Pos:=i;
    end;
  end;
  writeln('Los dos mayores numeros del vector son ',max1,' y ',max2);
  write('Las posiciones donde se encuentran son ',max1Pos,' y ',max2Pos,' respectivamente');
end;

var
  v:vector;
  rang:rango;

begin
  cargarVec(v);
  writeln(' ');
  imprimirVec(v);
  writeln(' ');
  write('El valor promedio de los numeros de los vectores es: ',promVec(v):2:2);
  writeln(' ');
  rang:=[3..7];
  write('La cantidad de valores del vector que estan en el rango es: ',cantEnRango(v,rang));
  writeln(' ');
  dosMaxNum(v);
  readln;
end.
