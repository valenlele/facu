program numerosenteros;
var
  i,numero,numeros_tot,numeros_pares:integer;
begin
  numeros_tot:=0;
  numeros_pares:=0;
  for i:=1 to 20 do
  begin
    writeln('introduce un numero');
      readln(numero);
      numeros_tot:=numeros_tot+numero;
        if numero mod 2 = 0 then
          numeros_pares:=numeros_pares+1;
        end;
  writeln('la suma de 20 numeros enteros es: ',numeros_tot);
  writeln('la cantidad de numeros pares es: ',numeros_pares);
end.

