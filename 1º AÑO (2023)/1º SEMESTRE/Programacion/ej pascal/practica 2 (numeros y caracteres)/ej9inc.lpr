program ej9inc;

const
  fin1 = '*';
  fin2 = '.';

var
  carac:char;

begin
  writeln('Ingrese un carcter: ');
  readln(carac);
  while (carac <> fin1) and (carac <> fin2) do
  begin
    writeln('Ingrese un carcter: ');
    readln(carac);
  end;
end.
