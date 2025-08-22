program ejercicio2;

const
  fin='zzz';
  infDNI=40;
  supDNI=50;

type
  venta=record
    cod,nomAp:string;
    cantMillas,dni,clase:integer;
  end;

  datosLP=record
    cod:string;
    puntos:integer;
  end;

  listaP=^nodoLp;
  nodoLp=record
    datos:datosLP;
    sig:listaP;
  end;

  datosA=record
    dni,totPuntos:integer;
    nomAp:string;
    puntos:listaP;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:datosA;
    HI,HD:arbol;
  end;

procedure cargarArbol(var a:arbol);

  procedure leerInfoVenta(var v:venta);
  begin
    with (v) do begin
      writeln('SE INGRESA INFORMACION DE VENTA DE UN PASAJE: ');
      write('Codigo de vuelo: ');
      readln(cod);
      if (cod<>fin) then begin
        write('Cantidad de millas recorridas: ');
        readln(cantMillas);
        write('DNI del pasajero: ');
        readln(dni);
        write('Nombre y apellido del pasajero: ');
        readln(nomAp);
        write('Clase en la que solicito el boleto: ');
        readln(clase);
        writeln(' ');
      end;
    end;
  end;

  procedure insertarArbol(var a:arbol; v:venta);

    function calcularTotPuntos(millas:integer; clase:integer):integer;
    begin
      if (clase=1) then calcularTotPuntos:=millas*25
      else if (clase=2) then calcularTotPuntos:=millas*100;
    end;

    procedure insertarListaVuelosPuntos(var lP:listaP; cod:string; puntos:integer);
    var
      nue:listaP;
    begin
      new(nue);
      nue^.datos.cod:=cod;
      nue^.datos.puntos:=puntos;
      nue^.sig:=lP;
      lP:=nue;
    end;

  var
    puntos:integer;
  begin
    if (a=nil) then begin
      new(a);
      a^.datos.dni:=v.dni;
      a^.datos.nomAp:=v.nomAp;
      a^.datos.puntos:=nil;
      puntos:=calcularTotPuntos(v.cantMillas,v.clase);
      insertarListaVuelosPuntos(a^.datos.puntos,v.cod,puntos);
      a^.datos.totPuntos:=puntos;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else begin
      if (a^.datos.dni>v.dni) then insertarArbol(a^.HI,v)
      else if (a^.datos.dni<v.dni) then insertarArbol(a^.HD,v)
      else begin
        puntos:=calcularTotPuntos(v.cantMillas,v.clase);
        insertarListaVuelosPuntos(a^.datos.puntos,v.cod,puntos);
        a^.datos.totPuntos:=a^.datos.totPuntos+puntos;
      end;
    end;
  end;

var
  v:venta;
begin
  leerInfoVenta(v);
  if (v.cod<>fin) then begin
    insertarArbol(a,v);
    cargarArbol(a);
  end;
end;

procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datosA);

    procedure imprimirListaCodigos(lP:listaP);
    begin
      if (lP<>nil) then begin
        writeln('Codigo de vuelo: ',lP^.datos.cod,' Puntos: ',lp^.datos.puntos);
        imprimirListaCodigos(lP^.sig);
      end;
    end;

  begin
    writeln('DNI pasajero: ',datos.dni);
    writeln('Nombre y apellido pasajero: ',datos.nomAp);
    writeln('Total de puntos por vuelo: ',datos.totPuntos);
    writeln('Lista de vuelos: ');
    imprimirListaCodigos(a^.datos.puntos);
    writeln(' ');
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    mostrarInfo(a^.datos);
    writeln(' ');
    imprimirArbol(a^.HD);
  end;
end;

procedure maxPuntajeTot(a:arbol; var maxPunt,maxDNI:integer);
begin
  if (a<>nil)then begin
    maxPuntajeTot(a^.HI,maxPunt,maxDNI);
    if (a^.datos.totPuntos>maxPunt)then begin
      maxPunt:=a^.datos.totPuntos;
      maxDNI:=a^.datos.DNI;
    end;
    maxPuntajeTot(a^.HI,maxPunt,maxDNI);
  end;
end;

procedure rangoDNI(a:arbol; var maxPunt:integer);
begin
  if (a<>nil) then begin
    if (a^.datos.dni>=infDNI) then begin
      if (a^.datos.dni<=supDNI) then begin
        if (a^.datos.totPuntos>maxPunt) then maxPunt:=a^.datos.totPuntos;
        rangoDNI(a^.HI,maxPunt);
        rangoDNI(a^.HD,maxPunt);
      end
      else rangoDNI(a^.HI,maxPunt);
    end
    else rangoDNI(a^.HD,maxPunt);
  end;
end;

var
  a:arbol;
  maxPunt,maxDNI:integer;

begin
  a:=nil;
  cargarArbol(a);

  writeln(' ');

  maxPunt:=-1;
  maxPuntajeTot(a,maxPunt,maxDNI);
  writeln('El mayor puntaje total entre los clientes es: ',maxPunt,'. El DNI de dicho cliente es: ',maxDNI);

  writeln(' ');

  maxPunt:=-1;
  rangoDNI(a,maxPunt);
  writeln('El mayor puntaje de los pasajeros cuyo DNI se encuentra entre 40.000.000 y 50.000.000 es: ',maxPunt);

  {writeln('El arbol generado es: ');
  imprimirArbol(a);}
  readln;
end.
