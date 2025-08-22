program ej1;

type
  pteroEntero=^integer;

var
  pe:pteroEntero;

begin
  new(pe);
  write('Ingrese el valor del entero: ');
  readln(pe^);
  write('El valor del entero es: ',pe^);
  dispose(pe);
  readln;
end.
