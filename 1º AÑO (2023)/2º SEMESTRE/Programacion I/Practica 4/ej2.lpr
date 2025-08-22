program ej2;

type
  tiempo=record
    hora:0..23;
    min:0..59;
  end;

var
  t:tiempo;
  hora1,hora2:tiempo;

procedure diferenciaTiempo(hora1,hora2:tiempo);
var
  difHora,difMin:integer;
begin
  difHora:=(hora1.hora-hora2.hora);
  if (difHora<0) then difHora:=difHora+24;
  difMin:=(hora1.min-hora2.min);
  if (difMin<0) then difMin:=difMin+60;
  writeln('La diferencia de tiempo entre las dos horas es de: ',difHora,' hora(s) ',difMin,' minuto(s)');
end;

procedure menorTiempo(hora1,hora2:tiempo);
begin
  if (hora1.hora>hora2.hora) then write('El menor tiempo es el 2')
  else if (hora1.hora=hora2.hora) then begin
    if (hora1.min>hora2.min) then write('El menor tiempo es el 2');
    if (hora1.min=hora2.min) then write('Es el mismo tiempo');
    if (hora1.min<hora2.min) then write('El menor tiempo es el 1');
  end
  else if (hora1.hora<hora2.hora) then write('El menor tiempo es el 1');
end;

begin
  writeln('Ingrese el horario 1: ');
  readln(hora1.hora);
  readln(hora1.min);
  writeln('Ingrese el horario 2: ');
  readln(hora2.hora);
  readln(hora2.min);
  diferenciaTiempo(hora1,hora2);
  menorTiempo(hora1,hora2);
  readln;
end.

