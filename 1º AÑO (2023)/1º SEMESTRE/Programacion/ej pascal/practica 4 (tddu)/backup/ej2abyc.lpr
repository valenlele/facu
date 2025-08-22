type
  tiempo = record
    horas: 0..23;
    minutos: 0..59;
  end;

function diferencia(const t1: tiempo; const t2: tiempo): tiempo;
begin
  Result.horas := t1.horas - t2.horas;
  Result.minutos := t1.minutos - t2.minutos;
  if Result.minutos < 0 then
  begin
    Result.horas := Result.horas - 1;
    Result.minutos := Result.minutos + 60;
  end;
end;

procedure menor(const t1: tiempo; const t2: tiempo; var min: tiempo);
begin
  if (t1.horas < t2.horas) or ((t1.horas = t2.horas) and (t1.minutos < t2.minutos)) then
    min := t1
  else
    min := t2;
end;

