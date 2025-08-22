program ej6;

type
  meses = 1..12;
  bicicleteria = record
    mes:meses;
    bici_vend:integer;
    monto_tot:integer;
    bici_defec:integer;
    monto_defec:integer;
  end;

var
  b:bicicleteria;
  suc_min:integer;
  max_mes:integer;
  promedio:real;
  i:integer;
  j:integer;

procedure leer(var b:bicicleteria);
begin
  with b do
    begin
      writeln('Ingrese el mes: ');
        readln(mes);
      writeln('Ingrese la cantidad de bicicletas venidadas: ');
        readln(bici_vend);
      writeln('Ingrese el monto total recaudado: ');
        readln(monto_tot);
      writeln('Ingrese la cantidad de bicicletas defectuosas: ');
        readln(bici_defec);
      writeln('Ingrese el monto devuelto por las bicicletas defectuosas: ');
        readln(monto_defec);
    end;
end;

procedure menor_ganancia(var b:bicicleteria; var suc_min:integer);
var
  min:integer;
  ganancias:integer;
begin
  min:=9999;
  ganancias:=b.monto_tot-b.monto_defec;
  if ganancias < min then
    begin
      min:=ganancias;
      suc_min:=i;
    end;
end;

procedure max_mes_venta(var b:bicicleteria; var max_mes:integer);
var
  ventas:integer;
  max:integer;
begin
  max:=-1;
  ventas:=b.bici_vend-b.bici_defec;
  if ventas > max then
    begin
      max:=ventas;
      max_mes:=b.mes;
    end;
end;

procedure promedio_marzo(var b:bicicleteria; var promedio:real);
var
  ganancia_marzo:integer;
  cant_meses:integer;
begin
  cant_meses:=0;
  if b.mes = 3 then
    begin
      ganancia_marzo:=b.monto_tot-b.monto_defec;
      cant_meses:=cant_meses+1;
    end;
  promedio:=ganancia_marzo/cant_meses;
end;

begin
  suc_min:=9999;
  max_mes:=-1;
  promedio:=0;
  for i:=1 to 7 do
    begin
      for j:= 1 to 12 do
        begin
          leer(b);
          menor_ganancia(b,suc_min);
          max_mes_venta(b,max_mes);
          promedio_marzo(b,promedio);
        end;
      writeln('El mes con mayor ganancia de la sucursal numero ',i,' es ',max_mes);
      max_mes:=0;
    end;
  writeln('La sucursal con menor ganancia es la numero ',suc_min);
  writeln('La recaudacion promedio de los meses de marzo es de: ',promedio:0:2);
  readln;
end.
