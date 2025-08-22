program ej7sinterminar;

const
  fin = '*';

var
  carac:char;
  cumpleV:boolean;

procedure secuenciaV(carac:char);
var
  ant:char;
  espacio:boolean;
begin
  espacio:=false;
  writeln('Ingrese la secuencia de caracteres V');
  readln(carac);
  while (carac = ' ') and (carac <> fin) do
  begin
    writeln('Ingresar caracter distinto a espacio');
    readln(carac);
  end;
  while (carac <> fin) do
  begin
    if (carac <> 'o') do
    cumpleV:=false;
    if carac = ' ' then

    ant:=carac;
    writeln('Ingrese la secuencia de caracteres V');
    readln(carac);
  end;
end;

begin
end.
