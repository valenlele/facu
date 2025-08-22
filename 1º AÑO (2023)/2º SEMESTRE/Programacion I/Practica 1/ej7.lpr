program ej7;
var cod,cantVentas,maxVentasCod,maxRecCod,maxVentas:integer;
    precio,rec,maxRec:real;
begin
  maxVentas:=-1;
  maxRec:=-1;
  writeln('Ingrese el codigo del juego: ');
  readln(cod);
  while (cod <> 0) do begin
    writeln('Ingrese la cantidad vendidad del juego con codigo ',cod);
    readln(cantVentas);
    writeln('Ingrese el precio por unidad del juego con codigo ',cod);
    readln(precio);
    if (cantVentas > maxVentas) then begin
      maxVentas:=cantVentas;
      maxVentasCod:=cod;
    end;
    rec:=cantVentas*precio;
    if (rec > maxRec) then begin
      maxRec:=rec;
      maxRecCod:=cod;
    end;
    writeln('Ingrese el codigo del juego: ');
    readln(cod);
  end;
  writeln('El codigo del juego que se vendio mas veces es: ',maxVentasCod);
  writeln('El codigo del juego que mas recaudo es: ',maxRecCod);
  readln;
end.
