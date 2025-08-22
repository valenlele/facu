program ej7;
const fin='.';
var car:char;
    cantP,longt,max:integer;
    arrancaConT:boolean;
begin
  cantP:=0;
  max:=-1;
  write('Ingrese un caracter: ');
  readln(car);
  while (car=' ') do begin                     //descarto empezar con espacios en blanco
    write('Ingrese un caracter: ');
    readln(car);
  end;
  while (car<>fin) do begin                    //leo caracteres hasta leer un punto
    cantP:=cantP+1;                            //cuento ya que si entre al while es porque ya puse un caracter, es decir, al menos una palabra
    longt:=0;
    arrancaConT:=(car='t') or (car='T');
    if (arrancaConT) then begin
      longt:=longt+1;
      write('Ingrese un caracter: ');
      readln(car);
      while (car<>' ') and (car<>'.') do begin   //sigo leyendo caracteres hasta que se forme otra palabra(se ingrese otro espacio)
       longt:=longt+1;
       write('Ingrese un caracter: ');
       readln(car);
     end;
    end;
    if longt>max then max:=longt;
    while (car<>' ') and (car<>'.') do begin
     write('Ingrese un caracter: ');
     readln(car);
    end;
    while (car=' ') do begin                      //descarto posibles blancos que aparezcan al final
      write('Ingrese un caracter: ');
      readln(car);
    end;
  end;
  writeln('La cantidad de palabras es: ',cantP);
  writeln('La longitud de la palabra mas larga que comienza con t es: ',max);
  readln;
end.
