program ej2;

const
  fin = -1;

type
  empleado = record
    dni:integer;
    sueldo:integer;
    departamento:integer;
    sucursal:integer;
  end;

var
  e:empleado;
  s_actual:integer;
  d_actual:integer;
  max1dep:integer;
  max2dep:integer;

procedure leer(var e:empleado; var s_actual:integer; var d_actual:integer);
begin
  with e do
  begin
    writeln('Ingrese el DNI del empleado: ');
    readln(dni);
    writeln('Ingrese el sueldo del empleado: ');
    readln(sueldo);
    writeln('Ingrese la sucursal del empleado: ');
    readln(sucursal);
    s_actual:=sucursal;
    writeln('Ingrese el departamento del empleado: ');
    readln(departamento);
    d_actual:=departamento;
  end;
end;

procedure dos_max_sueldo(var e:empleado; var max1dep:integer; var max2dep:integer);
var
  max1:integer;
  max2:integer;
  monto_dep:integer;
begin
  max1:=-1;
  max2:=-1;
  monto_dep:=0;
  while e.sucursal = s_actual do
  begin
    while e.departamento = d_actual do
    begin
      monto_dep:=monto_dep+e.sueldo;
      if monto_dep > max1 then
      begin
        max2:=max1;
        max1:=monto_dep;
        max1dep:=e.departamento;
      end
      else if monto_dep > max2 then
      begin
        max2:=monto_dep;
        max2dep:=e.departamento;
      end;
      leer(e,s_actual,d_actual);
    end;
    if e.departamento <> d_actual then
    begin
      writeln('El departamento el mayor monto total de sueldo es: ',max1dep);
      writeln('El departamento el segundo mayor monto total de sueldo es: ',max2dep);
      d_actual:=e.departamento;
    end;
  end;
end;

procedure sucursal(var e:empleado);
var
  tot_sueldo:integer;
begin
  tot_sueldo:=0;
  while e.sucursal <> fin do
  begin
    while e.sucursal = s_actual do
    begin
      tot_sueldo:=tot_sueldo+e.sueldo;
      leer(e,s_actual,d_actual);
    end;
    if e.sucursal <> s_actual then
    begin
      writeln('El monto de sueldo total de la sucursal ',s_actual,' es: ',tot_sueldo);
      tot_sueldo:=0;
      s_actual:=e.sucursal;
    end;
  end;
end;

begin
  max1dep:=-1;
  max2dep:=-1;
  leer(e,s_actual,d_actual);
  while e.sucursal <> fin do
  begin
  dos_max_sueldo(e,max1dep,max2dep);
  sucursal(e);
  leer(e,s_actual,d_actual);
  end;
end.

