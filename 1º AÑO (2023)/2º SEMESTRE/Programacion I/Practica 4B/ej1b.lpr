program ej1b;

type
  cadena=string[20];
  colectivo=record
    empresa:cadena;
    linea:integer;
    patente:integer;
    monto:integer;
  end;

procedure leerInfo(var c:colectivo);
begin
  with c do begin
    write('Ingrese el nombre de la empresa: ');
    readln(empresa);
    if (empresa<>'FIN') then begin
      write('Ingrese el numero de linea: ');
      readln(linea);
      write('Ingrese el numero de patente: ');
      readln(patente);
      write('Ingrese el monto recaudado: ');
      readln(monto);
    end;
  end;
end;

procedure procesarEmpresa(c:colectivo; var empresaAct:cadena);
var
  lineaAct,montLinea,montEmpresa:integer;
begin
  empresaAct:=c.empresa;
  montEmpresa:=0;
  while (c.empresa=empresaAct) do begin
    lineaAct:=c.linea;
    montLinea:=0;
    while (lineaAct=c.linea) and (empresaAct=c.empresa) do begin
      montLinea:=montLinea+c.monto;
      montEmpresa:=montEmpresa+montLinea;
      leerInfo(c);
    end;
    writeln('El monto recaudado por la linea ',lineaAct,' fue: ',montLinea);
  end;
  writeln('El monto recuadado por la empresa ',empresaAct,' fue: ',montEmpresa);
end;

var
  c:colectivo;
  empresaAct:cadena;

begin
  leerInfo(c);
  while (c.empresa<>'FIN') do procesarEmpresa(c,empresaAct);
  readln;
end.
