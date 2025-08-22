program act2Potencia1;

function potencia1(x,n:integer):real;
begin
  potencia1:=x*potencia1(x,n-1);
end;

var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln(potencia1(x,n));

     readln;
end.
