program ej8ayb;

var
  num1,num2:integer;
  operador:char;

function operacion(num1,num2:integer; operador:char):integer;
var
  resultado:integer;
begin
  resultado:=-1;
  case operador of
    '+':resultado:=num1+num2;
    '-':resultado:=num1-num2;
    '*':resultado:=num1*num2;
    '/':if (num2<>0) then resultado:=num1 div num2
    else if (num2=0) then writeln('No se puede dividir por 0');
  end;
  operacion:=resultado;
end;

begin
  writeln('Ingrese el primer numero: ');
  readln(num1);
  writeln('Ingrese el operador: ');
  readln(operador);
  writeln('Ingrese el segundo numero: ');
  readln(num2);
  writeln('El resultado de ',num1,' ',operador,' ',num2,' es: ',operacion(num1,num2,operador));
  readln;
end.
