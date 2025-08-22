program ej1a;

type
  colectivo=record
    nLinea:integer;
    patente:integer;
    monto:integer;
  end;

procedure leerInfo(var c:colectivo);
begin
  with c do begin
    write('Ingrese el numero de linea: ');
    readln(nLinea);
    if (nLinea<>0) then begin
      write('Ingrese el numero de patente: ');
      readln(patente);
      write('Ingrese el monto recaudado: ');
      readln(monto);
    end;
  end;
end;

procedure montoRecaudadoLinea(c:colectivo; var lineaAct:integer);
var
  montLinea:integer;
begin
  leerInfo(c);
  lineaAct:=c.nLinea;
  while (c.nLinea<>0) do begin
    montLinea:=0;
    while (c.nLinea=lineaAct) do begin
      montLinea:=montLinea+c.monto;
      leerInfo(c);
    end;
    writeln('El monto recudado por la linea ',lineaAct,' es: ',montLinea);
    if (c.nLinea<>0) then lineaAct:=c.nLinea;
  end;
end;

var
  c:colectivo;
  lineaAct:integer;

begin
  lineaAct:=0;
  montoRecaudadoLinea(c,lineaAct);
  readln;
end.
