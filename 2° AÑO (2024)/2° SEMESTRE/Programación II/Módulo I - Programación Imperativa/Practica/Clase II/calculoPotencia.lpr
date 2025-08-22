program calculoPotencia;

function potencia1(n,x:integer):integer;
begin
  potencia1:=n*potencia1(n,x-1);
end;

function potencia2(n,x:integer):integer;
begin
  if (x=0) then potencia2:=1
  else potencia2:=n*potencia2(n,x-1);
end;

var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (n);
     write ('Ingrese exponente: ');
     Readln (x);
     {write(n,'^',x,'= ',potencia1(x,n));}
     write(n,'^',x,'= ',potencia2(n,x));
     readln;
end.
