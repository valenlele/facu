program maxmin8;

var

i,codigo,min_cod1,min_cod2,stock,min_stock1,min_stock2,max_stock,max_cod:integer;

begin
  min_stock1:=9999;
  min_stock2:=9999;
  max_stock:=-1;
  min_cod1:=9999;
  min_cod2:=9999;
  for i:=1 to 500 do
    begin
      read(codigo);
      read(stock);
      if stock < min_stock1 then
        begin
          min_stock2:=min_stock1;
          min_stock1:=stock;
          min_cod2:=min_cod1;
          min_cod1:=codigo;
        end;
      else
        if stock < min_stock2 then
          begin
            min_stock2:=stock;
            min_cod2:=codigo;
          end;
      if stock > max_stock then
        begin
          max_stock:=stock;
          max_cod:=codigo;
        end;
    end;
  writeln('Los dos codigos de los juegos con el menor stock son: ',min_cod1,min_cod2);
  writeln('El codigo del juego con el mayor stock es: ',max_cod,'.Su stock es: ',max_stock);
end.
