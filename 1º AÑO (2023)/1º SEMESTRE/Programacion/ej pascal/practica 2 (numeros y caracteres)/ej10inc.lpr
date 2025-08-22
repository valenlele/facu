program ej10inc;

const
  fin = '#';

var
  carac:char;

begin
  writeln('Ingrese un caracter: ');
  readln(carac);
  while carac <> fin do
  begin
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
end.
