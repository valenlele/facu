program ej5;

const
  fin = '.';

var
  carac:char;
  ant:char;
  cant:integer;
  cant_A:integer;
  cant_sa:integer;

begin
  cant:=0;
  cant_A:=0;
  cant_sa:=0;
  writeln('Ingrese un caracter: ');
  readln(carac);
  while carac <> fin do
  begin
    cant:=cant+1;
    if (carac = 'A') then
    cant_A:=cant_A+1;
    if (ant = 's') and (carac = 'a') then
    cant_sa:=cant_sa+1;
    ant:=carac;
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
  writeln('La cantidad de caracteres leidos es: ',cant);
  writeln('La cantidad de letras A leidas es: ',cant_A);
  writeln('La cantidad de veces que aparece una s seguidas por una letra a son: ',cant_sa);
  readln;
end.

