program ej7;

const
  fin = 0;

var
  cod:integer;
  cant:integer;
  precio:integer;
  max_cant:integer;
  max_cant_cod:integer;
  recaudacion:integer;
  max_recaudacion:integer;
  max_recaudacion_cod:integer;

begin
  cant:=0;
  max_cant:=-1;
  max_recaudacion:=-1;
  writeln('Ingrese el codigo de un juego: ');
  readln(cod);
  while cod <> fin do
  begin
    recaudacion:=0;
    writeln('Ingrese la cantidad vendida: ');
    readln(cant);
    if cant > max_cant then
    begin
      max_cant:=cant;
      max_cant_cod:=cod;
    end;
    writeln('Ingrese el precio por unidad: ');
    readln(precio);
    recaudacion:=cant*precio;
    if recaudacion > max_recaudacion then
    begin
      max_recaudacion:=recaudacion;
      max_recaudacion_cod:=cod;
    end;
    writeln('Ingrese el codigo de un juego: ');
    readln(cod);
  end;
  writeln('El codigo del producto que se vendio mas veces es: ',max_cant_cod);
  writeln('El codigo del producto que mas recaudo es: ',max_recaudacion_cod);
  readln;
end.
