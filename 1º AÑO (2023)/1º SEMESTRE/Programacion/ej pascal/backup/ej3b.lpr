program maxmin7;

var
  codigo,codigo_recaudacion,precio,codigo_venta,cant_vendida,recaudacion,max_vendido,max_recaudado:integer;

begin
  max_vendido:=-1;
  max_recaudado:=-1;
  writeln('Ingrese el codigo del juego');
    readln(codigo);
  while codigo <> 0 do
    begin
      writeln('La cantidad de juegos vendida es: ');
        readln(cant_vendida);
        if cant_vendida > max_vendido then
          begin
            max_vendido:=cant_vendida;
            codigo_venta:=codigo;
          end;
        writeln('El precio del juego por unidad es: ');
          readln(precio);
        recaudacion:=precio*cant_vendida;
        if recaudacion > max_recaudado then
          begin
            max_recaudado:=recaudacion;
            codigo_recaudacion:=codigo;
          end;
        end;
  writeln('El codigo del producto que se vendio mas veces es: ',codigo_venta);
  writeln('El codigo del producto que mas recaudo es: ',codigo_recaudacion);
end.
