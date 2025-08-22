program ej6;

const
  maxSuc=7;
  maxMes=12;

type
  venta=record
    cantBici:integer;
    montTot:integer;
    cantBiciDefec:integer;
    montTotDefec:integer;
  end;

procedure leerInfo(var v:venta; mes,sucursal:integer);
begin
  with v do begin
    write('Ingrese la cantidad de bicicletas vendidas del mes ',mes,' en la sucursal ',sucursal,': ');
    readln(cantBici);
    write('Ingrese el monto total facturado del mes ',mes,' en la sucursal ',sucursal,': ');
    readln(montTot);
    write('Ingrese la cantidad de bicicletas defectuosas del mes ',mes,' en la sucursal ',sucursal,': ');
    readln(cantBiciDefec);
    write('Ingrese el monto total devuelto por bicicletas defectuosas del mes ',mes,' en la sucursal ',sucursal,': ');
    readln(montTotDefec);
  end;
end;

procedure menorGanancia(gananciaSuc:integer; var minGanancia,minSuc:integer; sucursal:integer);
begin
  if (gananciaSuc<minGanancia) then begin
    minGanancia:=gananciaSuc;
    minSuc:=sucursal;
  end;
end;

procedure mayorVentasMes(v:venta; var maxVentas,max_mes:integer; mes:integer);
var
  ventasMes:integer;
begin
  ventasMes:=v.cantBici-v.cantBiciDefec;
  if (ventasMes>maxVentas) then begin
    maxVentas:=ventasMes;
    max_mes:=mes;
  end;
end;

procedure recaudacionMarzo(v:venta; var recMarzo:integer);
begin
  recMarzo:=(v.cantBici*v.montTot)-(v.cantBiciDefec+v.montTotDefec);
end;

var
  v:venta;
  sucursal,mes,minGanancia,gananciaSuc,minSuc,maxVentasMes,max_mes,recMarzo:integer;
  promRecMarzo:real;

begin
  minGanancia:=9999;
  minSuc:=0;
  max_mes:=-1;
  maxVentasMes:=-1;
  recMarzo:=0;
  promRecMarzo:=0;
  for sucursal:=1 to maxSuc do begin
    gananciaSuc:=0;
    for mes:=1 to maxMes do begin
      leerInfo(v,mes,sucursal);
      gananciaSuc:=gananciaSuc+(v.montTot-v.montTotDefec);
      mayorVentasMes(v,maxVentasMes,max_mes,mes);
      if (mes=3) then recaudacionMarzo(v,recMarzo);
    end;
    menorGanancia(gananciaSuc,minGanancia,minSuc,sucursal);
    writeln('El mes en el que mas vendio la sucursal ',sucursal,' fue: ',max_mes);
    max_mes:=-1;
    maxVentasMes:=-1;
  end;
  promRecMarzo:=recMarzo/maxSuc;
  writeln('La sucursal con menor ganancia es: ',minSuc);
  write('La recaudacion promedio en marzo de todas las sucursales es: ',promRecMarzo:2:2);
  readln;
end.

