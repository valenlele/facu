program ej2inc;

const
  maxCat=4;
  fin='zzz';
  maxDirec=70;

type
  rangoCat=1..maxCat;
  rangoDirec=1..maxDirec;
  vecDirec=array[rangoDirec] of char;
  rDirec=record
    carac:vecDirec;
    dimL:rangoDirec;
  end;
  persona=record
    nomYap:string;
    cat:rangoCat;
    mont:real;
    direc:rDirec;
  end;

  lista=^nodo;
  nodo=record
    datos:persona;
    sig:lista;
  end;

  vecImpExtra=array[rangoCat] of real;

  vecMontoTotal=array[rangoCat] of real;

  conjCar=set of char;

procedure leerInfo(var p:persona);
begin
  p.direc.dimL:=1;
  writeln('INFORMACION PERSONA: ');
  write('Nombre y apellido: ');
  readln(p.nomYap);
  if (p.nomYap<>fin) then begin
   write('Categoria del servicio: ');
   readln(p.cat);
   write('Monto basico: ');
   readln(p.mont);
   write('Direccion: ');
   readln(p.direc.carac[p.direc.dimL]);
   while (p.direc.dimL<=70) do begin
     p.direc.dimL:=p.direc.dimL+1;
     readln(p.direc.carac[p.direc.dimL]);
   end;
   writeln(' ');
  end;
end;

procedure insertarFinal(var pri,ult:lista; p:persona);
var
  nue:lista;
begin
  new(nue);
  nue^.datos:=p;
  nue^.sig:=nil;
  if (pri=nil) then pri:=nue
  else ult^.sig:=nue;
  ult:=nue;
end;

procedure cargarLista(var pri,ult:lista); //se dispone enunciado
var
  p:persona;
begin
  leerInfo(p);
  while (p.nomYap<>fin) do begin
    insertarFinal(pri,ult,p);
    leerInfo(p);
  end;
end;

procedure cargarTablaImporteExtra(var impExtra:vecImpExtra); //se dispone enunciado
var
  i:rangoCat;
begin
  for i:=1 to maxCat do begin
    write('Ingrese el importe extra para la categoria ',i,': ');
    readln(impExtra[i]);
  end;
end;

procedure inicializarVectorMontoTotal(var montTot:vecMontoTotal);
var
  i:rangoCat;
begin
  for i:=1 to maxCat do montTot[i]:=0;
end;

procedure calcularMontoTotalXcat(var montTot:vecMontoTotal; cat:rangoCat; montBasico:real; impExtra:vecImpExtra);
begin
  montTot[cat]:=montTot[cat]+montBasico+impExtra[cat];
end;

procedure informarMontoXcategoria(montTot:vecMontoTotal);
var
  i:rangoCat;
begin
  for i:=1 to maxCat do writeln('El monto total recaudado para la categoria ',i,' es: ',montTot[i]:2:2);
end;

procedure calcularMaxPagoCat2(montBasico,impExtra:real; nombre:string; var maxMonto:real; var maxNom:string);
var
  montPersona:real;
begin
  montPersona:=0;
  montPersona:=montBasico+impExtra;
  if (montPersona>maxMonto) then begin
    maxMonto:=montPersona;
    maxNom:=nombre;
  end;
end;

function cumpleDireccion(pri:lista):boolean;
var
  conj:conjCar;
  i:rangoDirec;
begin
  cumpleDireccion:=true;
  conj:=['A'..'G'] + ['0','2','4','6','8'];
  i:=1;
  while (i<=pri^.datos.direc.dimL) and (cumpleDireccion) and (pri^.datos.direc.carac[i]<>'%') do begin
    if (pri^.datos.direc.carac[i]) not in conj then cumpleDireccion:=false;
    i:=i+1;
  end;

end;

procedure recorrerLista(pri:lista; var impExtra:vecImpExtra; var montTot:vecMontoTotal);
var
  maxMonto:real;
  maxNom:string;
begin
  maxMonto:=-1;
  inicializarVectorMontoTotal(montTot);
  while (pri<>nil) do begin
    calcularMontoTotalXcat(montTot,pri^.datos.cat,pri^.datos.mont,impExtra);
    if (pri^.datos.cat=2) then calcularMaxPagoCat2(pri^.datos.mont,impExtra[2],pri^.datos.nomYap,maxMonto,maxNom);
    if (cumpleDireccion(pri)) then writeln('La direccion cumple con el patron')
    else writeln('La direccion no cumple con el patron');
    pri:=pri^.sig;
  end;
  informarMontoXcategoria(montTot);
  if (montTot[2]<>0) then writeln('El nombre de la persona que mas pago por el servicio de cable de categoria 2 es: ',maxNom)
  else writeln('Nadie pago servicio de cable categoria 2');
end;

var
  pri,ult:lista;
  impExtra:vecImpExtra;
  montTot:vecMontoTotal;

begin
  pri:=nil;
  cargarLista(pri,ult);  //se dispone enunciado
  cargarTablaImporteExtra(impExtra); //se dispone enunciuado
  recorrerLista(pri,impExtra,montTot);
  readln;
end.
