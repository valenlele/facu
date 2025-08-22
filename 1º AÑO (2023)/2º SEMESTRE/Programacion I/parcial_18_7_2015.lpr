program parcial_18_7_2015;

const
  fin=-1;
  maxLeng=5;

type
  rangoAnio=1990..2023;
  rangoLeng=1..maxLeng;
  proyecto=record
    numInt,cantPersonas,cantHoras:integer;
    desc:string;
    anioInicio,anioFin:rangoAnio;
    codLeng:rangoLeng;
  end;
  lista=^nodo;
  nodo=record
    datos:proyecto;
    sig:lista;
  end;

  vecCostos=array[1..maxLeng] of real;

  personasXlenguaje=array[1..maxLeng] of integer;

procedure inicializarCostosXhora(var vc:vecCostos); //se dispone enunciado
var
  i:rangoLeng;
begin
  writeln('INGRESE INFORMACION SOBRE EL COSTO POR HORA DE PROGRAMACION POR LENGUAJE: ');
  for i:=1 to maxLeng do begin
    write('El costo por hora de programacion del lenguaje ',i,' es: ');
    readln(vc[i]);
  end;
end;

procedure leerInfoProyecto(var p:proyecto);
begin
  writeln('INFORMACION PROYECTO: ');
  write('Numero interno: ');
  readln(p.numInt);
  if (p.numInt<>fin) then begin
    write('Anio de inicio del proyecto: ');
    readln(p.anioInicio);
    write('Anio de fin del proyecto: ');
    readln(p.anioFin);
    write('Codigo del lenguaje utilizado: ');
    readln(p.codLeng);
    write('Cantidad de personas participantes: ');
    readln(p.cantPersonas);
    write('Cantidad total de horas de programacion: ');
    readln(p.cantHoras);
  end;
end;

procedure insertarLista(var pri:lista; p:proyecto);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=p;
  nue^.sig:=pri;
  pri:=nue;
end;

procedure cargarLista(var pri:lista);
var
  p:proyecto;
begin
  leerInfoProyecto(p);
  while (p.numInt<>fin) do begin
    insertarLista(pri,p);
    leerInfoProyecto(p);
  end;
end;

procedure inicializarVectorPersonasXleng(var vp:personasXlenguaje);
var
  i:rangoLeng;
begin
  for i:=1 to maxLeng do vp[i]:=0;
end;

procedure insertarVecPersonas(var vp:personasXlenguaje; codLenguaje:rangoLeng; cantPersonas:integer);
begin
  vp[codLenguaje]:=vp[codLenguaje]+cantPersonas;
end;

procedure informarDosLenguajesMasUsados(vp:personasXlenguaje);
var
  i:rangoLeng;
  maxP1,maxP2:integer;
  maxLeng1,maxLeng2:rangoLeng;
begin
  maxP1:=-1;
  maxP2:=-1;
  for i:=1 to maxLeng do begin
    if (vp[i]>maxP1) then begin
      maxP2:=maxP1;
      maxLeng2:=maxLeng1;
      maxP1:=vp[i];
      maxLeng1:=i;
    end
    else if (vp[i]>maxP2) then begin
      maxP2:=vp[i];
      maxLeng2:=i;
    end;
  end;
  writeln('Los dos lenguajes mas utilizados son: ',maxLeng1,' y ',maxLeng2);
end;

function costoTotProyecto(vc:vecCostos; codLenguaje:rangoLeng; cantHoras:real):real;
begin
  costoTotProyecto:=vc[codLenguaje]*cantHoras;
end;

function duracionProyecto(anioFin,anioInicio:rangoAnio):integer;
begin
  duracionProyecto:=anioFin-anioInicio;
end;

procedure contabilizarCantPersonasPythonUnAnio(var cantPython:integer; cantPersonas:integer; codLenguaje:rangoLeng; anioFin,anioInicio:rangoAnio);
begin
  if (codLenguaje=3) and (duracionProyecto(anioFin,anioInicio)<1) then cantPython:=cantPython+cantPersonas;
end;

function cantDigImpar(numInt:integer):integer;
var
  dig:integer;
begin
  cantDigImpar:=0;
  while (numInt<>0) do begin
    dig:=numInt mod 10;
    if (dig mod 2<>0) then cantDigImpar:=cantDigImpar+1;
    numInt:=numInt div 10;
  end;
end;

procedure recorrerLista(pri:lista; vc:vecCostos; var vp:personasXlenguaje);
var
  cantPython,cantProyectos:integer;
begin
  cantPython:=0;
  cantProyectos:=0;
  inicializarVectorPersonasXleng(vp);
  while (pri<>nil) do begin
    insertarVecPersonas(vp,pri^.datos.codLeng,pri^.datos.cantPersonas);
    if (pri^.datos.anioInicio>=2000) and (pri^.datos.anioFin<=2014) then writeln('El costo final del proytecto ',pri^.datos.numInt,' es: ',costoTotProyecto(vc,pri^.datos.codLeng,pri^.datos.cantHoras):2:2);
    contabilizarCantPersonasPythonUnAnio(cantPython,pri^.datos.cantPersonas,pri^.datos.codLeng,pri^.datos.anioFin,pri^.datos.anioInicio);
    if (cantDigImpar(pri^.datos.numInt)>=3) then cantProyectos:=cantProyectos+1; {puede ser booleana. evaluo la condicion dentro de la function}
    pri:=pri^.sig;
  end;
  informarDosLenguajesMasUsados(vp);
  writeln('La cantidad de personas que participaron en proyectos que duraron menos de un anio donde se uso python es: ',cantPython);
  writeln('La cantidad de proyectos cuyo numero interno tiene al menos 3 digitos impares es ',cantProyectos);
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
  pri:lista;
  vc:vecCostos;
  vp:personasXlenguaje;

begin
  pri:=nil;
  inicializarCostosXhora(vc);
  cargarLista(pri);
  recorrerLista(pri,vc,vp);
  liberarMemoria(pri);
  readln;
end.
