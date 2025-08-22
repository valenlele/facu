program ej8;

var
  i:integer;
  cod:integer;
  stock:integer;
  min1_stock:integer;
  min2_stock:integer;
  cod_min1_stock:integer;
  cod_min2_stock:integer;
  max_stock:integer;
  cod_max_stock:integer;

begin
  min1_stock:=25000;
  min2_stock:=25000;
  max_stock:=-1;
  for i:=1 to 500 do
  begin
    writeln('Ingrese el codigo del producto: ');
    readln(cod);
    writeln('Ingrese el stock del producto: ');
    readln(stock);
    if stock < min1_stock then
    begin
      min2_stock:=min1_stock;
      min1_stock:=stock;
      cod_min1_stock:=cod;
    end
    else if stock < min2_stock then
    begin
      min2_stock:=stock;
      cod_min2_stock:=cod;
    end
    else if stock > max_stock then
    begin
      max_stock:=stock;
      cod_max_stock:=cod;
    end;
  end;
  writeln('El producto con menor stock es: ',cod_min1_stock,'. El producto con el segundo menor stock es: ',cod_min2_stock);
  writeln('El codigo del producto con mayor stock es: ',cod_max_stock,'. Su respectivo stock es: ',max_stock);
  readln;
end.
