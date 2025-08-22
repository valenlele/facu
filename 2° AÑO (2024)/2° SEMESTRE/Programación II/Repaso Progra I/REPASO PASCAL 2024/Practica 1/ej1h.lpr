program ej1h;

var
  anio:integer;

begin
  write('Ingrese el anio de nacimiento de la persona: ');
  readln(anio);
  if (anio>=1946) and (anio<=1964) then write('La persona pertenece a la generacion ''Baby Boomers''')
  else if (anio>=1965) and (anio<=1980) then write('La persona pertenece a la generacion ''Generacion X''')
  else if (anio>=1981) and (anio<=1996) then write ('La persona pertenece a la generacion ''Millenials''')
  else if (anio>=1997) then write ('La persona pertenece a la generacion ''Generacion Z''');
  readln;
end.
