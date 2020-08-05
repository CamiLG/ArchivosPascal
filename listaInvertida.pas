procedure borradoListaInvertida(var a:arch_emp);
var
 e: empleado;
 aux:empleado;
 nrr:integer;
begin
    reset(a);
    read(a, e);
    aux=e;
    read(a, e);
    while(e.cod<>98 and not(eof(a))) do read(a,e);
    if(e.cod=98) then begin
   	 nrr=filepos(a)-1;
   	 seek(a,filepos(a)-1);
   	 write(a,aux);
   	 seek(a,filepos(0));
   	 e.cod=0-nrr;
   	 write(a,e);  
    end;     graaaciasss
	close(a);
end;

procedure insertarListaInvertida(var a:arch_emp;var e:empleado);
var
aux: empleado;
begin
    reset(a);
    read(a,aux);
    if(aux.cod=0) then begin
   	 seek(a,filepos(filesize(a)));
   	 write(a,e);
    end else begin
   	 seek(a,filepos(aux.cod*-1));
   	 read(a,aux);
   	 seek(a,filepos(a)-1);
   	 write(a,e);
   	 seek(a,0);
   	 write(a,aux);
    end;
    close(a);
end;
