program ej5;

var
  i:integer;
  vol:integer;
  max1:integer;
  max1_bot:integer;
  max2:integer;
  max2_bot:integer;
  min1:integer;
  min1_bot:integer;
  min2:integer;
  min2_bot:integer;
  tot_vol:integer;
  cant2000:integer;

begin
  tot_vol:=0;
  cant2000:=0;
  max1:=-1;
  max2:=-1;
  min1:=9999;
  min2:=9999;
  for i:=1 to 12 do
  begin
    writeln('Ingrese el volumen de la bebida gasificada numero ',i,': ');
    readln(vol);
    tot_vol:=tot_vol+vol;
    if vol > 2000 then
    cant2000:=cant2000+1;
    if vol > max1 then
    begin
      max2:=max1;
      max1:=vol;
      max1_bot:=i;
    end
    else if vol > max2 then
    begin
      max2:=vol;
      max2_bot:=i;
    end
    else if vol < min1 then
    begin
      min2:=min1;
      min1:=vol;
      min1_bot:=i;
    end
    else if vol < min2 then
    begin
      min2:=vol;
      min2_bot:=i;
    end;
  end;
  writeln('El promedio del volumen es: ',tot_vol/12);
  writeln('El porcentaje de botellas que supero los 2000 cm3 es: ',((cant2000*100)/12):0:2);
  readln;
end.
