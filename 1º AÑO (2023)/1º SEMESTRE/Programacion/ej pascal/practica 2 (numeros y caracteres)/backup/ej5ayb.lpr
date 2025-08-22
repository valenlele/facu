program ej5abyc;

var
  carac,ant:char;
  tot,tota,totsa:integer;

begin
  tot:=0;
  tota:=0;
  totsa:=0;
  writeln  ('Ingrese un caracter: ');
    readln(carac);
  while carac <> '.' do
    begin
      if carac = 'A' then
        begin
          tota:=tota+1;
          tot:=tot+1;
        end
      else
        tot:=tot+1;
      ant:=carac;
      writeln('Ingrese un caracter: ');
        readln(carac);
      if (ant:= 's') and (carac = 'a') then
        totsa:=totsa+1;
    end;
  writeln('La cantidad de caracteres leidos son: ',tot);
  writeln('La cantidad de letras A leidas son: ',tota);
  writeln('La cantidad de veces que aparece una s seguida de una a son: ',totsa);
  readln;
end.
