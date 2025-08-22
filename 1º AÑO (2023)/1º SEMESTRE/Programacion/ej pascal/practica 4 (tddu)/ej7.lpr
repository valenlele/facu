program ej7;

type
  cadena30 = string[30];
  edades = 1..100;

  platos = record
    plato_presen:cadena30;
    tipo:cadena30;
    ing_principal:cadena30;
  end;

  congreso = record
    pais:cadena30;
    nombre:cadena30;
    apellido:cadena30;
    plato:platos;
    sexo:cadena30;
    edad:edades;
  end;

var
  c:congreso;
  p:platos;
  max:integer;
  max_pais:cadena30;
  cant:integer;
  promedio:real;
  tot_edad:integer;
  tot_part:integer;
  i:integer;
  j:integer;

procedure leer(var c:congreso; var p:platos);
begin
  with c do
    begin
      writeln('Ingrese el nombre del participante: ');
        readln(nombre);
      writeln('Ingrese el apellido del participante: ');
        readln(apellido);
      writeln('Ingrese el plato a presentar del participante: ');
        readln(p.plato_presen);
      writeln('Ingrese si el plato es frio o caliente: ');
        readln(p.tipo);
      writeln('Ingrese el ingrediente principal del plato: ');
        readln(p.ing_principal);
      writeln('Ingrese el sexo del participante: ');
        readln(sexo);
      writeln('Ingrese la edad del participante: ');
        readln(edad);
    end;
end;

procedure platos_frios_fem(var c:congreso; var p:platos; var cant:integer);
begin
  if (c.sexo = 'femenino') and (p.tipo = 'frio') then
    cant:=cant+1;
end;

procedure prom_edad(var c:congreso; var promedio:real; var tot_edad:integer; var tot_part:integer);
begin
  tot_edad:=tot_edad+c.edad;
  tot_part:=tot_part+1;
  promedio:=tot_edad/tot_part;
end;

procedure pollo(var c:congreso; var p:platos);
begin
  if (p.tipo = 'caliente') and (p.ing_principal = 'pollo') then
    begin
      writeln('El nombre y apellido del participante que presenta un plato frio con pollo es: ',c.nombre,c.apellido);
      writeln('Su pais es: ',c.pais);
    end;
end;

begin
  cant:=0;
  promedio:=0;
  tot_edad:=0;
  tot_part:=0;
  max:=-1;
  for i:=1 to 20 do
    begin
      writeln('Ingrese el pais de los participantes: ');
        readln(c.pais);
      for j:=1 to 7 do
        begin
          leer(c,p);
          platos_frios_fem(c,p,cant);
          prom_edad(c,promedio,tot_edad,tot_part);
          pollo(c,p);
        end;
      if cant > max then
        begin
          max:=cant;
          max_pais:=c.pais;
          cant:=0;
        end;
    end;
  writeln('El pais con mayor cantidad de participantes femeninos que presentan platos frios es: ',max_pais);
  writeln('La edad promedio de los participantes es: ',promedio:0:2);
  readln;
end.
