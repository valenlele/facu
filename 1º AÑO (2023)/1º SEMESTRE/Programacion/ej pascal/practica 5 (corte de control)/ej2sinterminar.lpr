program ej2sinterminar;

const
  fin = -1;

type
  empleados = record
    dni:integer;
    sueldo:integer;
    dep:integer;
    suc:integer;
  end;

var
  e:empleados;
  dep_actual:integer;
  suc_actual:integer;
  max1_dep:integer;
  max1_suc:integer;
  max2_dep:integer;
  max2_suc:integer;

procedure leer(var e:empleados; var dep_actual:integer);
begin
  with e do
  begin
    writeln('Ingrese el numero de sucursal del empleado: ');
    readln(suc);
    suc_actual:=suc;
    if (suc <> fin) then
    begin
      writeln('Ingrese el codigo de departamento del empleado: ');
      readln(dep);
      dep_actual:=dep;
      writeln('Ingrese el DNI del empleado: ');
      readln(dni);
      writeln('Ingrese el sueldo del empleado: ');
      readln(sueldo);
    end;
  end;
end;

procedure dep_max_sueldo(e:empleados; var max1_dep:integer; var max2_dep:integer; var max1_suc:integer; var max2_suc:integer);
var
  max1:integer;
  max2:integer;
  tot_sueldo_dep:integer;
begin
  max1:=-1;
  max2:=-1;
  tot_sueldo_dep:=0;
  while (e.dep = dep_actual) and (e.suc <> fin) do
  begin
    tot_sueldo_dep:=tot_sueldo_dep+e.sueldo;
    if tot_sueldo_dep > max1 then
    begin
      max2:=max1;
      max2_dep:=max1_dep;
      max2_suc:=max2_suc;
      max1:=tot_sueldo_dep;
      max1_dep:=e.dep;
      max1_suc:=e.suc;
    end
    else if tot_sueldo_dep > max2 then
    begin
      max2:=tot_sueldo_dep;
      max2_dep:=e.dep;
      max2_suc:=e.suc;
    end;
    leer(e,dep_actual);
  end;
  if (e.dep <> dep_actual) or (e.suc = fin) then
  begin
    writeln('El departamento con mayor monto de sueldo es: ',max1_dep,'. Su sucursal es: ',max1_suc);
    writeln('El departamento con el segundo mayor monto de sueldo es: ',max2_dep,'. Su sucursal es: ',max2_suc);
    max1:=-1;
    max2:=-1;
    tot_sueldo_dep:=0;
  end;
end;

procedure sucursales
begin

end;

begin
  max1_dep:=-1;
  max2_dep:=-1;
  max1_suc:=-1;
  max2_suc:=-1;
  leer(e,dep_actual);
  while (e.suc <> fin) do
  begin
    dep_max_sueldo(e,max1_dep,max2_dep,max1_suc,max2_suc);
    sucursales(e,suc_actual
    leer(e,dep_actual);
  end;
  readln;
end.

