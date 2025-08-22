Program ejercicio1;

Uses
     sysutils;

const
  infDNI=30000000;
  supDNI=40000000;

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

     datosP=record
       fecha:str10;
       puntaje:integer;
     end;

     listaP=^nodoP;
     nodoP=record
       datos:datosP;
       sig:listaP;
     end;

     datosA=record
       dni:longint;
       nomAp:string;
       pos:str10;
       part:listaP;
       puntajeTot:integer;
     end;

     arbol=^nodoA;
     nodoA=record
       datos:datosA;
       HI,HD:arbol;
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

procedure agregarListaPart(var lP:listaP; fecha:str10; pun:integer);
var
  nue:listaP;
begin
  new(nue);
  nue^.datos.fecha:=fecha;
  nue^.datos.puntaje:=pun;
  nue^.sig:=lp;
  lp:=nue;
end;

procedure insertarDatos(var a:arbol; f:str10; j:jugador);
begin
  a^.datos.dni:=j.dni;
  a^.datos.nomAp:=j.nombreApellido;
  a^.datos.pos:=j.posicion;
  a^.datos.puntajeTot:=j.puntaje;
  a^.datos.part:=nil;
  agregarListaPart(a^.datos.part,f,j.puntaje);
end;

procedure insertarArbol(var a:arbol; fecha:str10; jugadores:jugador);
begin
  if (a=nil) then begin
    new(a);
    insertarDatos(a,fecha,jugadores);
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else begin
    if (jugadores.dni>a^.datos.dni) then insertarArbol(a^.HD,fecha,jugadores)
    else if (jugadores.dni<a^.datos.dni) then insertarArbol(a^.HI,fecha,jugadores)
    else begin
      agregarListaPart(a^.datos.part,fecha,jugadores.puntaje);
      a^.datos.puntajeTot:=a^.datos.puntajeTot+jugadores.puntaje;
    end;
  end;
end;

procedure cargarArbol(var a:arbol; l:listaPartidos);
begin
  while (l<>nil) do begin
    while (l^.dato.jugadores<>nil) do begin
      insertarArbol(a,l^.dato.fecha,l^.dato.jugadores^.dato);
      l^.dato.jugadores:=l^.dato.jugadores^.sig;
    end;
    l:=l^.sig;
  end;
end;

procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datosA);

    procedure imprimirListaPartidos(lP:listaP);
    begin
      if (lP<>nil) then begin
        write('Fecha: ',lP^.datos.fecha,' Puntaje: ',lP^.datos.puntaje);
        imprimirListaPartidos(lP^.sig);
      end;
    end;

  begin
    writeln('DNI: ',datos.dni);
    writeln('Nombre y apellido: ',datos.nomAp);
    writeln('Posicion: ',datos.pos);
    writeln('Puntaje total: ',datos.puntajeTot);
    write('Partido(s): ');
    imprimirListaPartidos(a^.datos.part);
    writeln(' ');
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HD);
    mostrarInfo(a^.datos);
    writeln(' ');
    imprimirArbol(a^.HI);
  end;
end;

procedure pCantDNI(a:arbol; var cantDNI:integer);
begin
  if (a<>nil) then begin
    if (a^.datos.dni>=infDNI) then begin
      if (a^.datos.dni<=supDNI) then begin
        cantDNI:=cantDNI+1;
        pCantDNI(a^.HI,cantDNI);
        pCantDNI(a^.HD,cantDNI);
      end
      else pCantDNI(a^.HI,cantDNI);
    end
    else pCantDNI(a^.HD,cantDNI);
  end;
end;

procedure pCantPos(a:arbol; pos:str10; var cantPos:integer);
begin
  if (a<>nil) then begin
    pCantPos(a^.HI,pos,cantPos);
    if (a^.datos.pos=pos) then cantPos:=cantPos+1;
    pCantPos(a^.HD,pos,cantPos);
  end;
end;

var
   l:listaPartidos;
   a:arbol;
   cantDNI,cantPos:integer;
   pos:str10;

begin
     Randomize;
     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

     writeln(' ');

     a:=nil;
     cargarArbol(a,l);
     writeln('ARBOL GENERADO: ');
     imprimirArbol(a);

     writeln(' ');

     cantDNI:=0;
     pCantDNI(a,cantDNI);
     writeln('La cantidad de jugadores cuyo DNI esta entre 30.000.000 y 40.000.000 es: ',cantDNI);

     writeln(' ');

     write('Ingrese una posicion: ');
     readln(pos);
     cantPos:=0;
     pCantPos(a,pos,cantPos);
     writeln('La cantidad de jugadores que hay en el sistema que juegan de ',pos,' es: ',cantPos);

     writeln('Fin del programa');
     readln;
end.

