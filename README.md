# mailValidatorCGIPL






Author: Héctor Ruiz
Description: A fast code for cgi aplication.
--------------------------------
Intro: Hi, i'm student from Seville, Spain, and i'll try to share my first project: A CGI-Perl app that validates an email string. If you find any problems with the use or possible updates for code, please, contact me: ruizvirostah@gmail.com

Intro: Hola, soy un estudiante de Sevilla, España, e intentaré compartir mi primer proyecto: Una aplicación CGI-Perl que valide un correo electrónico. Si encuentras algún problema con el uso o posibles actualizaciones para el código, por favor, contáctame: ruizvirostah@gmail.com

Requirements: File in /tmp/ named groupPass.

Requerimientos: Un archivo en /tmp/ llamado groupPass.

V2:
--------------------------------
Code edited for obtain from password list and check mail (user) and pass.
Editado el código para obtener desde un fichero el listado de passwords y validar desde él la coincidencia mail/pass.

Requirements: File in /tmp/ named groupPass with user:pass format.

Requerimientos: Un archivo en /tmp/ llamado groupPass con formato usuario:pass.

V3:
------------------------------------
Editing code for obtain from Redis data.
Editado el código para obtener desde Redis los valores de usuario y pass.

Requirements: 
- Install CGI module (cpan -i Redis)
- Create in Redis Key and Value (with user and pass to probe).

Requerimientos: 
- Instalar modulo CGI (cpan -i Redis)
- Crea en Redis clave y valor (con el usuario y la password a probar).

