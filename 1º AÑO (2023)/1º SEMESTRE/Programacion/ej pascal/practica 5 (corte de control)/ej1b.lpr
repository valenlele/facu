program ej1b;

const
  fin = 'fin';

type
  cadena20 = string[20];
  colectivo = record
    empresa:cadena20;
    linea:integer;
    patente:integer;
    monto:integer;
  end;

var
  c:colectivo;
  linea_act:integer;
  empresa_act:cadena20;

procedure leeryprocesar(var c:colectivo);
var
  monto_linea:integer;
  monto_empresa:integer;
begin
  monto_linea:=0;
  monto_empresa:=0;
  with c do
    begin
      writeln('Ingrese el nombre de la empresa: ');
      readln(empresa);
      while empresa <> fin do
        begin
          empresa_act:=empresa;
          while empresa_act = empresa do
            begin
              writeln('Ingrese el numero de linea: ');
              readln(linea);
              linea_act:=linea;
              while linea_act = linea do
                begin
                  writeln('Ingrese el numero de patente: ');
                  readln(patente);
                  writeln('Ingrese el monto recaudado: ');
                  readln(monto);
                  monto_linea:=monto_linea+monto;
                  monto_empresa:=monto_empresa+monto;
                  writeln('Ingrese el numero de empresa: ');
                  readln(empresa);
                  if empresa <> empresa_act then
                    begin
                      writeln('El monto total recaudado por la empresa ',empresa_act,' es: ',monto_empresa);
                      monto_empresa:=0;
                      empresa_act:=empresa;
                    end;
                  writeln('Ingrese el numero de linea: ');
                  readln(linea);
                  if linea <> linea_act then
                    begin
                      writeln('El monto total recaudado por la linea ',linea_act,' es: ',monto_linea);
                      monto_linea:=0;
                      linea_act:=linea;
                    end;
              end;
            end;
        end;
    end;
end;

begin
  leeryprocesar(c);
end.

