program ej6;

const
  fin = -1;

type
  rango_mes = 1..9;

var
  mes:rango_mes;
  peso:real;
  min_peso5:real;
  peso_tot5:real;
  cant_mes5:integer;
  max_peso6:real;
  peso_tot6:real;
  cant_mes6:integer;

begin
  min_peso5:=9999;
  peso_tot5:=0;
  cant_mes5:=0;
  max_peso6:=-1;
  peso_tot6:=0;
  cant_mes6:=0;
  writeln('Ingrese el mes de gestacion de la embarazada: ');
  readln(mes);
  while mes <> fin do
  begin
    writeln('Ingrese el peso: ');
    readln(peso);
    if mes < 5 then
    begin
      cant_mes5:=cant_mes5+1;
      peso_tot5:=peso_tot5+peso;
      if peso < min_peso5 then
      min_peso5:=peso;
    end
    else if (mes >= 6) then
    begin
      cant_mes6:=cant_mes6+1;
      peso_tot6:=peso_tot6+peso;
      if peso > max_peso6 then
      max_peso6:=peso;
    end;
    writeln('Ingrese el mes de gestacion de la embarazada: ');
    readln(mes);
  end;
  writeln('El menor peso de las embarazadas con menos de 5 meses es: ',min_peso5);
  writeln('El peso promedio de las embarazadas con menos de 5 meses es: ',(peso_tot5/cant_mes5):0:2);
  writeln('El peso maximo de las embarazadas con 6 meses o mas es: ',max_peso6);
  writeln('El peso promedio de las embarazadas con 6 meses o mas es: ',(peso_tot6/cant_mes6):0:2);
  readln;
end.
