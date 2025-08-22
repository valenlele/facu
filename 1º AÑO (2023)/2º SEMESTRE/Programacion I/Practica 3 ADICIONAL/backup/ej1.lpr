program ej1;

function Sumar(a, b: real): real;
begin
 sumar:=a+b;
end;

function Restar(a, b: real): real;
begin
  restar:=a+b;
end;

function Multiplicar(a, b: real):
real;
begin
  Multiplicar:=a*b;
end;

function Dividir(a, b: real): real;
begin
  if (b<>0) then dividir:=a/b;
end;

var
 opcion: char;
 num1, num2, resultado: real;

procedure promedioPorcentaje(num1:real);
var
 prom,porc,tot:real;
 cantMayor50,i:integer;
begin
  tot:=0;
  cantMayor50:=0;
  for i:=1 to 10 do begin
    write('Ingrese un numero: ');
    readln(num1);
    tot:=tot+num1;
    if(num1>50) then cantMayor50:=cantMayor50+1;
  end;
  prom:=tot/10;
  porc:=((cantMayor50*100)/10);
  writeln('El promedio de la suma de los 10 numeros es: ',prom:2:2);
  writeln('El porcentaje de numeros mayores a 50 es: ',porc:2:2);
end;

begin
 writeln('Calculadora: Operaciones Básicas');
 writeln('Ingrese el primer número: ');
 readln(num1);
 writeln('Ingrese el segundo número: ');
 readln(num2);
 writeln('Seleccione la operación:');
 writeln('a) Suma, b) Resta, c) Multiplicacion, d) Division');
 readln(opcion);
 case opcion of
 'a': resultado := Sumar(num1, num2);
 'b': resultado := Restar(num1, num2);
 'c': resultado := Multiplicar(num1, num2);
 'd': resultado := Dividir(num1, num2);
 else
 resultado := -1;
 end;
 writeln('El resultado es: ', resultado:2:2);
 promedioPorcentaje(num1);
 readln;
end.

