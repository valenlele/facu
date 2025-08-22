program ej8;

const
  dimF = 3;
  fin = 0;

type
  cadena15 = string[15];
  rango_dia = 1..31;
  rango_mes = 1..12;
  rango_anio = 1950..2000;
  rango_oficina = 1..20;
  datos = record
    dni:integer;
    apellido:cadena15;
    nombre:cadena15;
    nacimiento:record
      dia:rango_dia;
      mes:rango_mes;
      anio:rango_anio;
    end;
    oficina:rango_oficina;
  end;

  empleados = array[1..dimF] of datos;

var
  e:empleados;
  i:integer;

procedure leer(var e:empleados);
begin
  i:=1;
  writeln('Ingrese el DNI del empleado numero ',i,': ');
  readln(e[i].dni);
  while (e[i].dni <> fin) and (i <= dimF) do
  begin
    writeln('Ingrese el apellido del empleado: ');
    readln(e[i].apellido);
    writeln('Ingrese el nombre del empleado: ');
    readln(e[i].nombre);
    writeln('Ingrese la fecha de nacimiento del empleado: ');
    writeln('Dia: ');
    readln(e[i].nacimiento.dia);
    writeln('Mes: ');
    readln(e[i].nacimiento.mes);
    writeln('Anio: ');
    readln(e[i].nacimiento.anio);
    writeln('Ingrese el numero de oficina del empleado: ');
    readln(e[i].oficina);
    i:=i+1;
    writeln('Ingrese el DNI del empleado numero ',i,': ');
    readln(e[i].dni);
  end;
end;

procedure oficina1(var e:empleados);
var
  exito:boolean;
begin
  exito:=false;
  for i:=1 to dimF do
  begin
    if e[i].oficina = 1 then
    begin
      exito:=true;
      writeln('El empleado que trabaja en la oficina 1 es: ');
      writeln('Nombre: ',e[i].nombre,'. Apellido: ',e[i].apellido);
    end;
  end;
  if exito = false then
  writeln('Ningun empleado trabaja en la oficina 1');
end;

procedure empleados_oficina(var e:empleados);
var
  tot_empleados:array [rango_oficina] of integer;
  oficina_act:rango_oficina;
begin
  for oficina_act:=1 to 20 do
  begin
    tot_empleados[oficina_act]:=0;
  end;
  oficina_act:=e[1].oficina;
  for i:=1 to dimF do
  begin
    if e[i].oficina = oficina_act then
    begin
      tot_empleados[oficina_act]:=tot_empleados[oficina_act]+1;
    end
    else if e[i].oficina <> oficina_act then
    begin
      writeln('El total de empleados de la oficina ',e[i].oficina,' es de: ',tot_empleados[oficina_act]);
      oficina_act:=e[i].oficina;
      tot_empleados[oficina_act]:=1;
    end;
  end;
  writeln('El total de empleados de la oficina ',e[i].oficina,' es de: ',tot_empleados[oficina_act]);
end;

procedure cumpleanios(var e:empleados);
var
  mes:rango_mes;
begin
  writeln('Ingrese un mes para verificar las personas que cumplen anios: ');
  readln(mes);
  for i:=1 to dimF do
  begin
    if mes = e[i].nacimiento.mes then
    writeln('El empleado que cumple anios ese mes es: ',e[i].nombre,' ',e[i].apellido);
  end;
end;

begin
  leer(e);
  oficina1(e);
  empleados_oficina(e);
  cumpleanios(e);
  readln;
end.
