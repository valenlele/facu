program ej11;

var alfa, beta, gama, epsilon: integer;

procedure calcular(alfa: integer; var gama: integer; var beta:integer; var epsilon: integer);
begin
 alfa:= beta - 1 ;
 beta:= alfa + 8;
 gama:= beta + 15;
 epsilon:= beta - gama;
 writeln(alfa); writeln(beta); writeln(gama); writeln(epsilon);
 end;

begin
 alfa:= 6; beta:= 13; gama:= -6; epsilon:= 2;
 calcular(epsilon, alfa, beta, gama);
 writeln(' ');
 writeln(alfa); writeln(beta); writeln(gama); writeln(epsilon);
 readln;
end.

