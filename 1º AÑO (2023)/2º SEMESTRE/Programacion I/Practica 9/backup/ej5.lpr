program ej5;

type
  participante=record
    nombre:string;
    apellido:string;
    sexo:string;
    area:string;
    pais:string;
  end;
  lista=^nodo;
  nodo=record
    datos:participante;
    sig:lista;
  end;

procedure insertarFinalLista(var pri:lista; nom,ap,sex,ar,pa:string);
var
  nue,pos:lista;
begin
  new(nue);
  nue^.datos.nombre:=nom;
  nue^.datos.apellido:=ap;
  nue^.datos.sexo:=sex;
  nue^.datos.area:=ar;
  nue^.datos.pais:=pa;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else begin
    pos:=pri;
    while (pos^.sig<>nil) do pos:=pos^.sig;
    pos^.sig:=nue;
  end;
end;

procedure leerInfoLista(var ap,sex,ar,pa:string);
begin
  write('Apellido: ');
  readln(ap);
  write('Sexo: ');
  readln(sex);
  write('Area de investigacion: ');
  readln(ar);
  write('Pais: ');
  readln(pa);
end;

procedure mujeresArgWeb(pri:lista; var totArg:integer);
begin
  if (pri^.datos.sexo='femenino') and (pri^.datos.pais='argentina') and (pri^.datos.area='accesibilidad web') then begin
    writeln('La participante de nombre ',pri^.datos.nombre,' es mujer, argentina y trabaja en el area de accesibilidad web');
    totArg:=totArg+1;
  end;
end;

procedure noArg(pri:lista; var totNoArg:integer);
begin
  if (pri^.datos.pais<>'argentina') then totNoArg:=totNoArg+1;
end;

procedure agregarListaOrdenadaArea(pri:lista; var pri2:lista);
var
  nue,act,ant:lista;
  encontre:boolean;
begin
  encontre:=false;
  new(nue);
  nue^.datos.nombre:=pri^.datos.nombre;
  nue^.datos.apellido:=pri^.datos.apellido;
  nue^.datos.sexo:=pri^.datos.sexo;
  nue^.datos.area:=pri^.datos.area;
  nue^.datos.pais:=pri^.datos.pais;
  act:=pri2;
  ant:=pri2;
  while (act<>nil) and (not encontre) do begin
    if (pri^.datos.pais<act^.datos.area) then encontre:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
  end;
  if (ant=act) then pri2:=nue
  else ant^.sig:=nue;
  nue^.sig:=act;
end;

procedure recorrerLista(pri:lista; var pri2:lista; var totArg,totNoArg,totPart:integer);
begin
  while (pri<>nil) do begin
    totPart:=totPart+1;
    mujeresArgWeb(pri,totArg);
    noArg(pri,totNoArg);
    agregarListaOrdenadaArea(pri,pri2);
    pri:=pri^.sig;
  end;
end;

procedure imprimirLista(pri:lista);
begin
  writeln('LISTA: ');
  while(pri<>nil) do begin
    writeln('INFORMACION DE PARTICIPANTE: ');
    writeln(pri^.datos.nombre);
    writeln(pri^.datos.apellido);
    writeln(pri^.datos.sexo);
    writeln(pri^.datos.area);
    writeln(pri^.datos.pais);
    writeln(' ');
    pri:=pri^.sig;
  end;
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
  pri,pri2:lista;
  nom,ap,sex,ar,pa:string;
  totArg,totNoArg,totPart:integer;

begin
  pri:=nil;
  pri2:=nil;
  totArg:=0;
  totNoArg:=0;
  totPart:=0;
  writeln('INGRESE INFORMACION DE UN PARTICIPANTE: ');
  write('Nombre: ');
  readln(nom);
  while (nom<>'.') do begin
    leerInfoLista(ap,sex,ar,pa);
    InsertarFinalLista(pri,nom,ap,sex,ar,pa);
    writeln('INGRESE INFORMACION DE UN PARTICIPANTE: ');
    write('Nombre: ');
    readln(nom);
  end;
  imprimirLista(pri);
  recorrerLista(pri,pri2,totArg,totNoArg,totPart);
  writeln('El porcentaje de participantes que no son de argentina es: ',(totNoArg*100)/totPart:2:2);
  imprimirLista(pri2);
  liberarMemoria(pri);
  liberarMemoria(pri2);
  readln;
end.

