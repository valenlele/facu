program ej3abcd;

const
  n_oficina = 15;

type
  oficina = record
    num:integer;
    m2:integer;
    hab:integer;
    cant_horas:integer;
    precio:integer;
  end;

var
  o:oficina;
  min_oficina:integer;
  tot:integer;
  i:integer;

procedure menos_horas(var o:oficina; var min_oficina:integer);
var
  min_horas:integer;
begin
  min_horas:=9999;
  with o do
    begin
      writeln('Ingrese el numero de oficina: ');
        readln(num);
      writeln('Ingrese el numero de metros cuadrados: ');
        readln(m2);
      writeln('Ingrese el numero de habitaciones: ');
        readln(hab);
      writeln('Ingrese la cantidad de horas alquiladas: ');
        readln(cant_horas);
      writeln('Ingrese el precio por hora: ');
        readln(precio);
    end;
    if o.cant_horas < min_horas then
      begin
        min_horas:=o.cant_horas;
        min_oficina:=o.num;
      end;
end;


procedure monto_tot(var o:oficina;var tot:integer);
var
  tot_oficina:integer;
begin
  tot_oficina:=o.cant_horas*o.precio;
  tot:=tot+tot_oficina;
end;

begin
  min_oficina:=9999;
  tot:=0;
  for i:=1 to n_oficina do
    begin
      menos_horas(o,min_oficina);
      monto_tot(o,tot);
    end;
  writeln('La oficina con menos horas de alquiler es la numero: ',min_oficina);
  writeln('El monto total recaudado es: ',tot);
  readln;
end.
