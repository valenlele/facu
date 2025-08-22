program eliminarFilaColumna;

const
  maxFil=3;
  maxCol=3;

type
  rangoFil=0..maxFil;
  rangoCol=0..maxCol;
  matriz=array[rangoFil,rangoCol] of integer;

procedure cargarMatriz(var m:matriz; var dimLfil:rangoFil; var dimLcol:rangoCol);
var
  fil:rangoFil;
  col:rangoCol;
begin
  dimLfil:=0;
  dimLcol:=0;
  writeln('INGRESE VALORES PARA CARGAR MATRIZ: ');
  for fil:=1 to maxFil do begin
    for col:=1 to maxCol do begin
      write('Valor ',fil,'x',col,': ');
      readln(m[fil,col]);
    end;
    dimLfil:=dimLfil+1;
    dimLcol:=dimLcol+1;
  end;
end;

procedure imprimirMatriz(m:matriz; dimLfil:rangoFil; dimLcol:rangoCol);
var
  fil:rangoFil;
  col:rangoCol;
begin
  writeln('LA MATRIZ ES: ');
  writeln(' ');
  for fil:=1 to dimLfil do begin
    for col:=1 to dimLCol do begin
      write(m[fil,col]);
      write(' ');
    end;
    writeln(' ');
  end;
  writeln(' ');
end;

procedure eliminarFila(var m:matriz; var dimLfil:rangoFil; dimLcol:rangoCol; fila:rangoFil);
var
  fil:rangoFil;
  col:rangoCol;
  i:rangoFil;
begin
  fil:=fila;
  for i:=fila to dimLfil-1 do begin
    for col:=1 to dimLCol do m[fil,col]:=m[fil+1,col];
    fil:=fil+1;
  end;
  dimLfil:=dimLfil-1;
end;

procedure eliminarColumna(var m:matriz; var dimLCol:rangoCol; dimLFil:rangoFil; columna:rangoCol);
var
  fil:rangoFil;
  col:rangoCol;
  i:rangoCol;
begin
  col:=columna;
  for i:=columna to dimLCol-1 do begin
    for fil:=1 to dimLFil do m[fil,col]:=m[fil,col+1];
    col:=col+1;
  end;
  dimLCol:=dimLCol-1;
end;

var
  m:matriz;
  dimLfil,fila:rangoFil;
  dimLcol,columna:rangoCol;

begin
  cargarMatriz(m,dimlfil,dimlCol);
  imprimirMatriz(m,dimLfil,dimLcol);
  write('INGRESE LA FILA QUE QUIERE ELIMINAR: ');
  readln(fila);
  eliminarFila(m,dimLfil,dimLcol,fila);
  imprimirMatriz(m,dimLfil,dimLcol);
  write('INGRESE LA COLUMNA QUE QUIERE ELIMINAR: ');
  readln(columna);
  eliminarColumna(m,dimLcol,dimLfil,columna);
  imprimirMatriz(m,dimLfil,dimLcol);
  readln;
end.
