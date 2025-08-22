program ej1a;

const
  fin = 0;

type
  colectivo = record
    linea:integer;
    patente:integer;
    monto:integer;
  end;

var
  c:colectivo;
  act:integer;

procedure leeryprocesar(var c:colectivo);
var
  monto_tot:integer;
begin
  monto_tot:=0;
  with c do
    begin
      writeln('Ingrese el numero de linea: ');
        readln(linea);
      while linea <> fin do
        begin
          act:=linea;
          while act = linea do
            begin
              writeln('Ingrese el numero de patente: ');
                readln(patente);
              writeln('Ingrese el monto recaudado: ');
              readln(monto);
                monto_tot:=monto_tot+monto;
              writeln('Ingrese el numero de linea: ');
                readln(linea);
              if linea <> act then
                begin
                  writeln('El monto total recaudado por la linea ',act,' es: ',monto_tot);
                  monto_tot:=0;
                  act:=linea;
                end;
            end;
        end;
    end;
end;

begin
  leeryprocesar(c);
end.

