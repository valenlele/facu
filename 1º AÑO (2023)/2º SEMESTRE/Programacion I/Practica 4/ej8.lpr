program ej8;

type
  rangoPuntaje=0..100;
  cadena=string[20];
  examen=record
    nombre:cadena;
    continente:cadena;
    puntaje:rangoPuntaje;
  end;

procedure leerInfo(var e:examen);
begin
  with e do begin
    write('Ingrese el nombre del participante: ');
    readln(nombre);
    if (nombre<>'zzz') then begin
      write('Ingrese su continente de origen: ');
      readln(continente);
      write('Ingrese su puntaje: ');
      readln(puntaje);
    end;
  end;
end;

procedure mayorCalif(e:examen; var maxPuntj:integer; var maxParti:cadena);
begin
  if (e.puntaje>maxPuntj) then begin
    maxPuntj:=e.puntaje;
    maxParti:=e.nombre;
  end;
end;

procedure aprobPromContinente(e:examen; var cantAp,cantProm:integer);
begin
  if (e.puntaje>=90) then cantProm:=cantProm+1
  else if (e.puntaje>=70) then cantAp:=cantAp+1;
end;

procedure puntjPromEuro(e:examen; var puntjTot,cantEuro:integer);
begin
  if (e.continente='europa') then begin
    puntjTot:=puntjTot+e.puntaje;
    cantEuro:=cantEuro+1;
  end;
end;

var
  e:examen;
  maxPuntj:integer;
  maxParti:cadena;
  cantAp,cantProm:integer;
  puntjTot,cantEuro:integer;
  promEuro:real;
  contActual:cadena;

begin
  maxPuntj:=0;
  promEuro:=0;
  puntjTot:=0;
  cantEuro:=0;
  maxParti:=' ';
  leerInfo(e);
  contActual:=e.continente;
  while (e.nombre<>'zzz') do begin
    cantAp:=0;
    cantProm:=0;
    while (e.continente=contActual) and (e.nombre<>'zzz') do begin
      mayorCalif(e,maxPuntj,maxParti);
      aprobPromContinente(e,cantAp,cantProm);
      puntjPromEuro(e,puntjTot,cantEuro);
      leerInfo(e);
    end;
    writeln('La cantidad de participantes del continente ',contActual,' que aprobaron fueron: ',cantAp);
    writeln('La cantidad de participantes del continente ',contActual,' que promocionaron fueron: ',cantProm);
    if (e.nombre<>'zzz') then contActual:=e.continente;
  end;
  writeln('El participante que obtuvo la mayor calificacion fue: ',maxParti);
  if (cantEuro<>0) then promEuro:=puntjTot/cantEuro;
  write('El puntaje promedio de los europeos fue: ',promEuro:2:2);
  readln;
end.
