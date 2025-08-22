program ej10;

const
  maxFil=10;
  maxCol=10;

type
  rangoF=1..maxFil;
  rangoC=1..maxCol;
  jugador=array[rangoF,rangoC]of boolean;

procedure cargarMapas(var j1,j2:jugador);
var
  i:integer;
  fil:rangoF;
  col:rangoF;
begin
  writeln('CARGAR MAPA JUGADOR 1: ');
  for i:=1 to 5 do begin
    writeln('INGRESE LA FILA Y LA COLUMNA DONDE COLOCAR EL BARCO ',i);
    readln(fil);
    readln(col);
    if (j1[fil,col]) then begin
      while (j1[fil,col]) do begin
        writeln('POSICION YA UTILIZADA. INGRESE OTRA POSICION: ');
        readln(fil);
        readln(col);
      end;
    end
    else j1[fil,col]:=true;
  end;
  writeln('CARGAR MAPA JUGADOR 2: ');
  for i:=1 to 5 do begin
    writeln('INGRESE LA FILA Y LA COLUMNA DONDE COLOCAR EL BARCO ',i);
    readln(fil);
    readln(col);
    if (j2[fil,col]) then begin
      while (j2[fil,col]) do begin
        writeln('POSICION YA UTILIZADA. INGRESE OTRA POSICION: ');
        readln(fil);
        readln(col);
      end;
    end
    else j2[fil,col]:=true;
  end;
end;

procedure turno(j:jugador; var barcos:integer);
var
  fil:rangoF;
  col:rangoC;
begin
  writeln('INGRESE NUMERO DE FILA Y COLUMNA: ');
  readln(fil);
  readln(col);
  if (j[fil,col]) then begin
    barcos:=barcos-1;
    writeln('HUNDIDO');
  end
  else writeln('AGUA');
end;

var
  j1,j2:jugador;
  barcosj1,barcosj2:integer;

begin
barcosj1:=5;
  barcosj2:=5;
  cargarMapas(j1,j2);
  while (barcosj1<>0) and (barcosj2<>0) do begin
    writeln('TURNO JUGADOR 1');
    turno(j2,barcosj2);
    if (barcosj2<>0) then begin
      writeln('TURNO JUGADOR 2');
      turno(j1,barcosj1);
    end;
  end;
  if (barcosj1=0) then write('GANADOR: JUGADOR 2')
  else if (barcosj2=0) then write('GANADOR: JUGADOR 1');
  readln;
end.
