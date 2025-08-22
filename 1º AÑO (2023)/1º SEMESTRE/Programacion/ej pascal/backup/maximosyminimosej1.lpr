program maximosyminimosej1;
var numero,i,tot:integer;
begin
  tot:=0;
  for i:=1 to 30 do begin;
    write('decime un numero: ');
    readln(numero);
    tot:=tot+numero;
  end;
  write('la suma de los numeros enteros es: ',tot);
  readln;
end.

