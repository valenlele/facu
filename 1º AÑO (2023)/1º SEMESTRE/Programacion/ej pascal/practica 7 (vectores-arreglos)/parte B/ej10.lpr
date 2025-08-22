program ej10;

const
  maxfil = 3;
  maxcol = 3;

type
  rangof = 1..maxfil;
  rangoc = 1..maxcol;
  jugador1 = array[1..maxfil,1..maxcol] of integer;
  jugador2 = array[1..maxfil,1..maxcol] of integer;

var
  j1:jugador1;
  j2:jugador2;
  i:integer;
  j:integer;
  f:rangof;
  c:rangoc;

procedure establecer_pos(var j1:jugador1; var j2:jugador2);
begin
  for i:=1 to 5 do
  begin
    writeln('Ingrese la fila del barco ',i,' para el jugador 1: ');
    readln(f);
    writeln('Ingrese la columna del barco ',i,' para el jugador 1: ');
    readln(c);
    j1[f,c]:=1;
  end;
  for j:=1 to 5 do
  begin
    writeln('Ingrese la fila del barco ',j,' para el jugador 2: ');
    readln(f);
    writeln('Ingrese la columna del barco ',j,' para el jugador 2: ');
    readln(c);
    j2[f,c]:=1;
  end;
end;

procedure turno_j1(var j2:jugador2);
begin
  writeln(' ');
  writeln('---TURNO JUGADOR 1---');
  writeln(' ');
  writeln('Ingrese una posicion de la fila del tablero del jugador 2: ');
  readln(f);
  writeln('Ingrese una posicion de la columna del tablero del jugador 2: ');
  readln(c);
  if j2[f,c] = 1 then
  begin
    writeln('Jugador 2 responde: HUNDIDO');
    j2[f,c]:=0;
  end
  else
    writeln('Jugador 2 responde: AGUA');
end;

procedure turno_j2(var j1:jugador1);
begin
  writeln(' ');
  writeln('---TURNO JUGADOR 2---');
  writeln(' ');
  writeln('Ingrese una posicion de la fila del tablero del jugador 1: ');
  readln(f);
  writeln('Ingrese una posicion de la columna del tablero del jugador 1: ');
  readln(c);
  if j1[f,c] = 1 then
  begin
    writeln('Jugador 1 responde: HUNDIDO');
    j1[f,c]:=0;
  end
  else
    writeln('Jugador 1 responde: AGUA');
end;

function recorrer_tableros(j1:jugador1; j2:jugador2; maxfil:rangof; maxcol:rangoc):boolean;
var
  i:rangof;
  j:rangoc;
  k:integer;
  l:integer;
  vacio1:boolean;
  vacio2:boolean;
begin
  vacio1:=true;
  vacio2:=true;
  i:=1;
  while (i<=maxfil) and (vacio1 = true) do
  begin
    j:=1;
    while (j<=maxcol) and (vacio1 = true) do
    begin
      if j1[i,j] = 1 then
      vacio1:=false
      else
      j:=j+1;
    end;
    if vacio1 = true then
    i:=i+1;
  end;
  k:=1;
  while (k<=maxfil) and (vacio2 = true) do
  begin
    l:=1;
    while (l<=maxcol) and (vacio2 = true) do
    begin
      if j2[k,l] = 1 then
      vacio2:=false
      else
      l:=l+1;
    end;
    if vacio2 = true then
    k:=k+1;
  end;
  if vacio1 = true then
  begin
    writeln('El ganador es el jugador 2');
    recorrer_tableros:=vacio1;
  end
  else if vacio2 = true then
  begin
    writeln('El ganador es el jugador 1');
    recorrer_tableros:=vacio2;
  end
  else
    recorrer_tableros:=false;
end;

begin
  establecer_pos(j1,j2);
  while (recorrer_tableros(j1,j2,maxfil,maxcol) = false) do
  begin
    turno_j1(j2);
    recorrer_tableros(j1,j2,maxfil,maxcol);
    turno_j2(j1);
    recorrer_tableros(j1,j2,maxfil,maxcol);
  end;
  readln;
end.
