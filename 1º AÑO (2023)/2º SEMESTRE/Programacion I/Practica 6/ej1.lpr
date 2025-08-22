program ej1;

const
  dimF=10;

type
  numeros=array[1..dimF] of integer;
  rango=0..dimF;
  valores=1..100;
  rango1=set of valores;
  rango2=set of valores;

procedure cargarVector(var n:numeros; var dimL:rango);
var
  valor:integer;
begin
  dimL:=0;
  write('Ingrese un valor para cargar en el vector: ');
  readln(valor);
  while (dimL<dimF) do begin
    dimL:=dimL+1;
    n[dimL]:=valor;
    if (dimL<>dimF) then begin
      write('Ingrese un valor para cargar en el vector: ');
      readln(valor);
    end;
  end;
end;


procedure promedioYPorcPosNeg(n:numeros);
var
  i,totValores,cantNeg,cantPos:integer;
begin
  totValores:=0;
  cantNeg:=0;
  cantPos:=0;
  for i:=1 to dimF do begin
    totValores:=totValores+n[i];
    if (n[i]>=0) then cantPos:=cantPos+1
    else if (n[i]<0) then cantNeg:=cantNeg+1;
  end;
  writeln('El promedio de los valores del vector es: ',totValores/dimF:2:2);
  writeln('El porcentaje de numeros que son positivos son: ',(cantPos*100)/dimF:2:2);
  writeln('El porcentaje de numeros que son negativos son: ',(cantNeg*100)/dimF:2:2);
end;

procedure estanEnRango(n:numeros; var r1:rango1; var r2:rango2);
var
  i,cantR1,cantR2:integer;
begin
  r1:=[1..10];
  r2:=[50..100];
  cantR1:=0;
  cantR2:=0;
  for i:=1 to dimF do begin
    if (n[i] in r1) then cantR1:=cantR1+1
    else if (n[i] in r2) then cantR2:=cantR2+1;
  end;
  writeln('La cantidad de elementos que estan en el rango 1 son: ',cantR1);
  writeln('La cantidad de elementos que estan en el rango 2 son: ',cantR2);
end;

procedure max2elementos(n:numeros);
var
  max1,max2,max1Pos,max2Pos,i:integer;
begin
  max1:=-1;
  max2:=-1;
  max1Pos:=-1;
  max2Pos:=-1;
  for i:=1 to dimF do begin
    if (n[i]>max1) then begin
      max2:=max1;
      max2Pos:=max1Pos;
      max1:=n[i];
      max1Pos:=i;
    end
    else if (n[i]>max2) then begin
      max2:=n[i];
      max2Pos:=i;
    end;
  end;
  writeln('El valor del elemento mas grande es: ',max1,'. Su posicion es: ',max1Pos);
  writeln('El valor del segundo elemento mas grande es: ',max2,'. Su posicion es: ',max2Pos);
end;

var
  n:numeros;
  dimL:rango;
  r1:rango1;
  r2:rango2;

begin
  cargarVector(n,dimL);
  promedioYPorcPosNeg(n);
  estanEnRango(n,r1,r2);
  max2elementos(n);
  readln;
end.

