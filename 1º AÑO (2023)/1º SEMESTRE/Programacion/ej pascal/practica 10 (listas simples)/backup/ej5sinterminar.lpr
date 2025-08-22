program ej5sinterminar;

const
  fin = 'xxx';

type
  cadena20 = string[20];
  participante = record
    apellido:cadena20;
    nombre:cadena20;
    sexo:cadena20;
    area:cadena20;
    pais:cadena20;
  end;
  lista = ^nodo;
  nodo = record
    datos:participante;
    sig:lista;
  end;
  lista_area = ^nodo_area;
  nodo_area = record
    nombre:cadena20;
    sig:lista_area;
  end;

var
  l:lista;
  l_a:lista_area;
  ap:cadena20;
  nom:cadena20;
  sex:cadena20;
  ar:cadena20;
  pa:cadena20;

procedure leer_datos(var ap:cadena20; var nom:cadena20; var sex:cadena20; var ar:cadena20; var pa:cadena20);
begin
  writeln('Ingrese el apellido del participante: ');
  readln(ap);
  writeln('Ingrese el nombre del participante: ');
  readln(nom);
  writeln('Ingrese el sexo del participante: ');
  readln(sex);
  writeln('Ingrese el area de investigacion del participante: ');
  readln(ar);
  writeln('Ingrese el pais del participante: ');
  readln(pa);
end;

procedure insertar_elementos(var l:lista; ap:cadena20; nom:cadena20; sex:cadena20; ar:cadena20; pa:cadena20);
var
  nue:lista;
begin
  new(nue);
  nue^.datos.apellido:=ap;
  nue^.datos.nombre:=nom;
  nue^.datos.sexo:=sex;
  nue^.datos.area:=ar;
  nue^.datos.pais:=pa;
  nue^.sig:=l;
  l:=nue;
end;

procedure insertar_area(var l_a:lista_area; ar:cadena20);
var
  nue:lista_area;
  ant:lista_area;
  act:lista_area;
begin
  new(nue);
  nue^.nombre:=ar;
  act:=l_a;
  ant:=nil;
  while (act <> nil) and (act^.nombre < ar) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if ant = nil then
  l_a:=nue
  else
  ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure cargar_lista(var l:lista; var l_a:lista_area);
begin
  l:=nil;
  repeat
    leer_datos(ap,nom,sex,ar,pa);
    insertar_area(l_a,ar);
    if ap <> fin then
    insertar_elementos(l,ap,nom,sex,ar,pa);
  until ap = fin;
end;

procedure mujeres_arg_web(l:lista);
var
  nue:lista;
  cant:integer;
begin
  nue:=l;
  cant:=0;
  while nue <> nil do
  begin
    if nue^.datos.sexo = 'mujer' then
    if nue^.datos.pais = 'argentina' then
    if nue^.datos.area = 'accesibilidad web' then
    begin
      writeln('El nombre y apellido de una participante mujer argentina en el area de desarrollo web es: ',nue^.datos.nombre,' ',nue^.datos.apellido);
      cant:=cant+1;
    end;
    nue:=nue^.sig;
  end;
  writeln('La cantidad de mujeres argentinas en el area de desarrollo web son: ',cant);
end;

procedure paises_no_arg(l:lista);
var
  nue:lista;
  porc:real;
  cant:integer;
  cant_tot:integer;
begin
  nue:=l;
  porc:=0;
  cant:=0;
  cant_tot:=0;
  while nue <> nil do
  begin
    if nue^.datos.pais <> 'argentina' then
    begin
      cant:=cant+1;
      cant_tot:=cant_tot+1;
    end
    else
    begin
      cant:=cant+1;
    end;
    nue:=nue^.sig;
  end;
  porc:=(cant*100)/cant_tot;
  writeln('El porcentaje de participantes que provienen de paises que no son argentina es: ',porc);
end;

procedure mostrar_lista(l:lista);
begin
  writeln('La lista es: ');
  while l <> nil do
  begin
    writeln('apellido: ',l^.datos.apellido);
    writeln('nombre: ',l^.datos.nombre);
    writeln('sexo: ',l^.datos.sexo);
    writeln('area: ',l^.datos.area);
    writeln('pais: ',l^.datos.pais);
    l:=l^.sig;
  end;
end;

procedure mostrar_lista_area(l_a:lista_area);
begin
  writeln('La lista de areas es: ');
  while l_a <> nil do
  begin
    writeln('area: ',l_a^.nombre);
    l_a:=l_a^.sig;
  end;
end;

begin
  cargar_lista(l,l_a);
  mujeres_arg_web(l);
  paises_no_arg(l);
  mostrar_lista(l);
  mostrar_lista_area(l_a);
  readln;
end.

