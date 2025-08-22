program ej11;

const
  dimF=3;
  fin=-1;

type
  rangoTiempo=0..59;
  rTiempo=record
    min:-1..30000;
    seg:rangoTiempo;
  end;
  listaMaratones=^nodo;
  nodo=record
    datos:rTiempo;
    sig:listaMaratones;
  end;

  maratonista=record
    nom,ap,genero:string;
    tiempo:listaMaratones;
  end;
  vecMaratonistas=array[1..dimF] of maratonista;

procedure leerInfoMaratonista(var vm:vecMaratonistas; i:integer);
begin
  writeln('INGRESE INFORMACION DE UN MARATONISTA: ');
  write('Nombre: ');
  readln(vm[i].nom);
  write('Apellido: ');
  readln(vm[i].ap);
  write('Genero: ');
  readln(vm[i].genero);
end;

procedure leerTiempoMaraton(var t:rTiempo; vm:vecMaratonistas; i:integer);
begin
  writeln('INGRESE TIEMPO DE MARATON DE MARATONISTA ',vm[i].nom,' ',vm[i].ap,': ');
  write('Minutos: ');
  readln(t.min);
  if (t.min<>fin) then begin
    write('Segundos: ');
    readln(t.seg);
  end;
end;

procedure inicializarMaratonesVector(var vm:vecMaratonistas);
var
  i:integer;
begin
  for i:=1 to dimF do vm[i].tiempo:=nil;
end;

procedure insertarFinalLista(var pri,ult:listaMaratones; t:rTiempo);
var
  nue:listaMaratones;
begin
  new(nue);
  nue^.datos:=t;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarMaratonistas(var vm:vecMaratonistas; var ult:listaMaratones);
var
  i:integer;
  t:rTiempo;
begin
  for i:=1 to dimF do begin
    leerInfoMaratonista(vm,i);
    leerTiempoMaraton(t,vm,i);
    while (t.min<>fin) do begin
      insertarFinalLista(vm[i].tiempo,ult,t);
      leerTiempoMaraton(t,vm,i);
    end;
  end;
end;

procedure mejorTiempoMaratonista(vm:vecMaratonistas; i:integer; var minMinutos,minSeg:integer);
begin
  if (vm[i].tiempo^.datos.min<minMinutos) then begin
    minMinutos:=vm[i].tiempo^.datos.min;
    minSeg:=vm[i].tiempo^.datos.seg;
  end
  else if (vm[i].tiempo^.datos.min=minMinutos) then begin
    if (vm[i].tiempo^.datos.seg<minSeg) then begin
      minMinutos:=vm[i].tiempo^.datos.min;
      minSeg:=vm[i].tiempo^.datos.seg;
    end;
  end;
end;

procedure promedioTiempo(vm:vecMaratonistas; i:integer; var totSeg,cantMaratones:integer);
begin
  totSeg:=totSeg+vm[i].tiempo^.datos.seg+(vm[i].tiempo^.datos.min*60);
  cantMaratones:=cantMaratones+1;
end;

procedure recorrerVector(vm:vecMaratonistas);
var
  i,minMinutos,minSeg,totSeg,cantMaratones:integer;
begin
  for i:=1 to dimF do begin
    minMinutos:=9999;
    minSeg:=9999;
    totSeg:=0;
    cantMaratones:=0;
    while(vm[i].tiempo<>nil) do begin
      mejorTiempoMaratonista(vm,i,minMinutos,minSeg);
      promedioTiempo(vm,i,totSeg,cantMaratones);
      vm[i].tiempo:=vm[i].tiempo^.sig;
    end;
    writeln('La maraton con mejor tiempo del maratonista ',vm[i].nom,' ',vm[i].ap,' es: ',minMinutos,':',minSeg);
    writeln('El tiempo promedio del maratonista ',vm[i].nom,' ',vm[i].ap,' es: ',((totSeg/cantMaratones)/60):2:2);
  end;
end;

procedure imprimirVector(vm:vecMaratonistas);
var
  i:integer;
begin
  for i:=1 to dimF do begin
    writeln('INFORMACION MARATONISTA ',i,': ');
    writeln(vm[i].nom);
    writeln(vm[i].ap);
    writeln(vm[i].genero);
    while (vm[i].tiempo<>nil) do begin
      writeln('MARATON MARATONISTA ',i,': ');
      writeln(vm[i].tiempo^.datos.min);
      writeln(vm[i].tiempo^.datos.seg);
      vm[i].tiempo:=vm[i].tiempo^.sig;
    end;
  end;
end;

var
  vm:vecMaratonistas;
  ult:listaMaratones;

begin
  inicializarMaratonesVector(vm);
  cargarMaratonistas(vm,ult);
  imprimirVector(vm);
  recorrerVector(vm);
  readln;
end.
