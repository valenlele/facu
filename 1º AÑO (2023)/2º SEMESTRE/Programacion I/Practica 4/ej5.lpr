program ej5;

type
  cadena=string[20];
  fechas=record
    dia:1..31;
    mes:1..12;
    anio:0..2023;
  end;
  horario=record
    hora:0..23;
    min:0..59;
  end;
  turno=record
    pac:cadena;
    med:cadena;
    fecha:fechas;
    llegada:horario;
    salida:horario;
  end;

procedure leerInfo(var t:turno);
begin
  with t do begin
    write('Ingrese el anio de atencion: ');
    readln(fecha.anio);
    if (fecha.anio<>0) then begin
      write('Ingrese el mes de atencion: ');
      readln(fecha.mes);
      write('Ingrese el dia de atencion: ');
      readln(fecha.dia);
      write('Ingrese el nombre del paciente: ');
      readln(pac);
      write('Ingrese el nombre del medico: ');
      readln(med);
      writeln('Ingrese el horario de llegada: ');
      writeln('HORA: ');
      readln(llegada.hora);
      writeln('MINUTOS: ');
      readln(llegada.min);
      writeln('Ingrese el horario de salida: ');
      writeln('HORA: ');
      readln(salida.hora);
      writeln('MINUTOS: ');
      readln(salida.min);
    end;
  end;
end;

function diferenciaTiempo(t:turno):integer;
  begin
    diferenciaTiempo:=0;
    diferenciaTiempo:=((t.salida.hora*60)+t.salida.min)-((t.llegada.hora*60)+t.llegada.min);
  end;

procedure mayorTiempoAtencion(t:turno; tiempo:integer; var maxTiempo:integer; var maxPac:cadena);
begin
  if (tiempo>maxTiempo) then begin
    maxTiempo:=tiempo;
    maxPac:=t.pac;
  end;
end;

function pacientesAgosto(t:turno; var totAg:integer):integer;
begin
  if (t.fecha.mes=8) and (t.fecha.anio<>0) then totAg:=totAg+1;
  if (totAg=0) then pacientesAgosto:=0
  else pacientesAgosto:=totAg;
end;

var
  t:turno;
  totAg,maxTiempo:integer;
  maxPac:cadena;

begin
  totAg:=0;
  maxTiempo:=0;
  maxPac:=' ';
  leerInfo(t);
  while (t.fecha.anio<>0) do begin
    mayorTiempoAtencion(t,diferenciaTiempo(t),maxTiempo,maxPac);
    pacientesAgosto(t,totAg);
    leerInfo(t);
  end;
  writeln('El nombre del paciente que mas tardo en ser atendido fue: ',maxPac);
  write('La cantidad de pacientes que ingresaron en agosto fueron: ',pacientesAgosto(t,totAg));
  readln;
end.

