program ej8inc;

const
  fin = 'z';
  max_carac = 500;

var
  carac:char;
  ant:char;
  cant_carac:integer;
  cant_p:integer;
  cant_pala_r:integer;

begin
  cant_carac:=0;
  cant_p:=0;
  cant_pala_r:=0;
  writeln('Ingrese un caracter: ');
  readln(carac);
  while (carac = ' ') and (carac <> fin) and (cant_carac < max_carac) do
  begin
    writeln('Ingrese otro caracter que no sea un espacio: ');
    readln(carac);
    cant_carac:=cant_carac+1;
  end;
  while (cant_carac < max_carac) and (carac <> fin) do
  begin
    cant_carac:=cant_carac+1;
    if (ant = ' ') and (carac <> ' ') then
    cant_p:=cant_p+1;
    if (ant = 'R') and (carac <> ' ') then
    begin
      cant_pala_r:=cant_pala_r+1;
    end;
    ant:=carac;
    writeln('Ingrese un caracter: ');
    readln(carac);
  end;
  cant_p:=cant_p+1;
  writeln('La cantidad de palabras que componenen la secuencia son: ',cant_p);
  writeln('La cantidad de palabras que empiezan con R son: ',cant_pala_r);
  readln;
end.
