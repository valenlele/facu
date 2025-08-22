program ej2;

type
  empleado=record
    dni:integer;
    sueldo:integer;
    codDep:integer;
    codSuc:integer;
  end;

procedure leerInfo(var e:empleado);
begin
  with e do begin
    write('Ingrese el codigo de la sucursal: ');
    readln(codSuc);
    if (codSuc<>-1) then begin
      write('Ingrese el codigo del departamento: ');
      readln(codDep);
      write('Ingrese el numero de DNI: ');
      readln(dni);
      write('Ingrese el monto del sueldo: ');
      readln(sueldo);
    end;
  end;
end;

procedure mayores(sucAct,depAct:integer; totSueldoDep:integer; var max1,max2,max1Suc,max1Dep,max2Suc,max2Dep:integer);
begin
  if (totSueldoDep>max1) then begin
    max2:=max1;
    max2Suc:=max1Suc;
    max2Dep:=max1Dep;
    max1:=totSueldoDep;
    max1Suc:=sucAct;
    max1Dep:=depAct;
  end
  else if (totSueldoDep>max2) then begin
    max2:=totSueldoDep;
    max2Suc:=sucAct;
    max2Dep:=depAct;
  end;
end;

procedure procesar(e:empleado; var max1Suc,max1Dep,max2Suc,max2Dep:integer);
var
  max1,max2:integer;
  totSueldoSuc,totSueldoDep:integer;
  sucAct,depAct:integer;
begin
  sucAct:=e.codSuc;
  totSueldoSuc:=0;
  while (e.codSuc=sucAct) do begin
    depAct:=e.codDep;
    totSueldoDep:=0;
    max1:=-1;
    max2:=-1;
    while (e.codDep=depAct) do begin
      totSueldoDep:=totSueldoDep+e.sueldo;
      totSueldoSuc:=totSueldoSuc+e.sueldo;
      leerInfo(e);
    end;
    mayores(sucAct,depAct,totSueldoDep,max1,max2,max1Suc,max1Dep,max2Suc,max2Dep);
  end;
  writeln('La suma del monto total de sueldos de la sucursal ',sucAct,' es: ',totSueldoSuc);
end;

var
  e:empleado;
  max1Suc,max1Dep,max2Suc,max2Dep:integer;

begin
  max1Suc:=-1;
  max1Dep:=-1;
  max2Suc:=-1;
  max2Dep:=-1;
  leerInfo(e);
  while (e.codSuc<>-1) do begin
    procesar(e,max1Suc,max1Dep,max2Suc,max2Dep);
    leerInfo(e);
  end;
  writeln('El codigo de la sucursal con el departamento con mayor monto de sueldo es: ',max1Suc,'. El codigo del departamento es: ',max1Dep);
  write('El codigo de la sucursal con el departamento con el segundo mayor monto de sueldo es: ',max2Suc,'. El codigo del departamento es: ',max2Dep);
  readln;
end.
