program ej5a;

var
  carac:char;
  tot:integer;

begin
  tot:=0;
  write('Ingrese un caracter: ');
    readln(carac);
  while carac <> '.' do
    begin
      tot:=tot+1;
      write('Ingrese un caracter: ');
        readln(carac);
    end;
  writeln('La cantidad de caracteres leidos son: ',tot);
  readln;
end.
