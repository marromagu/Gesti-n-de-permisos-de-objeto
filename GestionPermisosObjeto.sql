/*1.	Conéctate como system y otorga privilegios al empleado1 para seleccionar, insertar, borrar y
 modificar datos de la tabla jugadores del usuario nbaXX de forma que pueda conceder este permiso a otros usuarios.*/

GRANT SELECT, INSERT, UPDATE, DELETE ON nba18.jugadores18 TO empleado1 WITH GRANT OPTION;

/*2.	Consulta los privilegios sobre objetos asignados al empleado1 (dba_tab_privs).*/

SELECT *
FROM dba_tab_privs
WHERE grantee = 'EMPLEADO1';

/*3.	Conéctate como empleado1 y concede los privilegios seleccionar, insertar, borrar y
 modificar datos de la tabla jugadores del usuario nbaXX al empleado2 ¿Es posible? ¿Por qué?*/

GRANT SELECT, INSERT, UPDATE, DELETE ON nba18.jugadores18 TO empleado2;

/*4.	Como empleado1 consulta los privilegios que ha concedido y a quien. Explica qué es cada columna (all_tab_privs_made).*/

SELECT *
FROM all_tab_privs_made
WHERE grantee = 'EMPLEADO1'; --se supone q es asi pero no me selecciona ninguna fila


/*5.	Como empleado1 consulta los privilegios que tiene concedidos (recibidos) y quién se los ha concedido. Explica qué es cada columna (all_tab_privs_recd).*/

SELECT *
FROM all_tab_privs_recd
WHERE grantee = 'EMPLEADO1'--solo sale mis privilegios 

/*6.	Conéctate como system y consulta los privilegios de sistema del empleado2.*/

SELECT *
FROM dba_sys_privs
WHERE grantee = 'EMPLEADO2';--nada

/*7.	Observa quien se los ha concedido (grantor).*/

SELECT grantor
FROM dba_sys_privs
WHERE grantee = 'EMPLEADO2';--identificador no valido

/*8.	Consulta los privilegios de sistema que ha concedido el empleado1.*/

SELECT *
FROM dba_sys_privs
WHERE grantee = 'EMPLEADO1';

/*9.	Como empleado2 consulta los privilegios que ha concedido y a quien.*/
SELECT *
FROM dba_tab_privs
WHERE grantee = 'EMPLEADO1';
/*10.	Como empleado2 consulta los privilegios que tiene concedidos (recibidos) y quien se los ha concedido.*/

SELECT *
FROM all_tab_privs_recd
WHERE grantee = 'EMPLEADO2';

/*11.	Desde system revoca al empleado1 los privilegios para seleccionar, insertar, borrar y modificar datos de la tabla coches del usuario taller.
 ¿Se le ha revocado el permiso de también al empleado2? ¿Por qué?*/
REVOKE SELECT, INSERT, UPDATE, DELETE ON nba18.jugadores18 FROM empleado1;

/*12.	Borra los usuarios empleado1, empleado 2 y empleado3 obligando a que se borren todos los objetos de sus esquemas.
 Recuerda que previamente debes cerrar las sesiones que estos usuarios tuvieran abiertas.*/
 
 DROP USER empleado1 CASCADE;
DROP USER empleado2 CASCADE;
DROP USER empleado3 CASCADE;
