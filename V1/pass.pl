#!/usr/bin/perl -w
use CGI;
$query = new CGI;
$log=0;
print $query->header;
print $query->start_html('Trabajando con password y scrooling');
if ($query->param('the_password')) {

	    $yourPassword = $query->param('the_password');
	    #declaramos variable correo y patron. Ambas dos perfilarán la app.
	    $correo = $query->param('mail');
	    my $patron = '([a-z0-9]+\@[a-z]+\.[a-z]{2,3})';

	    #comparación de correo!!!! '=~' compara variable almacenada en correo y patrón de correo.
            if($correo =~ $patron)
		{
			print $query->p('Usuario:',$correo);
			    if($yourPassword eq 'Mar') {
	        	       $log=1;
		            }
		            else {
			      print $query->h3('Pass no válida.');
		            }

		}
	    	else{
			print $query->h1("Correo no válido.");
		}
		#Primera fase completada, validar correo y pass.

            if($log) {
		@asignaturas=('DAW',
			'DWC',
			'DWC',
			'EIE',
			'DIW',);
	      print $query->start_form;
	      print $query->h3('Selecciona asignaturas a estudiar:');
	      print $query->scrolling_list(-name=>'asignaturas',
				 -values=> \@asignaturas,
				 -size=>6,
				 -multiple=>'true',
				 -default=>'DAW');
	      print $query->br;
	      print $query->br;
	      print $query->submit(-value=>'Enviar');
	      print $query->end_form;
             }
}
if ($query->param('asignaturas')) {
	    $listado = $query->param('asignaturas');
	    print $query->p('Asignaturas seleccionadas:');
	    @asignaturas = $query->param('asignaturas');
	    print "<BLOCKQUOTE>\n";
	    foreach $asig (@asignaturas) {
		print "$asig ";
	    }
	    print "</BLOCKQUOTE>\n";
}

#primer caso: No hay datos de entrada en la url. Pedimos correo y pass.
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
print $query->end_html;
