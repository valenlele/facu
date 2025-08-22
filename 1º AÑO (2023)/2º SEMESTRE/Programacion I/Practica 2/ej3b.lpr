program ej3b;
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
    case suma of
    1:writeln('La suma de los digitos en letras es: uno');
    2:writeln('La suma de los digitos en letras es: dos');
    3:writeln('La suma de los digitos en letras es: tres');
    4:writeln('La suma de los digitos en letras es: cuatro');
    5:writeln('La suma de los digitos en letras es: cinco');
    6:writeln('La suma de los digitos en letras es: seis');
    7:writeln('La suma de los digitos en letras es: siete');
    8:writeln('La suma de los digitos en letras es: ocho');
    9:writeln('La suma de los digitos en letras es: nueve');
    end;
  end;
end.
