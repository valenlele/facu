program ej5;
const maxBot=4;
var volumen,min1,min2,max1,max2,prom,porc2000,totVol:real;
    botellas,bot2000,min1Bot,min2Bot,max1Bot,max2Bot:integer;
begin
  min1:=9999;
  min2:=9999;
  max1:=-1;
  max2:=-1;
  totVol:=0;
  bot2000:=0;
  max1Bot:=-1;
  min1Bot:=-1;
  for botellas:=1 to maxBot do begin
    writeln('Ingrese el volumen de la botella ',botellas);
    readln(volumen);
    if (volumen > max1) then begin
      max2:=max1;
      max1:=volumen;
      max2Bot:=max1Bot;
      max1Bot:=botellas;
    end
    else if (volumen > max2) then begin
      max2:=volumen;
      max2Bot:=botellas;
    end
    else if (volumen < min1) then begin
      min2:=min1;
      min1:=volumen;
      min2Bot:=min1Bot;
      min1Bot:=botellas;
    end
    else if (volumen < min2) then begin
      min2:=volumen;
      min2Bot:=botellas;
    end;
    totVol:=totVol+volumen;
    if (volumen > 2000) then bot2000:=bot2000+1;
  end;
  writeln('Las dos botellas con menor volumen son: ',min1Bot,' y ',min2Bot);
  writeln('Las dos botellas con mayor volumen son: ',max1Bot,' y ',max2Bot);
  prom:=totVol/maxBot;
  writeln('El promedio de volumen de las botellas es: ',prom:1:2);
  porc2000:=((bot2000*100)/maxBot);
  writeln('EL porcentaje de botellas cuyo valor supera los 2000cm3 es: ',porc2000:1:2);
  readln;
end.
