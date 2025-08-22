program ej5;

const
  maxFil=15;
  maxCol=15;
  fin=0;

type
  rangoFil=0..maxFil;
  rangoCol=1..maxCol;
  rangoValor=0..10;
  casillero=record
    num:rangoValor;
    uti:boolean;
  end;
  tablero=array[rangoFil,rangoCol] of casillero;

  valoresCasillero=record
    fil:rangoFil;
    col:rangoCol;
    val:rangoValor;
  end;
  lista=^nodo;
  nodo=record
    datos:valoresCasillero;
    sig:lista;
  end;

procedure leerInfoCasillero(var c:valoresCasillero);
begin
  with c do begin
    writeln('INGRESE INFORMACION DE UN CASILLERO: ');
    write('Fila: ');
    readln(fil);
    if (fil<>fin) then begin
      write('Columna: ');
      readln(col);
      write('Valor del casillero: ');
      readln(val);
      writeln(' ');
    end;
  end;
end;

procedure insertarFinal(var pri,ult:lista; c:valoresCasillero);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=c;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarListaValores(var pri,ult:lista);
var
  c:valoresCasillero;
begin
  leerInfoCasillero(c);
  while (c.fil<>fin) do begin
    insertarFinal(pri,ult,c);
    leerInfoCasillero(c);
  end;
end;

procedure inicializarValoresTablero(var t:tablero);
var
  i:rangoFil;
  j:rangoCol;
begin
  for i:=1 to maxFil do begin
    for j:=1 to maxCol do t[i,j].num:=0;
  end;
end;

procedure insertarValoresTablero(var t:tablero; pri:lista);
begin
  t[pri^.datos.fil,pri^.datos.col].num:=pri^.datos.val;
  t[pri^.datos.fil,pri^.datos.col].uti:=false;
end;

procedure inicializarTablero(var t:tablero; pri:lista);
begin
  inicializarValoresTablero(t);
  while (pri<>nil) do begin
    insertarValoresTablero(t,pri);
    pri:=pri^.sig;
  end;
end;

procedure puntos(var t:tablero; fil1,fil2:rangoFil; col1,col2:rangoCol; var pJ1,pJ2:integer);
begin
  if (t[fil1,col1].uti=true) and (t[fil2,col2].uti=true) then writeln('AMBOS JUGADORES ELIGIERON CELDAS YA UTILIZADAS. NO SE SUMAN PUNTOS')
  else if (t[fil1,col1].uti=true) and (t[fil2,col2].uti=false) then
  begin
    writeln('JUGADOR 1 ELIGIO CELDA YA UTILIZADA. PUNTO PARA JUGADOR 2');
    pJ2:=pJ2+1;
  end
  else if (t[fil1,col1].uti=false) and (t[fil2,col2].uti=true) then
  begin
    writeln('JUGADOR 2 ELIGIO CELDA YA UTILIZADA. PUNTO PARA JUGADOR 1');
    pJ1:=pJ1+1;
  end
  else if (t[fil1,col1].num=t[fil2,col2].num) then begin
    writeln('AMBOS JUGADORES ELIGIERON CASILLAS CON MISMO VALOR. NINGUNO SUMA PUNTOS');
    t[fil1,col1].uti:=true;
    t[fil2,col2].uti:=true;
  end
  else if (t[fil1,col1].num>t[fil2,col2].num) then begin
    writeln('PUNTO PARA JUGADOR 1');
    t[fil1,col1].uti:=true;
    t[fil2,col2].uti:=true;
  end
  else if (t[fil2,col2].num>t[fil1,col1].num) then begin
    writeln('PUNTO PARA JUGADOR 2');
    t[fil1,col1].uti:=true;
    t[fil2,col2].uti:=true;
  end;
end;

procedure informarPuntosYganador(pJ1,pJ2:integer);
begin
  writeln('PUNTOS JUAGDOR 1: ',pJ1);
  writeln('PUNTOS JUGADOR 2: ',pJ2);
  if (pJ1>pJ2) then writeln('GANADOR: JUGADOR 1')
  else if (pJ2>pJ1) then writeln('GANADOR: JUGADOR 2')
  else writeln('EMPATE');
end;

procedure rondas(var t:tablero; pri:lista);
var
  i:rangoValor;
  fil1,fil2:rangoFil;
  col1,col2:rangoCol;
  pJ1,pJ2:integer;
begin
  pJ1:=0;
  pJ2:=0;
  for i:=1 to 10 do begin
    writeln('TURNO JUGADOR 1');
    write('INGRESE EL VALOR DE UNA FILA: ');
    readln(fil1);
    write('INGRESE EL VALOR DE UNA COLUMNA: ');
    readln(col1);
    writeln('TURNO JUGADOR 2');
    write('INGRESE EL VALOR DE UNA FILA: ');
    readln(fil2);
    write('INGRESE EL VALOR DE UNA COLUMNA: ');
    readln(col2);
    puntos(t,fil1,fil2,col1,col2,pJ1,pJ2);
    writeln(' ');
  end;
  informarPuntosYganador(pJ1,pJ2);
end;

procedure liberarMemoria(var pri:lista);
var
  aux:lista;
begin
  while (pri<>nil) do begin
    aux:=pri;
    pri:=pri^.sig;
    dispose(aux);
  end;
end;

var
  pri,ult:lista;
  t:tablero;

begin
  pri:=nil;
  cargarListaValores(pri,ult);
  inicializarTablero(t,pri);
  rondas(t,pri);
  liberarMemoria(pri);
  readln;
end.

