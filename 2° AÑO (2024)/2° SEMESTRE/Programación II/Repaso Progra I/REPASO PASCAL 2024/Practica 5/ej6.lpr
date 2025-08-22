program ej6;

const
  fin='FIN';

type
  cadena15=string[15];
  tDia=1..31;
  tMes=1..12;
  tAnio=1900..2024;
  tFecha=record
    dia:tDia;
    mes:tMes;
    anio:tAnio;
  end;
  paciente=record
    nom,ap:cadena15;
    fecha:tFecha;
    tiempo:integer;
  end;

procedure leerInfoPacientes(var p:paciente);
begin
  write('Ingrese el nombre del paciente: ');
  readln(p.nom);
  writeln('Ingrese la fecha de ingreso del paciente: ');
  write('Dia: ');
  readln(p.fecha.dia);
  write('Mes: ');
  readln(p.fecha.mes);
  write('Anio: ');
  readln(p.fecha.anio);
  write('Ingrese el tiempo de atencion del paciente: ');
  readln(p.tiempo);
end;

procedure maxTiempoPaciente(p:paciente; var maxTiempo:integer; var maxTiempoNom:cadena15);
begin
  if (p.tiempo>maxTiempo) then begin
    maxTiempo:=p.tiempo;
    maxTiempoNom:=p.nom;
  end;
end;

procedure pacientesAgosto(p:paciente; var cantAgosto:integer);
begin
  if (p.fecha.mes=8) then cantAgosto:=cantAgosto+1;
end;

var
  p:paciente;
  maxTiempo,cantAgosto:integer;
  maxTiempoNom:cadena15;

begin
  maxTiempo:=-1;
  cantAgosto:=0;
  write('Ingrese el apellido del paciente: ');
  readln(p.ap);
  while (p.ap<>fin) do begin
    leerInfoPacientes(p);
    maxTiempoPaciente(p,maxTiempo,maxTiempoNom);
    pacientesAgosto(p,cantAgosto);
    write('Ingrese el apellido del paciente: ');
    readln(p.ap);
  end;
  writeln('El nombre del paciente que mas tardo en ser atendido es: ',maxTiempoNom);
  write('La canttidad de pacientes que se atendieron en agosto fueron: ',cantAgosto);
  readln;
end.
