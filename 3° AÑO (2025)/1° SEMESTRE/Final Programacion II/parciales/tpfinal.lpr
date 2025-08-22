Program tpfinal;

Uses
     sysutils;
Type
     str70= string[70];

     jugador = record
        DNI: longint;
	nombre_apellido: str70;
        seleccion: str70;
	goles: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
	    dato: jugador;
	    sig: lista;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;

    partido= record
      codigo: longint;
      seleccion_l: str70;
      seleccion_2: str70;
      fecha_partido: fecha;
      estadio: str70;
      goleadores: lista;
    end;

     listaPartidos = ^nodoPartidos;
     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end;

     nombres= array [1..20] of str70;

  dList=record
    fechaPart:fecha;
    estadio:str70;
    cantGoles:integer;
  end;

  listado=^nodoL;
  nodoL=record
    datos:dList;
    sig:listado;
  end;

  datosA=record
    dni:longint;
    nomAp:str70;
    seleccion:str70;
    totGoles:integer;
    list:listado;
  end;

  arbol=^nodoArbol;
  nodoArbol=record
    datos:datosA;
    HI:arbol;
    HD:arbol;
  end;

  vecSelecciones = array [1..16] of str70;

procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(1)+6;
  if((f.mes = 6) and (f.dia = 31))then
            f.dia := 30;
  f.anio:=2024;
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Argentina';
     v[2]:='Brasil';
     v[3]:='Colombia';
     v[4]:='Canada';
     v[5]:='Ecuador';
     v[6]:='Peru';
     v[7]:='Chile';
     v[8]:='Bolivia';
     v[9]:='Venezuela';
     v[10]:='Mexico';
     v[11]:='Costa Rica';
     v[12]:='Estados Unidos';
     v[13]:='Jamaica';
     v[14]:='Panama';
     v[15]:='Paraguay';
     v[16]:='Uruguay';
end;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(3);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Argentina')or(visitante='Argentina'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   seleccion:='Argentina';
		   goles:=random(3)+1;
        end;
        agregarJugador(l, j);
     end;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            seleccion:=local
          else
            seleccion:=visitante;
	      goles:=random(3)+1;
       end;
       agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(30)+1;
     v[1]:= 'Mercedes-Benz Stadium';
     v[2]:= 'Levi`s Stadium';
     v[3]:= 'Bank of America Stadium';
     v[4]:= 'State Farm Stadium';
     v[5]:= 'SoFi Stadium';
     v[6]:= 'Inter&Co Stadium';
     v[7]:= 'NRG Stadium';
     v[8]:= 'Q2 Stadium';
     v[9]:= 'AT&T Stadium';
     v[10]:= 'MetLife Stadium';
     v[11]:= 'Allegiant Stadium';
     v[12]:= 'Arrowhead Stadium';
     v[13]:= 'Children`s Mercy Park';
     v[14]:= 'Hard Rock Stadium';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               codigo:= random (100000)+1;
               pos:= random(14)+1;
               estadio:= v[pos];
               loc:= random(16)+1;
               seleccion_l:=v2[loc];
               vis:= random(16)+1;
               seleccion_2:=v2[vis];
               while(seleccion_l=seleccion_2)do
               begin
                   vis:= random(16)+1;
                   seleccion_2:=v2[vis];
               end;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, seleccion_l, seleccion_2);
          end;
          agregar(l, p);
       end;
end;

procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | SELECCION: ', seleccion, ' | GOLES: ', goles);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('PARTIDO: ', codigo, ' | SELECCION 1: ',seleccion_l, ' | SELECCION 2: ', seleccion_2, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure insertarFinal(var list:listado; p:partido);
var
  nue,act:listado;
begin
  new(nue);
  nue^.datos.fechaPart:=p.fecha_partido;
  nue^.datos.estadio:=p.estadio;
  nue^.datos.cantGoles:=p.goleadores^.dato.goles;
  nue^.sig:=nil;
  if (list<>nil) then begin
    act:=list;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else list:=nue;
end;

procedure insertarDatos(var a:arbol; p:partido);
begin
  a^.datos.dni:=p.goleadores^.dato.DNI;
  a^.datos.nomAp:=p.goleadores^.dato.nombre_apellido;
  a^.datos.seleccion:=p.goleadores^.dato.seleccion;
  a^.datos.totGoles:=p.goleadores^.dato.goles;
  a^.datos.list:=nil;
  insertarFinal(a^.datos.list,p);
end;

procedure insertarArbol(var a:arbol; p:partido);
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,p);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.dni>p.goleadores^.dato.DNI) then insertarArbol(a^.HI,p)
  else if (a^.datos.dni<p.goleadores^.dato.DNI) then insertarArbol(a^.HD,p)
  else begin
    insertarFinal(a^.datos.list,p);
    a^.datos.totGoles:=a^.datos.totGoles+p.goleadores^.dato.goles;
  end;
end;

procedure cargarArbol(var a:arbol; l:listaPartidos);
begin
  while (l<>nil) do begin
    while (l^.dato.goleadores<>nil) do begin
      insertarArbol(a,l^.dato);
      l^.dato.goleadores:=l^.dato.goleadores^.sig;
    end;
    l:=l^.sig;
  end;
end;

procedure imprimirListado(list:listado);
begin
  while (list<>nil) do begin
    writeln('Fecha (dia/mes/anio): ',list^.datos.fechaPart.dia,'/',list^.datos.fechaPart.mes,'/',list^.datos.fechaPart.anio,'. Estadio: ',list^.datos.estadio,'. Cantidad de goles: ',list^.datos.cantGoles);
    list:=list^.sig;
  end;
end;

procedure imprimirJugadorCompleto(j:datosA);
begin
  writeln('DNI: ',j.dni,'. Nombre y apellido: ',j.nomAp,'. Seleccion: ',j.seleccion,'. Goles totales: ',j.totGoles,'. Listado: ');
  imprimirListado(j.list);
  writeln(' ');
end;

procedure recorrerEimprimirArbol(a:arbol);
begin
  if (a<>nil) then begin
    recorrerEimprimirArbol(a^.HI);
    imprimirJugadorCompleto(a^.datos);
    recorrerEimprimirArbol(a^.HD);
  end;
end;

procedure imprimirJugador(j:datosA);
begin
  writeln('DNI: ',j.dni);
  writeln('Nombre y apellido: ',j.nomAp);
  writeln('Cantidad total de goles: ',j.totGoles);
  writeln(' ');
end;

procedure enRango(a:arbol; inf,sup:longint);
begin
  if (a<>nil) then
    if (a^.datos.dni>=inf) then
      if (a^.datos.dni<=sup) then begin
        enRango(a^.HD,inf,sup);
        imprimirJugador(a^.datos);
        enRango(a^.HI,inf,sup);
      end
      else
        enRango(a^.HI,inf,sup)
    else
      enRango(a^.HD,inf,sup);
end;

procedure evaluar(datos:datosA; var cumple:boolean);
var
  partido:dList;
begin
  partido:=datos.list^.datos;
  if (partido.fechaPart.dia>=15) then begin
    if (partido.fechaPart.mes>=6) and (datos.list^.datos.fechaPart.mes<=7) then begin
      if (partido.estadio='MetLife Stadium') or
      (partido.estadio='Inter&Co Stadium') or
      (partido.estadio='Bank of America Stadium') then begin cumple:=true;
      end;
    end;
  end;
end;

function estaEnVector(vec:vecSelecciones; dimL:integer; seleccion:str70):boolean;
var
  i:integer;
begin
  i:=1;
  while (i<=dimL) and (vec[i]<>seleccion) do i:=i+1;
  estaEnVector:=i<=dimL;
end;

procedure insertarVector(seleccion:str70; var vec:vecSelecciones; var dimL:integer);
begin
  dimL:=dimL+1;
  vec[dimL]:=seleccion;
end;

procedure buscarSelecciones(a:arbol; var cumple:boolean; var vec:vecSelecciones; var dimL:integer);
begin
  if (a<>nil) then begin
    cumple:=false;
    evaluar(a^.datos,cumple);
    if (cumple) and (not estaEnVector(vec,dimL,a^.datos.seleccion)) then insertarVector(a^.datos.seleccion,vec,dimL);
    buscarSelecciones(a^.HI,cumple,vec,dimL);
    buscarSelecciones(a^.HD,cumple,vec,dimL);
  end;
end;

procedure imprimirVector(vec:vecSelecciones; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do writeln(vec[i]);
end;

procedure eliminarLista(var list:listado);
var
  aux:listado;
begin
  while (list<>nil) do begin
    aux:=list;
    list:=list^.sig;
    dispose(aux);
  end;
end;

function verMin(a:arbol; min:longint):longint;
begin
  if (a<>nil) then begin
    min:=a^.datos.dni;
    min:=verMin(a^.HI,min);
  end;
  verMin:=min;
end;

procedure borrarElemento(var a:arbol; dni:longint; var encontre:boolean);
var
  aux:arbol;
  min:integer;
begin
  min:=9999;
  if (a=nil) then encontre:=false
  else begin
    if (a^.datos.dni>dni) then borrarElemento(a^.HI,dni,encontre)
    else if (a^.datos.dni<dni) then borrarElemento(a^.HD,dni,encontre)
    else begin
      encontre:=true;
      if (a^.HI=nil) and (a^.HD=nil) then begin
        eliminarLista(a^.datos.list);
        dispose(a);
        a:=nil;
      end
      else begin
        if (a^.HI=nil) and (a^.HD<>nil) then begin
          aux:=a;
          a:=a^.HD;
          eliminarLista(aux^.datos.list);
          dispose(aux);
        end
        else if (a^.HI<>nil) and (a^.HD=nil) then begin
          aux:=a;
          a:=a^.HI;
          eliminarLista(aux^.datos.list);
          dispose(aux);
        end
        else begin
          a^.datos.dni:=verMin(a^.HD,min);
          borrarElemento(a^.HD,a^.datos.dni,encontre);
        end;
      end;
    end;
  end;
end;

var
   l: listaPartidos;
   a:arbol;
   cumple,encontre:boolean;
   vec:vecSelecciones;
   dimL:integer;

begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);

     writeln(' ');

     a:=nil;
     cargarArbol(a,l);
     writeln('Arbol generado: ');
     recorrerEimprimirArbol(a);

     writeln(' ');

     writeln('Informacion jugadores cuyo DNI esta entre 28000000 y 32000000: ');
     enRango(a,28000000,32000000);

     writeln(' ');

     dimL:=0;
     buscarSelecciones(a,cumple,vec,dimL);
     if (dimL<>0) then begin
       writeln('Selecciones: ');
       imprimirVector(vec,dimL);
     end
     else writeln('No se realizaron goles en ninguno de esos estadios entre esas fechas');

     writeln(' ');

     writeln('Se busca eliminar al jugador con DNI 34807474');
     writeln(' ');
     recorrerEimprimirArbol(a);
     encontre:=false;
     borrarElemento(a,34807474,encontre);
     writeln('Arbol resultante: ');
     recorrerEimprimirArbol(a);

     writeln('Fin del programa');
     readln;
end.
