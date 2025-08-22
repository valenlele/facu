Program ej3;
var pri,cuar: integer;

procedure DatosDos( pri: integer; var cuar: integer);
begin
 pri := (pri + 8) * cuar;
 cuar:= pri + cuar;
 writeln(cuar);
 writeln(' ');
end;

procedure DatosUno( var pri: integer; cuar: integer);
begin
 cuar:= cuar + ((pri * 2) + 3);
 if ( cuar < 6) then
 datosDos(cuar, pri)
 else Begin
 cuar:= 4;
 datosDos(cuar, pri);
 end;
 writeln(pri,' ',cuar);
 writeln(' ');
end;

begin
 pri:= 4; cuar:= 8;
 datosUno(cuar, pri);
 write(pri,' ',cuar);
 writeln(' ');
 readln;
end.
