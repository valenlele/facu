program ej2;

var
  numero,digito,tot,max1,max2:integer;

begin
  tot:=0;
  max1:=-1;
  max2:=-1;
  writeln('Ingrese un numero entero: ');
    readln(numero);
  while numero <> 9999 do
    begin
      while numero <> 0 do
        begin
          digito:= numero mod 10;
          tot:=tot+digito;
          if digito > max1 then
            begin
              max2:=max1;
              max1:=digito;
            end
          else
            if digito > max2 then
              begin
                max2:=digito;
              end;
          numero:=numero div 10;
        end;
      writeln('Los dos mayores digitos del numero son: ',max1,' ',max2);
      writeln('Ingrese un numero entero');
        readln(numero);
    end;
  writeln('La suma de las unidades de los numeros es: ',tot);
  readln;
end.
