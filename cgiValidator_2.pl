#!/usr/bin/perl -w
use CGI;
$query = new CGI;
$passOk=0;
print $query->header(-charset=>'utf-8');
print $query->start_html('Valid mail');

if (!$query->param) {
            print $query->start_form;
            print $query->textfield(-name=>'mail',
                -size=>40,
                -maxlength=>40);
            print $query->password_field(-name=>'the_password',
                -size=>35,
                -maxlength=>50);
            print $query->br;
            print $query->submit(-value=>'Submit tu password');
            print $query->end_form;
}

if ($query->param('the_password')) {
	#declaramos variable correo y patron. Ambas dos perfilarán la app, ya teníamos almacenado la de pass.
	    $correo = $query->param('mail');
	    my $patron = '([a-z0-9]+\@[a-z]+\.[a-z]{2,3})';
	    $yourPassword = $query->param('the_password');
  	    $filename = "/tmp/groupPass";
	#comparación de correo!!!! '=~' compara variable almacenada en correo y patrón de correo.
            if($correo =~ $patron)
		{
		#PASO 2: COMPARACIÓN DE PASS- Ya añadida variable donde nombramos el fichero que vayamos a abrir.
		#realizamos la lectura del fichero y lo guardamos en una variable.
		    open F, $filename or die "Imposible abrir: $!";
		    $size= -s $filename;
		    read(F, $buf, $size);
		    close F;
		#ya hemos abierto el fichero y guardado en var.
		#ahora separaremos las líneas del fichero	
		    @lineas=split("\n",$buf);
		    foreach $l (@lineas) 
			{
			@campos=split(":",$l);
			$unhash{$campos[0]}=$campos[0] if($campos[0]);
			$unhash{$campos[1]}=$campos[1] if($campos[1]);
			if ($correo =~ $unhash{$campos[0]} && $yourPassword =~ $unhash{$campos[1]})
				{
				  $passOk = 1;
				}
			}
		}
			    	
	#Primera fase completada, validar correo y pass.

		if($passOk) {
		   print $query->h1('Usuario:',$correo);
		   print $query->p('Contraseña correcta');
		   
		}
		else
		{
		   print $query->h1('Usuario:',$correo);
		   print $query->h3('Error, el usuario o contraseña no son correctos.');
		}	
}




	#primer caso: No hay datos de entrada en la url. Pedimos correo y pass.
print $query->end_html;
