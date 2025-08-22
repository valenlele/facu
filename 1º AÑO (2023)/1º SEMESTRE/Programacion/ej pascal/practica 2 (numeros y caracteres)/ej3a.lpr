program ej3a;

var
  i,numero,digito,suma:integer;

begin
  for i:=1 to 10 do
    begin
      writeln('Ingrese un numero entero: ');
         readln(numero);
      suma:=0;
      while numero <> 0 do
        begin
          digito:=numero mod 10;
          suma:=suma+digito;
          numero:=numero div 10;
          if (numero=0) and (suma>=10) then
            begin
              numero:=suma;
              suma:=0;
            end;
         end;
      writeln('La suma del numero expresada en una cifra es: ',suma);
    end;
end.
