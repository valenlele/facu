program atc3Potencia2;

function potencia2(n,x:integer):real;
begin
  if (x=0) then potencia2:=1
  else potencia2:=n*potencia2(n,x);
end;

var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (n);
     write ('Ingrese exponente: ');
     Readln (x);

     writeln(potencia2(n,x));

     readln;
end.
