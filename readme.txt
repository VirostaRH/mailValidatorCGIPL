V1

Hemos modificado el código para que confirme también un mail válido. Si dicho mail es correcto, y la pass de acceso es correcta, mostrará el listado de asignaturas que pueden seleccionarse. 
En caso negativo, remite a que no se puede realizar la operación.

He tratado de investigar cómo almacenar esta  información en un fichero, pero no consigo almacenar el correo de un if al otro, aún cuando he empleado una variable global incluso -a la altura de $log- por ello, dejo tal como he indicado el código -validando mail, pass y modificando la lista y los elementos que muestra-. A la espera de reunirme contigo el lunes y poder averiguar cómo mantener el correo como algo global.

-----------------------------------------------------------------------------

V2

Actualizado funcionamiento de CGI:

Actualizado funcionamiento de las comprobaciones.
Ahora, el CGI comprueba que el correo esté validado, una vez hecho esto, comprueba la password.
Si el mail introducido no es validado, no continúa comprobando pass.
Si el mail introducido es válido, comprueba password en listado creado en fichero temporal.

Requerimiento: Tener creado en /tmp un fichero con estructura "correo:pass" llamado groupPass.
