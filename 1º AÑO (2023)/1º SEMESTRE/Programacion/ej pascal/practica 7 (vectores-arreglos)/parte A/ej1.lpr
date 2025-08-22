program ej1;

const
  dimF = 50;

type
  numeros = array [1..dimF] of integer;

var
  n:numeros;
  i:integer;
  promedio:real;
  p_positivos:real;
  p_negativos:real;
  cant_numeros:integer;
  max1:integer;
  max2:integer;
  max1_pos:integer;
  max2_pos:integer;

procedure carga(var n:numeros);
begin
  for i:=1 to dimF do
  begin
    writeln('Ingrese un numero: ');
    readln(n[i]);
  end;
end;

procedure prom_porcent(var n:numeros; var promedio:real; var p_positivos:real; var p_negativos:real);
var
  j:integer;
  tot_numeros:integer;
  n_negativos:integer;
  n_positivos:integer;
begin
  tot_numeros:=0;
  n_negativos:=0;
  n_positivos:=0;
  for j:=1 to dimF do
  begin
    tot_numeros:=tot_numeros+(n[j]);
  if (n[j]) < 0 then
  begin
    n_negativos:=n_negativos+1;
  end
  else if (n[j]) > 0 then
  begin
    n_positivos:=n_positivos+1;
  end;
  end;
  promedio:=tot_numeros/dimF;
  p_positivos:=n_positivos*100/dimF;
  p_negativos:=n_negativos*100/dimF;
  writeln('El promedio de los numeros es: ',promedio:0:2);
  writeln('El porcentaje de numeros positivos es: ',p_positivos:0:2);
  writeln('El porcentaje de numeros negativos es: ',p_negativos:0:2);
end;

function valor(n:numeros; var cant_numeros:integer):integer;
var
  k:integer;
begin
  cant_numeros:=0;
  for k:=1 to dimF do
  begin
    if (n[k] >= 5) and (n[k] <= 30) then
    cant_numeros:=cant_numeros+1;
  end;
  valor:=cant_numeros;
end;

procedure valores_max(var n:numeros; var max1:integer; var max2:integer; var max1_pos:integer; var max2_pos:integer);
var
  l:integer;
begin
  for l:=1 to dimF do
  begin
    if n[l] > max1 then
    begin
      max2:=max1;
      max1:=n[l];
      max1_pos:=l;
    end
    else if n[l] > max2 then
    begin
      max2:=n[l];
      max2_pos:=l;
    end;
  end;
  writeln('El valor mas grande que aparece es: ',max1,' su posicion es: ',max1_pos, '. El segundo numero mas alto es: ',max2, ' su posicion es: ',max2_pos);
end;

begin
  promedio:=0;
  p_positivos:=0;
  p_negativos:=0;
  cant_numeros:=0;
  max1:=-1;
  max2:=-1;
  max1_pos:=0;
  max2_pos:=0;
  carga(n);
  prom_porcent(n,promedio,p_positivos,p_negativos);
  writeln('La cantidad de numeros dentro del rango es: ',valor(n,cant_numeros));
  valores_max(n,max1,max2,max1_pos,max2_pos);
  readln;
end.
