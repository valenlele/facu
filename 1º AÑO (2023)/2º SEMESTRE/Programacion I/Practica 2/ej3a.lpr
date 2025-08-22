program ej3a;
const max=10;
var i,num,dig,suma:integer;
begin
  for i:=1 to max do begin
    writeln('Ingrese un numero: ');
    readln(num);
    suma:=0;
    while (num<>0) do begin
      dig:=num mod 10;
      suma:=suma+dig;
      num:=num div 10;
      if (num=0) and (suma>=10) then begin
        num:=suma;
        suma:=0;
      end;
    end;
  writeln('La suma de los digitos del numero es: ',suma);
  end;
end.
