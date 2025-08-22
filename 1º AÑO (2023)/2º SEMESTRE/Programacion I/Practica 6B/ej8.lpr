program ej8;

const
  dimFemp=800;
  dimFof=20;

type
  rangoMes=1..12;
  fechas=record
    dia:1..31;
    mes:rangoMes;
    anio:1900..2000;
  end;
  rangoEmp=1..dimFemp;
  rangoOf=1..dimFof;
  vecOf=array[rangoOf] of integer;
  empleado=record
    dni:integer;
    ap:string;
    nom:string;
    fecha:fechas;
    ofi:rangoOf;
  end;
  vecEmp=array[rangoEmp]of empleado;

procedure cargarOf(var vo:vecOf);
var
  i:integer;
begin
  for i:=1 to dimFof do vo[i]:=0;
end;

procedure cargarEmpleados(var e:vecEmp; var vo:vecOf; var dimLemp:integer);
var
  dni:integer;
begin
  write('Ingrese el DNI del empleado: ');
  readln(dni);
  while (dni<>0) and (dimLemp<dimFemp) do begin
    dimLemp:=dimLemp+1;
    e[dimLemp].dni:=dni;
    write('Ingrese el apellido del empleado: ');
    readln(e[dimLemp].ap);
    write('Ingrese el nombre del empleado: ');
    readln(e[dimLemp].nom);
    writeln('Ingrese la fecha de nacimiento del empleado (dia/mes/anio): ');
    readln(e[dimLemp].fecha.dia); write('/'); readln(e[dimLemp].fecha.mes); write('/'); readln(e[dimLemp].fecha.dia);
    write('Ingrese el numero de oficina del empleado: ');
    readln(e[dimLemp].ofi);
    vo[e[dimLemp].ofi]:=vo[e[dimLemp].ofi]+1;
    write('Ingrese el DNI del empleado: ');
    readln(dni);
  end;
end;

procedure oficinaUno(e:vecEmp; dimLemp:integer);
var
  i:rangoEmp;
begin
  for i:=1 to dimLemp do if (e[i].ofi=1) then writeln(e[i].nom,' ',e[i].ap,' trabaja en la oficina 1');
end;

procedure empleadosXoficina(vo:vecOf);
var
  i:rangoOf;
begin
  for i:=1 to dimFof do writeln(vo[i],' empleados trabajan en la oficina ',i);
end;

procedure cumpleEmpleados(e:vecEmp; dimLemp:integer; mesCumple:rangoMes);
var
  i:rangoEmp;
begin
  for i:=1 to dimLemp do if (e[i].fecha.mes=mesCumple) then write('El empleado ',e[i].nom,' ',e[i].ap,' cumple en el mes ',mesCumple);
end;

var
  e:vecEmp;
  vo:vecOf;
  dimLemp:integer;
  mesCumple:rangoMes;

begin
  dimLemp:=0;
  cargarOf(vo);
  cargarEmpleados(e,vo,dimLemp);
  oficinaUno(e,dimLemp);
  empleadosXoficina(vo);
  write('Ingrese un mes para saber que empleados cumplen en ese mes: ');
  readln(mesCumple);
  cumpleEmpleados(e,dimlEmp,mesCumple);
  readln;
end.
