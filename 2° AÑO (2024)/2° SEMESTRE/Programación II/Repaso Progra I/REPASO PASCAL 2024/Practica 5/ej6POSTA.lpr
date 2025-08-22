program ej6POSTA;

const
  totSuc=2;

type
  sucursal=record
    biciVend,montTot,biciDefec,montDefec:integer;
  end;

procedure leerInfoSuc(var s:sucursal; suc,mes:integer);
begin
  write('Cantidad bicis vendidas sucursal ',suc,' mes ',mes,': ');
  readln(s.biciVend);
  write('Monto total facturado sucursal ',suc,' mes ',mes,': ');
  readln(s.montTot);
  write('Cantidad bicis defectuosas sucursal ',suc,' mes ',mes,': ');
  readln(s.biciDefec);
  write('Monto total devuelto por bicicletas defectuosas sucursal ',suc,' mes ',mes,': ');
  readln(s.montDefec);
end;

procedure contMinGanancia(suc,totGananciaSuc:integer; var minGanancia,sucMinGanancia:integer);
begin
  if (totGananciaSuc<minGanancia) then begin
    minGanancia:=totGananciaSuc;
    sucMinGanancia:=suc;
  end;
end;

procedure contMaxVentasSucxMes(var totVentasSucxMes,maxVentasSucxMes,mesMaxVentasSucxMes:integer; biciVend,biciDefec,mes:integer);
begin
  totVentasSucxMes:=(totVentasSucxMes+biciVend)-biciDefec;
  if (totVentasSucxMes>maxVentasSucxMes) then begin
    maxVentasSucxMes:=totVentasSucxMes;
    mesMaxVentasSucxMes:=mes;
  end;
end;

var
  s:sucursal;
  suc,mes,totGananciaSuc,minGanancia,sucMinGanancia,totVentasSucxMes,maxVentasSucxMes,mesMaxVentasSucxMes,recaudacionMarzo:integer;

begin
  minGanancia:=9999;
  recaudacionMarzo:=0;
  for suc:=1 to totSuc do begin
    totGananciaSuc:=0;
    maxVentasSucxMes:=-1;
    for mes:=1 to 3 do begin
      totVentasSucxMes:=0;
      leerInfoSuc(s,suc,mes);
      totGananciaSuc:=(totGananciaSuc+s.montTot)-s.montDefec;
      contMaxVentasSucxMes(totVentasSucxMes,maxVentasSucxMes,mesMaxVentasSucxMes,s.biciVend,s.biciDefec,mes);
      if (mes=3) then recaudacionMarzo:=recaudacionMarzo+s.montTot;
    end;
    writeln(' ');
    write('El mes con mayor ventas de la sucursal ',suc,' fue: ',mesMaxVentasSucxMes);
    contMinGanancia(suc,totGananciaSuc,minGanancia,sucMinGanancia);
    writeln(' ');
  end;
  writeln('La sucursal con menor ganancia fue: ',sucMinGanancia);
  writeln('La recaudacion promedio del mes de marzo de todas las sucursales fue de: ',recaudacionMarzo/totSuc:2:2);
  readln;
end.
