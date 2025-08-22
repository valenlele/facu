program ej3b;

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
    case suma of
    1:writeln('El numero es uno');
    2:writeln('El numero es dos');
    3:writeln('El numero es tres');
    4:writeln('El numero es cuatro');
    5:writeln('El numero es cinco');
    6:writeln('El numero es seis');
    7:writeln('El numero es siete');
    8:writeln('El numero es ocho');
    9:writeln('El numero es nueve');
    end;
  end;
end.
