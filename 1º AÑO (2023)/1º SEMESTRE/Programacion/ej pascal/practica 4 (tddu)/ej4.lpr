program ej4;

const
  fin = 9999;

type
  cadena10 = string[10];
  productos = record
    codigo:integer;
    tipo:cadena10;
    unidades:integer;
    precio:integer;
  end;

var
  p:productos;
  cant_alfa_mes:integer;
  promedio:real;
  maxcod1:integer;
  maxcod2:integer;
  maxu1:integer;
  maxu2:integer;

procedure leer(var p:productos);
begin
  with p do
  begin
    writeln('Ingrese el codigo del producto: ');
      readln(codigo);
      if codigo <> fin then
        begin
          writeln('Ingrese el tipo del producto: ');
            readln(tipo);
          writeln('Ingrese la cantidad de unidades fabricadas en el mes: ');
            readln(unidades);
          writeln('Ingrese el precio del producto: ');
            readln(precio);
        end;
  end;
end;

procedure cant_alfa(var p:productos; var cant_alfa_mes:integer);
begin
  if p.tipo = 'alfajor' then
    cant_alfa_mes:=cant_alfa_mes+p.unidades;
end;

procedure prom_merm(var p:productos; var promedio:real);
var
  precio_tot:integer;
  unidades_tot:integer;
  cant_merm:integer;
begin
  precio_tot:=0;
  unidades_tot:=0;
  cant_merm:=0;
  if p.tipo = 'mermelada' then
    begin
      precio_tot:=precio_tot+p.precio;
      unidades_tot:=unidades_tot+p.unidades;
      cant_merm:=cant_merm+1;
    end;
  if cant_merm > 0 then
    promedio:=unidades_tot/precio_tot;
end;

procedure mayor(var p:productos; var maxcod1:integer; var maxcod2:integer; var maxu1:integer; var maxu2:integer);
begin
  if p.unidades > maxu1 then
    begin
      maxu2:=maxu1;
      maxcod2:=maxcod1;
      maxu1:=p.unidades;
      maxcod1:=p.codigo;
    end
  else if p.unidades > maxu2 then
    begin
      maxu2:=p.unidades;
      maxcod2:=p.codigo;
    end;
end;

begin
  cant_alfa_mes:=0;
  promedio:=0;
  maxcod1:=-1;
  maxcod2:=-1;
  maxu1:=-1;
  maxu2:=-1;
  leer(p);
  while p.codigo <> fin do
    begin
      cant_alfa(p,cant_alfa_mes);
      prom_merm(p,promedio);
      mayor(p,maxcod1,maxcod2,maxu1,maxu2);
      leer(p);
    end;
  writeln('La cantidad de alfajores fabricados en el mes son: ',cant_alfa_mes);
  if promedio > 0 then
    writeln('El precio promedio de las mermeladas es: ',promedio:0:2);
  writeln('Los codigos de los dos productos con mayor unidades de fabricacion son: ',maxcod1,'y ',maxcod2);
  readln;
end.
