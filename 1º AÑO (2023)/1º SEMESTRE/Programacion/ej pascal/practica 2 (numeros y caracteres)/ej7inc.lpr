program ej7inc;

const
  fin = '.';

var
  carac:char;
  ant:char;
  cant_p:integer;
  long_p:integer;
  max:integer;

begin
  cant_p:=0;
  long_p:=0;
  max:=-1;
  writeln('Ingrese un caracter: ');
  readln(carac);
  while (carac = ' ') and (carac <> fin) do
  begin
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
  while carac <> fin do
  begin
    long_p:=0;
    if (ant = ' ') and (carac <> ' ') then
    cant_p:=cant_p+1;
    if (ant = ' ') and (carac = 't') then
    begin
      while (carac <> ' ') and (carac <> fin) do
      begin
        long_p:=long_p+1;
        writeln('Ingrese un caracter: ');
        readln(carac);
      end;
      if long_p > max then
      max:=long_p;
    end;
    ant:=carac;
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
  cant_p:=cant_p+1;
  writeln('La cantidad de palabras es: ',cant_p);
  writeln('La longitud de palabra mas larga que empieza con t es: ',max);
  readln;
end.
