program ejemploterrenos5;
var
  superficie,superficie_tot,max:real;
  i:integer;
begin
  superficie_tot:=0;
  max:=-1;
  for i:=1 to 15 do
  begin
    writeln('escriba la superficie: ');
    readln(superficie);
    if superficie > max then
      max:=superficie;
    superficie_tot:=superficie_tot+superficie;
  end;
  writeln('la superficie total es: ',superficie_tot:0:2);
  writeln('la superficie maxima es: ',max);
  readln;
end.

