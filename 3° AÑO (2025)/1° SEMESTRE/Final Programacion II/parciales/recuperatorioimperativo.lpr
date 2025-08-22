program recuperatorioimperativo;

const
  fin=99999999;

type
  fecha=record
    dia:1..31;
    mes:1..12;
    anio:1900..2025;
  end;

  persona=record
    dni:longint;
    edad:integer;
    esExtranjera:boolean;
  end;

  visita=record
    id:integer;
    fechaVisita:fecha;
    ingresoEgreso:char;
    destino:string;
    personaVisita:persona;
  end;

  datosL=record
    id:integer;
    fechaVisita:fecha;
    ingresoEgreso:char;
    destino:string;
  end;

  listaVisitas=^nodoL;
  nodoL=record
    datos:datosL;
    sig:listaVisitas;
  end;

  datosA=record
    dni:longint;
    edad,cantVisitas:integer;
    esExtranjera:boolean;
    lvisitas:listaVisitas;
  end;

  arbol=^nodoArbol;
  nodoArbol=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

procedure leerInfoVisita(var v:visita);
var
  car:char;
  num:integer;
begin
  writeln('Se ingesa informacion de persona que ingresa o egresa del pais: ');
  with (v) do begin
    write('DNI: ');
    readln(personaVisita.dni);
    if (personaVisita.dni<>fin) then begin
      write('Edad: ');
      readln(personaVisita.edad);
      write('Es extranjera (0 no 1 si)?: ');
      readln(num);
      if (num=0) then personaVisita.esExtranjera:=false
      else if (num=1) then personaVisita.esExtranjera:=true;
      writeln('Se ingresa informacion de una visita: ');
      write('Identificador de visita: ');
      readln(id);
      write('Fecha de visita (dia/mes/anio): ');
      with (fechaVisita) do begin
        readln(dia);
        readln(mes);
        readln(anio);
      end;
      write('Es un ingreso o egreso? (presione i o e): ');
      readln(car);
      if (car='i') then ingresoEgreso:='i'
      else if (car='e') then ingresoEgreso:='e';
      write('Destino hacia donde va/de donde viene: ');
      readln(destino);
    end;
  end;
end;

procedure insertarFinal(var lVisitas:listaVisitas; v:visita);
var
  nue,act:listaVisitas;
begin
  new(nue);
  nue^.datos.id:=v.id;
  nue^.datos.fechaVisita:=v.fechaVisita;
  nue^.datos.ingresoEgreso:=v.ingresoEgreso;
  nue^.datos.destino:=v.destino;
  nue^.sig:=nil;
  if (lVisitas<>nil) then begin
    act:=lVisitas;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lVisitas:=nue;
end;

procedure insertarDatos(var a:arbol; v:visita);
begin
  a^.datos.dni:=v.personaVisita.dni;
  a^.datos.edad:=v.personaVisita.edad;
  a^.datos.esExtranjera:=v.personaVisita.esExtranjera;
  a^.datos.cantVisitas:=1;
  a^.datos.lVisitas:=nil;
  insertarFinal(a^.datos.lVisitas,v);
end;

procedure insertarArbol(var a:arbol; v:visita);
begin
  if (a=nil) then begin
    new(a);
    a^.HI:=nil;
    a^.HD:=nil;
    insertarDatos(a,v);
  end
  else if (a^.datos.dni>v.personaVisita.dni) then insertarArbol(a^.HI,v)
  else if (a^.datos.dni<v.personaVisita.dni) then insertarArbol(a^.HD,v)
  else begin
    a^.datos.cantVisitas:=a^.datos.cantVisitas+1;
    insertarFinal(a^.datos.lVisitas,v);
  end;
end;

procedure cargarArbol(var a:arbol);
var
  v:visita;
begin
  leerInfoVisita(v);
  while (v.personaVisita.dni<>fin) do begin
    insertarArbol(a,v);
    leerInfoVisita(v);
  end;
end;

procedure imprimirListadoVisitas(lVisitas:listaVisitas);
begin
  while (lVisitas<>nil) do begin
    writeln('Identificador visita: ',lVisitas^.datos.id);
    writeln('Fecha(dia/mes/anio): ',lVisitas^.datos.fechaVisita.dia,'/',lVisitas^.datos.fechaVisita.mes,'/',lVisitas^.datos.fechaVisita.anio);
    if (lVisitas^.datos.ingresoEgreso='i') then writeln('Es un ingreso')
    else if (lVisitas^.datos.ingresoEgreso='e') then writeln('Es un egreso');
    writeln('Destino: ',lVisitas^.datos.destino);
    writeln(' ');
    lVisitas:=lVisitas^.sig;
  end;
end;

procedure imprimirPersona(p:datosA);
begin
  writeln('DNI: ',p.dni,'. Edad: ',p.edad);
  if (p.esExtranjera) then writeln('Es extranjera')
  else writeln('No es extranjera');
  writeln('Listado visitas: ');
  imprimirListadoVisitas(p.lVisitas);
  writeln(' ');
  writeln(' ');
end;

procedure recorrerEimprimirArbol(a:arbol);
begin
  if (a<>nil) then begin
    recorrerEimprimirArbol(a^.HI);
    imprimirPersona(a^.datos);
    recorrerEimprimirArbol(a^.HD);
  end;
end;

procedure informar(p:datosA);
begin
  writeln('DNI: ',p.dni,'. Cantidad de visitas: ',p.cantVisitas);
end;

procedure evaluarEinformar(p:datosA);
begin
  if (not p.esExtranjera) and (p.edad>30) and (p.lVisitas^.datos.ingresoEgreso='e') then informar(p);
end;

procedure recorrerEinformarArgentinos(a:arbol);
begin
  if (a<>nil) then begin
    recorrerEinformarArgentinos(a^.HD);
    evaluarEinformar(a^.datos);
    recorrerEinformarArgentinos(a^.HI);
  end;
end;

function contarVisitas(lVisitas:listaVisitas):integer;
var
  cont:integer;
begin
  cont:=0;
  while (lVisitas<>nil) do begin
    if (lVisitas^.datos.fechaVisita.anio=2024) and (lVisitas^.datos.fechaVisita.mes>=3) and (lVisitas^.datos.fechaVisita.mes<=11) then cont:=cont+1;
    lVisitas:=lVisitas^.sig;
  end;
  contarVisitas:=cont;
end;

function calcularPromedioVisitas(cantVisitas:integer):real;
begin
  calcularPromedioVisitas:=cantVisitas/240;  //cantidad de visitas totales de una persona entre la cantidad de dias que hay entre marzo y noviembre
end;

{function dniPromedioVisitas(a:arbol; var max:real; var maxDni:longint):longint;
var
  cantVisitasMarzoNoviembre:integer;
  promedioVisitas:real;
begin
  if (a<>nil) then begin
    cantVisitasMarzoNoviembre:=contarVisitas(a^.datos.lVisitas);
    promedioVisitas:=calcularPromedioVisitas(cantVisitasMarzoNoviembre);
    if (promedioVisitas>max) then begin
      max:=promedioVisitas;
      maxDni:=a^.datos.dni;
    end;
    dniPromedioVisitas(a^.HI,max,maxDni);
    dniPromedioVisitas(a^.HD,max,maxDni);
  end;
  dniPromedioVisitas:=maxDni;
end;}

procedure dniPromedioVisitas(a:arbol; var max:real; var maxDni:longint);
var
  cantVisitasMarzoNoviembre:integer;
  promedioVisitas:real;
begin
  if (a<>nil) then begin
    cantVisitasMarzoNoviembre:=contarVisitas(a^.datos.lVisitas);
    promedioVisitas:=calcularPromedioVisitas(cantVisitasMarzoNoviembre);
    if (promedioVisitas>max) then begin
      max:=promedioVisitas;
      maxDni:=a^.datos.dni;
    end;
    dniPromedioVisitas(a^.HI,max,maxDni);
    dniPromedioVisitas(a^.HD,max,maxDni);
  end;
end;

function cantEnRango(a:arbol; inf,sup:longint; var cant:integer):integer;
begin
  if (a<>nil) then
    if (a^.datos.dni>=inf) then
      if (a^.datos.dni<=sup) then begin
        cant:=cant+1;
        cantEnRango(a^.HI,inf,sup,cant);
        cantEnRango(a^.HD,inf,sup,cant);
      end
      else
        cantEnRango(a^.HI,inf,sup,cant)
    else
      cantEnRango(a^.HD,inf,sup,cant);
  cantEnRango:=cant;
end;

var
  a:arbol;
  max:real;
  maxDni:longint;
  cant:integer;

begin
  a:=nil;
  cargarArbol(a);
  writeln(' ');
  writeln('Arbol generado: ');
  writeln(' ');
  recorrerEimprimirArbol(a);

  writeln('Se imprime informacion de argentinos mayores de 30 anios que salieron del pais: ');
  recorrerEinformarArgentinos(a);
  writeln(' ');

  max:=-1;
  maxDni:=0;
  dniPromedioVisitas(a,max,maxDni);
  {writeln('El DNI de la persona que tuvo el mayor promedio de visitas entre marzo y noviembre de 2024 es: ',dniPromedioVisitas(a,max,maxDni));}
  writeln('El DNI de la persona que tuvo el mayor promedio de visitas entre marzo y noviembre de 2024 es: ',maxDni);
  writeln(' ');

  cant:=0;
  writeln('La cantidad de personas cuyo DNI se encuentra entre 34000000 y 42000000 es: ',cantEnRango(a,34000000,42000000,cant));
  readln;
end.
