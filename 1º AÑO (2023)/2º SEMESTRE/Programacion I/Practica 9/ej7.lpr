program ej7;

const
  dimF=9;
  fin=-1;

type
  jubilado=record
    dni:integer;
    ap:string;
    nom:string;
    mont:integer;
  end;

  lista=^nodo;
  nodo=record
    datos:jubilado;
    sig:lista;
  end;

  vectorDias=array[0..dimF] of lista;

procedure leerInfoJubilado(var j:jubilado);
begin
  writeln('INFORMACION DE UN JUBILADO: ');
  write('DNI: ');
  readln(j.dni);
  if (j.dni<>fin) then begin
    write('Apellido: ');
    readln(j.ap);
    write('Nombre: ');
    readln(j.nom);
    write('Monto a pagar: ');
    readln(j.mont);
  end;
end;

procedure insertar(var pri:lista; j:jubilado);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=j;
  nue^.sig:=pri;
  pri:=nue;
end;

procedure cargarLista(var pri:lista; var j:jubilado);
begin
  pri:=nil;
  leerInfoJubilado(j);
  while (j.dni<>fin) do begin
    insertar(pri,j);
    leerInfoJubilado(j);
  end;
end;

function ultDigDni(dni:integer):integer;
begin
  ultDigDni:=dni mod 10;
end;

procedure inicializarVector(var vd:vectorDias);
var
  i:integer;
begin
  for i:=1 to dimF do vd[i]:=nil;
end;

procedure insertarEnVector(var vd:vectorDias; pri:lista);
var
  dig:integer;
begin
  inicializarVector(vd);
  while (pri<>nil) do begin
    dig:=ultDigDni(pri^.datos.dni);
    insertar(vd[dig],pri^.datos);
    pri:=pri^.sig;
  end;
end;

procedure imprimirLista(pri:lista);
begin
  writeln('LISTA: ');
  while (pri<>nil) do begin
    writeln(pri^.datos.dni);
    writeln(pri^.datos.ap);
    writeln(pri^.datos.nom);
    writeln(pri^.datos.mont);
    writeln(' ');
    pri:=pri^.sig;
  end;
end;

procedure imprimirVector(vd:vectorDias; pri:lista);
var
  i:integer;
begin
  writeln('VECTOR: ');
  for i:=0 to dimF do begin
    while(vd[i]<>nil) do begin
      writeln(vd[i]^.datos.dni);
      writeln(vd[i]^.datos.ap);
      writeln(vd[i]^.datos.nom);
      writeln(vd[i]^.datos.mont);
      writeln(' ');
      vd[i]:=vd[i]^.sig;
    end;
  end;
end;

var
  pri:lista;
  j:jubilado;
  vd:vectorDias;

begin
  cargarLista(pri,j);
  insertarEnVector(vd,pri);
  imprimirLista(pri);
  insertarEnVector(vd,pri);
  imprimirVector(vd,pri);
  readln;
end.
