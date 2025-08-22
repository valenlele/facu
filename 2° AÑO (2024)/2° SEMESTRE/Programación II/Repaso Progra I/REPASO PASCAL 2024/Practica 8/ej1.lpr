program ej1;

type
  punteroEntero=^integer;

var
  p:punteroEntero;

begin
  new(p);
  writeln('Ingrese un entero para almacenar en memoria dinamica: ');
  readln(p^);
  writeln(' ');
  write('El numero guardado es: ',p^);
  readln;
end.
