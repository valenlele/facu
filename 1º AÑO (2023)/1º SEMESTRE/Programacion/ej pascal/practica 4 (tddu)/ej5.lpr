program ej5;

const
  fin = 0;

type
  cadena30 = string[30];
  fecha = record
    dia:1..31;
    mes:1..12;
    anio:1900..2010;
  end;
  horario = record
    hora:0..23;
    minuto:0..59;
  end;
  hospital = record
    paciente:cadena30;
    medico:cadena30;
    fecha:fecha;
    entrada:horario;
    salida:horario;
  end;

var
  h:hospital;
  ho:horario;
  f:fecha;
  maxH:integer;
  maxM:integer;
  maxP:cadena30;
  cant:integer;

procedure leer(var h:hospital; var f:fecha);
begin
  with h do
    begin
      while f.anio <> fin do
        begin
          writeln('Ingrese el nombre del paciente: ');
            readln(paciente);
          writeln('Ingrese el nombre del medico: ');
            readln(medico);
          writeln('Ingrese el dia de atencion: ');
            readln(f.dia);
          writeln('Ingrese el mes de atencion: ');
            readln(f.mes);
          writeln('Ingrese el anio de atencion: ');
            readln(f.anio);
          writeln('Ingrese la hora de llegada del paciente: ');
            readln(entrada.hora,entrada.minuto);
          writeln('Ingrese la hora de salida del paciente: ');
            readln(salida.hora,salida.minuto);
        end;
    end;
end;

procedure paciente(var h:hospital; var maxH:integer; var maxM:integer; var maxP:cadena30);
var
  diferenciaH:integer;
  diferenciaM:integer;
begin
  diferenciaH:=0;
  diferenciaM:=0;
  diferenciaH:=h.salida.hora-h.entrada.hora;
  diferenciaM:=h.salida.minuto-h.entrada.minuto;
  if diferenciaM < 0 then
    begin
      diferenciaH:=diferenciaH-1;
      diferenciaM:=diferenciaM+60;
    end;
  if (diferenciaH > maxH) and (diferenciaM > maxM) then
    begin
      maxH:=diferenciaH;
      maxM:=diferenciaM;
      maxP:=h.paciente;
    end;
end;

procedure agosto(var h:hospital; var cant:integer);
begin
  if f.mes = 8 then
    cant:=cant+1;
end;

begin
  maxH:=-1;
  maxM:=-1;
  maxP:=' ';
  cant:=0;
  leer(h,f);
  while f.anio <> fin do
    begin
      paciente(h,maxH,maxM,maxP);
      agosto(h,cant);
      leer(h,f);
    end;
  writeln('El nombre del paciente que mas tardo en ser atendido es: ',maxP);
  writeln('La cantidad de pacientes que asisitieron en agosto son: ',cant);
  readln;
end.

