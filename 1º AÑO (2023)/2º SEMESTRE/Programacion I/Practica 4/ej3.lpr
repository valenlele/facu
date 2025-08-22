program ej3;

const max=2;

type
  oficina=record
    num:1..15;
    m2:integer;
    cantHab:integer;
    cantHorasMes:integer;
    precioHora:integer;
  end;

var
  o:oficina;
  montoTot:integer;

function montoTotal(o:oficina; var montoTot:integer):integer;
var
  montOficina:integer;
begin
  montOficina:=(o.cantHorasMes*o.precioHora);
  montoTot:=montoTot+montOficina;
  montoTotal:=montoTot;
end;

procedure menosHorasAlq(var o:oficina);
var
  oficinaMin,min,i:integer;
begin
  min:=9999;
  for i:=1 to max do begin
    write('Ingrese el numero de la oficina: ');
    readln(o.num);
    write('Ingrese la cantidad de metros cuadrados: ');
    readln(o.m2);
    write('Ingrese la cantidad de habitaciones: ');
    readln(o.cantHab);
    write('Ingrese la cantidad de horas que fue alquilada en el mes: ');
    readln(o.cantHorasMes);
    if (o.cantHorasMes<min) then begin
      min:=o.cantHorasMes;
      oficinaMin:=i;
    end;
    write('Ingrese el precio del alquiler por hora: ');
    readln(o.precioHora);
    montoTotal(o,montoTot);
  end;
  writeln('La oficina con la menor cantidad de horas alquiladas es la ',oficinaMin);
end;

begin
  montoTot:=0;
  menosHorasAlq(o);
  write('El monto total recaudado es: ',montoTotal(o,montoTot));
  readln;
end.

