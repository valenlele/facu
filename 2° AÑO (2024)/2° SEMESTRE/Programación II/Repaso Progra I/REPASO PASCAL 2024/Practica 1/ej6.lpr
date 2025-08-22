program ej6;

var
  mes,peso,minPeso5,totPeso5,cant5,maxPeso6,totPeso6,cant6:integer;

begin
  minPeso5:=9999;
  totPeso5:=0;
  cant5:=0;
  maxPeso6:=-1;
  totPeso6:=0;
  cant6:=0;
  write('Ingrese el mes de gestacion de la embarazada: ');
  readln(mes);
  while (mes>=0) do begin
    write('Ingrese el peso de la embarazada: ');
    readln(peso);
    if (mes<5) then begin
       if (peso<minPeso5) then minPeso5:=peso;
       totPeso5:=totPeso5+peso;
       cant5:=cant5+1;
    end;
    if (mes>=6) then begin
      if (peso>maxPeso6) then maxPeso6:=peso;
      totPeso6:=totPeso6+peso;
      cant6:=cant6+1;
    end;
    write('Ingrese el mes de gestacion de la embarazada: ');
    readln(mes);
  end;
  writeln('El menor peso entre las embarazadas de menos de 5 meses es: ',minPeso5);
  writeln('El peso promedio entre las embarazadas de menos de 5 meses es: ',totPeso5/cant5:2:2);
  writeln('El mayor peso entre las embarazadas de 6 meses o mas es: ',maxPeso6);
  writeln('El peso promedio entre las embarazadas de 6 meses o mas es: ',totPeso6/cant6:2:2);
  readln;
end.
