program ej7;

const
  maxRep=2;
  maxPaises=1;

type
  cadena=string[20];
  platos=record
    nombre:cadena;
    tipo:cadena;
    ing:cadena;
  end;
  representantes=record
    nombre:cadena;
    apellido:cadena;
    pais:cadena;
    plato:platos;
    sexo:cadena;
    edad:integer;
  end;

procedure leerInfo(var r:representantes; representante,paises:integer);
begin
  with r do begin
    writeln('Ingrese el nombre y apellido del participante ',representante,' del pais ',paises,': ');
    readln(nombre);
    readln(apellido);
    write('Ingrese el pais que representa: ');
    readln(pais);
    writeln('Ingrese el plato a presentar, el tipo y su ingrediente principal: ');
    readln(plato.nombre);
    readln(plato.tipo);
    readln(plato.ing);
    write('Ingrese el sexo del participante: ');
    readln(sexo);
    write('Ingrese la edad del participante: ');
    readln(edad);
  end;
end;

procedure platosFriosFem(cantPlatosFriosFem,pais:integer; var maxPais,maxPlatos:integer);
begin
  if (cantPlatosFriosFem>maxPlatos) then begin
    maxPlatos:=cantPlatosFriosFem;
    maxPais:=pais;
  end;
end;

procedure edadProm(r:representantes; var totEdad:integer);
begin
  totEdad:=totEdad+r.edad;
end;

procedure polloCaliente(r:representantes);
begin
  if (r.plato.tipo='caliente') and (r.plato.ing='pollo') then writeln('El nombre, apellido y pais del participante que presenta un plato caliente con pollo como ingrediente principal es: ',r.nombre,' ',r.apellido,' de ',r.pais);
end;

var
  r:representantes;
  representante,paises,cantPlatosFriosFem,maxPais,maxPlatos,totEdad:integer;
  promEdad:real;

begin
  totEdad:=0;
  maxPais:=-1;
  for paises:=1 to maxPaises do begin
    maxPlatos:=-1;
    cantPlatosFriosFem:=0;
    for representante:=1 to maxRep do begin
      leerInfo(r,representante,paises);
      if (r.sexo='femenino') and (r.plato.tipo='frio') then cantPlatosFriosFem:=cantPlatosFriosFem+1;
      edadProm(r,totEdad);
      polloCaliente(r);
    end;
    platosFriosFem(cantPlatosFriosFem,paises,maxPais,maxPlatos);
  end;
  writeln('El pais con la mayor cantidad de participantes femeninos que presentan platos frios es: ',maxPais);
  promEdad:=totEdad/(maxRep*maxPaises);
  write('La edad promedio de los participantes es: ',promEdad:2:2);
  readln;
end.


