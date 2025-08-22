program ej2;
const fin=9999;
var num,dig,max1,max2,sumU:integer;
begin
  sumU:=0;
  writeln('Ingrese un numero: ');
  readln(num);
  while (num<>fin) do begin
    max1:=-1;
    max2:=-1;
    if (num<>0) then begin
      dig:=num mod 10;
      sumU:=sumU+dig;
      num:=num div 10;
    end;
    while (num<>0) do begin
      if (dig>max1) then begin
        max2:=max1;
        max1:=dig;
      end
      else if (dig>max2) then max2:=dig;
      dig:=num mod 10;
      num:=num div 10;
    end;
    writeln('Los dos digitos mayores en cada numero son: ',max1,' y ',max2);
    writeln('Ingrese un numero: ');
    readln(num);
  end;
  writeln('La suma de las unidades es: ',sumU);
  readln;
end.

