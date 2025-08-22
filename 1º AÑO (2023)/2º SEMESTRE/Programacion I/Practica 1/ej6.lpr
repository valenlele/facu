program ej6;
uses crt;
var mes,cant5,cant6:integer;
    peso,minPeso5,pesoProm5,maxPeso6,pesoProm6,totPeso5,totPeso6:real;
begin
  minPeso5:=9999;
  maxPeso6:=-1;
  cant5:=0;
  cant6:=0;
  totPeso5:=0;
  totPeso6:=0;
  writeln('Ingrese el mes de gestacion de la embarazada: ');
  read(mes);
  while (mes > 0) do begin
    writeln('Ingrese el peso de la embarazada: ');
    read(peso);
    if (mes < 5) then begin
      if (peso < minPeso5) then minPeso5:=peso;
      cant5:=cant5+1;
      totPeso5:=totPeso5+peso;
    end;
    if (mes > 6) and (mes <=12) then begin
      if (peso > maxPeso6) then maxPeso6:=peso;
      cant6:=cant6+1;
      totPeso6:=totPeso6+peso;
    end;
    writeln('Ingrese el mes de gestacion de la embarazada: ');
    read(mes);
  end;
  if cant5 <> 0 then pesoProm5:=totPeso5/cant5;
  if cant6 <> 0 then pesoProm6:=totPeso6/cant6;
  writeln('EL menor peso de las embarazadas con menos de 5 meses es: ',minPeso5:1:2);
  writeln('El peso promedio de las embarazadas con menos de 5 meses es: ',pesoProm5:1:2);
  writeln('EL menor peso de las embarazadas con mas de 6 meses es: ',maxPeso6);
  writeln('El peso promedio de las embarazadas con mas de 6 meses es: ',pesoProm6:1:2);
  readKey;
end.
