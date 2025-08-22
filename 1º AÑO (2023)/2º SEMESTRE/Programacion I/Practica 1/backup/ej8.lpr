program ej8;
uses crt;
const maxProd=5;
var prod,cod,stock,min1Stock,min2Stock,min1StockCod,min2StockCod,maxStock,maxStockCod:integer;
begin
  min1Stock:=9999;
  min2Stock:=9999;
  maxStock:=-1;
  for prod:=1 to maxProd do begin
    writeln('Ingrese el codigo del producto ',prod);
    read(cod);
    writeln('Ingrese el stock del producto ',prod);
    read(stock);
    if (stock < min1Stock) then begin
      min2Stock:=min1Stock;
      min2StockCod:=min1StockCod;
      min1Stock:=stock;
      min1StockCod:=cod;
    end
    else if (stock < min2Stock) then begin
      min2Stock:=stock;
      min2StockCod:=cod;
    end
    else if (stock > maxStock) then begin
      maxStock:=stock;
      maxStockCod:=cod;
    end;
  end;
  writeln('Los codigos de los dos productos con menor stock son: ',min1StockCod,' y ',min2StockCod);
  writeln('El codigo del producto con mayor stock es: ',maxStockCod, ' su stock es: ',maxStock);
  readKey;
end.

