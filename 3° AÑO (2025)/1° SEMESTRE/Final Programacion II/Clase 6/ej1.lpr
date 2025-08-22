Program ej1;
Uses
     sysutils;
Type
     str10= string[10];
     jugador = record
              dni: longint;
	      nombreApellido: string;
	      posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;

  datosJugadores=record
    dni:longint;
    nomAp,pos:str10;
    puntTot:integer;
  end;

  datosPartidos=record
    fecha:str10;
    punt:integer;
  end;

  lPartidos=^nodoPart;
  nodoPart=record
    datos:datosPartidos;
    sig:lPartidos;
  end;

  datosA=record
    dJugadores:datosJugadores;
    lPart:lPartidos;
  end;

  arbolJugadores=^nodoArbol;
  nodoArbol=record
    datos:datosA;
    HI:arbolJugadores;
    HD:arbolJugadores;
  end;

procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
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

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(36000000)+20000000;
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;

procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
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
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure agregarFinalListaPartidos(var lPart:lPartidos; p:partido);
var
  nue,act:lPartidos;
begin
  new(nue);
  nue^.datos.fecha:=p.fecha;
  nue^.datos.punt:=p.jugadores^.dato.puntaje;
  nue^.sig:=nil;
  if (lPart<>nil) then begin
    act:=lPart;
    while (act^.sig<>nil) do act:=act^.sig;
    act^.sig:=nue;
  end
  else lPart:=nue;
end;

procedure insertarDatos(var a:arbolJugadores; p:partido);
begin
  a^.datos.dJugadores.dni:=p.jugadores^.dato.dni;
  a^.datos.dJugadores.nomAp:=p.jugadores^.dato.nombreApellido;
  a^.datos.dJugadores.pos:=p.jugadores^.dato.posicion;
  a^.datos.dJugadores.puntTot:=p.jugadores^.dato.puntaje;
  a^.datos.lPart:=nil;
  agregarFinalListaPartidos(a^.datos.lPart,p)
end;

procedure insertarArbol(var a:arbolJugadores; p:partido);
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,p);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else if (a^.datos.dJugadores.dni>p.jugadores^.dato.dni) then insertarArbol(a^.HI,p)
  else if (a^.datos.dJugadores.dni<p.jugadores^.dato.dni) then insertarArbol(a^.HD,p)
  else begin
    agregarFinalListaPartidos(a^.datos.lPart,p);
    a^.datos.dJugadores.puntTot:=a^.datos.dJugadores.puntTot+p.jugadores^.dato.puntaje;
  end;
end;

procedure crearArbolJugadores(var a:arbolJugadores; l:listaPartidos);
begin
  a:=nil;
  while (l<>nil) do begin
    while (l^.dato.jugadores<>nil) do begin
      insertarArbol(a,l^.dato);
      l^.dato.jugadores:=l^.dato.jugadores^.sig;
    end;
    l:=l^.sig;
  end;
end;

procedure imprimirListaPartidos(lPart:lPartidos);
begin
  while (lPart<>nil) do begin
    writeln('Fecha: ',lPart^.datos.fecha,'. Puntaje: ',lPart^.datos.punt);
    lPart:=lPart^.sig;
  end;
end;

procedure imprimirEnOrden(a:arbolJugadores);
begin
  if (a<>nil) then begin
    imprimirEnOrden(a^.HD);
    writeln('DNI: ',a^.datos.dJugadores.dni,'. Nombre y apellido: ',a^.datos.dJugadores.nomAp,'. Posicion: ',a^.datos.dJugadores.pos,'. Punataje total: ',a^.datos.dJugadores.puntTot,'. Lista de partidos: ');
    imprimirListaPartidos(a^.datos.lPart);
    imprimirEnOrden(a^.HI);
  end;
end;

procedure enRango(a:arbolJugadores; inf,sup:integer; var cantRango:integer);
begin
  if (a<>nil) then
    if (a^.datos.dJugadores.dni>=inf) then
      if (a^.datos.dJugadores.dni<=sup) then begin
        cantRango:=cantRango+1;
        enRango(a^.HI,inf,sup,cantRango);
        enRango(a^.HD,inf,sup,cantRango);
      end
      else
        enRango(a^.HI,inf,sup,cantRango)
    else
      enRango(a^.HD,inf,sup,cantRango);
end;

procedure cantPosicion(a:arbolJugadores; pos:str10; var cantPos:integer);
begin
  if (a<>nil) then begin
    cantPosicion(a^.HD,pos,cantPos);
    if (a^.datos.dJugadores.pos=pos) then cantPos:=cantPos+1;
    cantPosicion(a^.HI,pos,cantPos);
  end;
end;

var
   l:listaPartidos;
   a:arbolJugadores;
   cantRango,cantPos:integer;
   pos:str10;

begin
     Randomize;

     l:=nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

     writeln(' ');

     crearArbolJugadores(a,l);
     writeln('Arbol generado: ');
     imprimirEnOrden(a);

     writeln(' ');

     cantRango:=0;
     enRango(a,30000000,40000000,cantRango);
     writeln('La cantidad de jugadores cuyo DNI se encuentra entre 30.000.000 y 40.000.000 es: ',cantRango);

     writeln(' ');

     cantPos:=0;
     write('Ingrese una posicion: ');
     readln(pos);
     cantPosicion(a,pos,cantPos);
     writeln('La cantidad de jugadores que juegan de ',pos,' es: ',cantPos);

     writeln('Fin del programa');
     readln;
end.
