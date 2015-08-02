PetClinic
=========

Aplicación web enfocada en la gestión de una clínica de mascotas.


Tecnologías
-----------

* Java
* Maven
* Spring Framework
* Hibernate
* Apache POI
* HTML5 + JS 
* Bootstrap

Recursos
--------

En el directorio **resources** se encuentra la definición del proyecto, el modelo de base de datos para Workbench y un backup para pruebas.


Instalación
-----------

Restaurar backup de base de datos ejemplo.
```mysql
cd petclinic
mysql -u root -pcontraseña petclinic < src/main/resources/petclinic.sql
```


Uso
---

* Ejecutar la aplicación usando el IDE deseado o ejecutar vía comandos usando Maven.
* Acceder a la aplicación con las credenciales:

```bash
Usuario: admin@gmail.com
Password: redhot

```



Observaciones
-------------

* Queda pendiente la implementación de MD5 para las contraseñas.
* Roadmap: Implementar SpringBoot. 
