program ej5;

const
  dimF = 15;

type
  mTablero = record
    casillero:1..10;
    usado:boolean;
  end;
  tablero = array[1..dimF,1..dimF] of mTablero;

begin
end.
