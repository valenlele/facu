program ej1d;

var
  numero,digito,numero2,digito2:integer;

begin
  writeln('Ingrese un numero entero:');
    readln(numero);
  while numero <> 0 do
    begin
      digito:=numero mod 10;
      if digito mod 3 = 0 then
        begin
          writeln('El digito ',digito,' es multiplo de 3');
          end
        else
          begin
            writeln('El digito ',digito,' no es multiplo de 3');
          end;
      numero:=numero div 10;
    end;
  writeln('Ingrese un numero entero: ');
    readln(numero2);
  while numero2 <> -1 do
    begin
      while numero2 <> 0 do
        begin
          digito2:=numero2 mod 10;
          if digito2 mod 2 = 0 then
            begin
              writeln('El digito ',digito2,' es par');
            end
              else
                begin
                  writeln('El digito ',digito2,' no es par');
                end;
          numero2:=numero2 div 10;
        end;
      end;
      writeln('Ingrese un numero entero: ');
        readln(numero2);
    end;
  readln;
end.
