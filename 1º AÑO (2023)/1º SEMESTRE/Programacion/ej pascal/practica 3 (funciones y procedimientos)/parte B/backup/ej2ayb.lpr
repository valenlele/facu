program ej4;

var
  cant:integer;
  carac:char;

procedure contar;
var
  cant:integer;
begin
  if (carac >= 'a') and (carac <= 'z') then
    cant:=cant+1;
end;

procedure resultado;
begin
  writeln('El total de letras entre la a y la z que no fueron ingresadas es: ',cant);
end;

begin
  cant:=0;
  writeln('Ingrese un caracter: ');
    readln(carac);
  while carac <> '#' do
    begin
      contar;
      writeln('Ingrese un caracter: ');
        readln(carac);
    end;
  resultado;
  readln;
end.
