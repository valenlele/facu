program ej6;

const
  dimF = 8;

type
  binario = 0..1;
  valores = array[1..dimF] of binario;

var
  v:valores;
  v1:valores;
  v2:valores;
  resultado:valores;
  i:integer;

procedure leer(var v:valores);
begin
  for i:=1 to dimF do
  begin
    writeln('Ingrese un valor binario: ');
    readln(v[i]);
  end;
end;

procedure andd(v1:valores; v2:valores; var resultado:valores);
begin
  for i:=1 to dimF do
  begin
    resultado[i]:=v1[i] * v2[i];
  end;
  for i:=1 to dimF div 2 do
  writeln('El resultado de la operacion AND es: ',resultado[i]);
end;

procedure orr(v1:valores; v2:valores; var resultado:valores);
begin
  for i:=1 to dimF do
  begin
    if ((v1[i] = 0) and (v2[i] = 1)) or ((v1[i] = 1) and (v2[i] = 0)) then
    begin
      resultado[i]:=1;
    end
    else if (v1[i] = 0) and (v2[i] = 0) then
    begin
      resultado[i]:=0;
    end
    else if (v1[i] = 1) and (v2[i] = 1) then
    begin
      resultado[i]:=1;
    end;
  end;
  for i:=1 to dimF div 2 do
  writeln('El resultado de la operacion OR es: ',resultado[i]);
end;

procedure nott(v1:valores; var resultado:valores);
begin
  for i:=1 to dimF do
  begin
    if resultado[i] = 0 then
    begin
      resultado[i]:=1;
    end
    else if resultado[i] = 1 then
    begin
      resultado[i]:=0;
    end;
  end;
  for i:=1 to dimF div 2 do
  writeln('El resultado de la operacion NOT es: ',resultado[i]);
end;

begin
  leer(v);
  v1:=v;
  v2:=v;
  andd(v1,v2,resultado);
  orr(v1,v2,resultado);
  nott(v1,resultado);
  readln;
end.
