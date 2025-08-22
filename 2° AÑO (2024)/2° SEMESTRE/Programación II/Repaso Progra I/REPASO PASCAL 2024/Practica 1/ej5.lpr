program ej5;

const
  cantBotellas=8;

var
  botella,vol,min1,min2,min1num,min2num,max1,max2,max1num,max2num,totVol,cant2000:integer;

begin
  max1:=-1;
  max2:=-1;
  min1:=9999;
  min2:=9999;
  totVol:=0;
  cant2000:=0;
  for botella:=1 to cantBotellas do begin
    write('Ingrese el volumen de la botella ',botella,': ');
    readln(vol);
    totVol:=totVol+vol;
    if (vol>2000) then cant2000:=cant2000+1;
    if (vol<min1) then begin
      min2:=min1;
      min1:=vol;
      min2num:=min1num;
      min1num:=botella;
    end
    else if (vol<min2) then begin
      min2:=vol;
      min2num:=botella;
    end;
    if (vol>max1) then begin
      max2:=max1;
      max1:=vol;
      max2num:=max1num;
      max1num:=botella;
    end
    else if (vol>max2) then begin
      max2:=vol;
      max2num:=botella;
    end;
  end;
  writeln('Las dos botellas con menor volumen son: ',min1num,' y ',min2num);
  writeln('Las dos botellas con mayor volumen son: ',max1num,' y ',max2num);
  writeln('El promedio del volumen es de ',totVol/cantBotellas:2:2,' cm3');
  write('El porcentaje de botellas cuyo valor supero los 2000 cm3 es el: ',(cant2000*100)/cantBotellas:2:2);
  readln;
end.
