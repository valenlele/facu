program ej1;

type
  puntero_entero = ^integer;

var
  p:puntero_entero;

begin
  new(p);
  writeln('Ingrese un valor para el entero: ');
  readln(p^);
  writeln('El valor ingresado es: ',p^);
  dispose(p);
  readln;
end.
