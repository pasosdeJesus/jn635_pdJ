# Mercado campesino en mi casa #

Aplicación de comercio justo especialmente para productos campesinos

[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/jn635_pdJ.svg?branch=master)](https://travis-ci.org/pasosdeJesus/jn635_pdJ) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/jn635_pdJ/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/jn635_pdJ) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/jn635_pdJ/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/jn635_pdJ) [![security](https://hakiri.io/github/pasosdeJesus/jn635_pdJ/master.svg)](https://hakiri.io/github/pasosdeJesus/jn635_pdJ/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/jn635_pdJ.svg)](https://gemnasium.com/pasosdeJesus/jn635_pdJ) 

![Logo de jn635_pdJ](https://raw.githubusercontent.com/pasosdeJesus/jn635_pdJ/master/app/assets/images/logo.jpg)

## Funcionalmente que opera

De los casos de uso, ya opera el registro de usuarios.
Ver [CASOS_DE_USO.md](https://github.com/pasosdeJesus/jn635_pdJ/blob/master/CASOS_DE_USO.md)

## Documentación para desarrolladores

### Requisitos 📋

Ver <https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md>

### Probar operación en modo de desarrollo 🔧

* Cree un usuario para PostgreSQL como se explica en 
  <https://github.com/pasosdeJesus/sip/blob/master/doc/aplicacion-de-prueba.md>
  (si deja el nombre sipdes se le facilitarán los siguientes pasos)
* Ubique las fuentes en un directorio, por ejemplo en `/var/www/htdocs/jn635_pdJ/`
* Asegúrese que las gemas estén instaladas. En el caso de adJ en 
  `/var/www/bundler/ruby/2.7/` siguiendo las instrucciones de 
  <http://pasosdejesus.github.io/usuario_adJ/conf-programas.html#ruby>
  y en el directorio con fuentes asegúrese de tener el archivo 
  `.bundle/config` con contenido:
  ```
  ---
  BUNDLE_PATH: "/var/www/bundler"
  BUNDLE_DISABLE_SHARED_GEMS: "true"
  ```
* El archivo `Gemfile` contiene el listado de todas las dependencias a 
  instalar en los distinto ambientes de ejecución. Instale las gemas que 
  se especifican en tal archivo con:
  ```sh
  bundle install
  ```
  (Si quisiera actualizar las dependencias de la aplicación podría 
  ejecutar `bundle update; bundle install`)
  
  Si se interrumpe el proceso por problemas de permisos en instalación 
  de una gema, instálela como en el siguiente ejemplo (cambiando la 
  gema y la versión):
  ```sh
  doas gem install --install-dir /var/www/bundler/ruby/2.7/ bindex -v 0.7.0
  ```
* Copie y de requerirlo modifique las plantillas:
  ```sh
  for i in `find . -name "*plantilla"`; do n=`echo $i | sed -e "s/.plantilla//g"`; if (test ! -e "$n") then {echo $n; cp $i $n; } fi; done 
  ```
  Estas plantillas dejan la aplicación en el URL `/mercadocampesino/`
  (tendría que modificarlas si prefiere una raíz de URL diferente, ver
  <https://github.com/pasosdeJesus/sip/blob/master/doc/punto-de-montaje.md> )

  Lo mínimo que debe modificar es establecer usuario PostgreSQL, clave 
  y bases de datos (desarrollo, pruebas y producción) que configuró en 
  PostgreSQL en `config/database.yml` (también es recomendable que 
  agregue el usuario y la clave en el archivo `~/.pgpass`).

  * Cree una base nueva `jn635pdJ_desarrollo` como usuario de 
  PostgreSQL `sipdes`:
  ```sh
  createdb -U sipdes -h /var/www/var/run/postgresql/ jn635pdJ_desarrollo
  ```
  y desde el directorio de la aplicación:  
  ```sh
  bin/rails db:setup
  bin/rails db:migrate
  bin/rails sip:indices
  ```
* Si no lo ha hecho instale yarn para manejar paquetes javascript:
  ```sh
  doas pkg_add bash
  ftp -o- https://yarnpkg.com/install.sh | bash
  . ~/.profile
  ```
* Instale librerías Javascript requeridas al lado del cliente con:
```sh
  CXX=c++ yarn install
  ```
* Lance la aplicación en modo de desarrollo. En el siguiente ejemplo el 
  parametro `-p` indica el puerto por el cual escuchará la aplicación 
  y el parámetro `-b` indica la dirección IP como **0.0.0.0**
  para que se pueda acceder desde cualquiera de las IPs configuradas en 
  las interfaces de red:
```sh
  bin/rails s -p 2300 -b 0.0.0.0
```
* Examine con un navegador que tenga habilitadas las galletas (cookies) 
  en el puerto 2300: `http://127.0.0.1:2300`.  (Por eso si usa el 
  navegador `w3m` añada la opción `-cookie`) 
* Cuando requiera detener basta que de Control-C o que busque el
  proceso con ruby que corre en el puerto 3000 y lo elimine con `kill`:
  ```sh
  ps ax | grep "ruby.*2300"
  kill 323122  # cambiar 323122 por número de proceso que de el anterior
  ```
* En este modo es recomendable borrar recursos precompilados 
  ```sh
  rm -rf public/assets/*
  ```

### Pruebas ⚙️

Se harán pruebas a modelos, rutas, controladores y vistas en 
directorio `test`

Se harán pruebas del sistema con sideex (ver carpeta `test/sideex` y 
documentación de como hacerlas en 
<https://github.com/pasosdeJesus/sip/blob/master/doc/pruebas-al-sistema-con-sideex.md>
).  

Si ya configuró el servidor de desarrollo como se explicó antes y 
logró ver la aplicación corriendo puede ejecutar las pruebas de 
integración con:

```sh
RAILS_ENV=test bin/rails db:reset
RAILS_ENV=test bin/rails sip:indices
bin/rails test
```

Y para ejecutar las pruebas del sistema, ejecute la aplicación en modo 
de desarrollo y desde el navegador en el que la visualiza, instale 
la extensión sideex (http://www.sideex.org/), 
cargue las suits de prueba de la carpeta `test/sideex` y corralas.  
La mayoría de pruebas debería pasar (en ocasiones algunas no pasan 
por demoras en la aplicación para servir páginas o responder AJAX, 
pero si ejecuta varias veces eventualmente mejorando servidor,
cliente o conexión entre ambos, deberían pasar).


### Despliegue en sitio de producción con unicorn ⌨️
* Se recomienda que deje fuentes en ```/var/www/htdocs/jn635_pdJ```
* Siga los mismos pasos para configurar un servidor de desarrollo 
  --excepto lanzar
* Cree la base de datos `jn635pdJ_produccion` con dueño `sipdes`.  
  Por ejemplo en adJ desde el usuario `_postgresql`:
```sh
  createdb -Upostgres -h/var/www/var/run/postgresql -Osipdes jn635pdJ_produccion
```
* Edite credenciales cifradas con:
```sh
EDITOR=vim bin/rails credentials:edit
```
y 
```sh
RAILS_ENV=production EDITOR=vim bin/rails credentials:edit
```
* Ejecute
```sh
  RAILS_ENV=production bin/rails db:setup 
  RAILS_ENV=production bin/rails db:migrate
  RAILS_ENV=production bin/rails sip:indices
```
* Deje el mismo punto de montaje que usará con el servidor web en 
  `config/application.rb`, `config/routes.rb` y 
  `config/initializers/punto_montaje.rb`
* Configure ruta para anexos y respaldos en 
  `config/initializers/sip.rb` --recomendable en ruta que respalde 
   con periodicidad.
* Elija un puerto local no usado (digamos 2009)
* Como servidor web recomendamos nginx, suponiendo que el puerto 
  elegido es 2009, en la sección http agregue:
```
  upstream unicornjn635pdJ {
	  server 127.0.0.1:2009 fail_timeout=0;
  }
```
* Y agregue también un dominio virtual (digamos `jn635pdJ.pasosdeJesus.org`) con:
```
  server {
    listen 443;
    ssl on;
    ssl_certificate /etc/ssl/server.crt;
    ssl_certificate_key /etc/ssl/private/server.key;
    root /var/www/htdocs/jn635_pdJ/;
    server_name jn635pdJ.pasosdeJesus.org
    error_log logs/jn635error.log;
    
    location /mercadocampesino {
      try_files $uri @unicornjn635pdJ;
    }

    location @unicornjn635pdJ {
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header Host $http_host;
      proxy_redirect off;
      proxy_pass http://unicornjn635pdJ;
      error_page 500 502 503 504 /500.html;
      keepalive_timeout 10;
    }
    
    location ^~ /mercadocampesino/assets/ {
      gzip_static on;
      expires max;
      add_header Cache-Control public;
      root /var/www/htdocs/jn635_pdJ/public/;
    }

    location ^~ /mercadocampesino/images/ {
      gzip_static on;
      expires max;
      add_header Cache-Control public;
      root /var/www/htdocs/jn635_pdJ/public/;
    }
    
    location ^~ /mercadocampesino/packs/ {
      gzip_static on;
      add_header Cache-Control public;
      root /var/www/htdocs/jn635_pdJ/public/;
    }
    
  }
```
* Precompile los recursos 
```sh 
RAILS_ENV=production bin/rails assets:precompile
```
* Tras reiniciar nginx, inicie unicorn desde directorio con fuentes con algo como (cambiando la llave y el puerto):
```sh 
PUERTOUNICORN=2009  DIRAP=/var/www/htdocs/jn635_pdJ USUARIO_AP=$USER SECRET_KEY_BASE=8ff0ee3b245d827293e0ae9f46e684a5232347fecf772e650cc59bb9c7b0d199070c89165f52179a531c5c28f0d3ec1652a16f88a47c28a03600e7db2aab2745 ./bin/u.sh
```
* Para iniciar en cada arranque, por ejemplo en adJ cree 
  `/etc/rc.d/jn635_pdJ` con:
```sh

servicio="PUERTOUNICORN=2009 DIRAP=/var/www/htdocs/jn635_pdJ USUARIO_AP=miusuario SECRET_KEY_BASE=8ff0ee3b245d827293e0ae9f46e684a5232347fecf772e650cc59bb9c7b0d199070c89165f52179a531c5c28f0d3ec1652a16f88a47c28a03600e7db2aab2745 /var/www/htdocs/jn635_pdJ/bin/u.sh"


. /etc/rc.d/rc.subr

rc_check() {
        ps axw | grep "[r]uby.*unicorn_rails .*jn635_pdJ[/]" > /dev/null
}

rc_stop() {
        p=`ps axw | grep "[r]uby.*unicorn_rails.*master .*jn635_pdJ[/]" | sed -e "s/^ *\([0-9]*\) .*/\1/g"`
	kill $p
}

rc_cmd $1
```
  Inicielo con:
```
doas sh /etc/rc.d/jn635_pdJ -d start
```
Y una vez opere bien, incluya `jn635_pdJ` en la variable
`pkg_scripts` de `/etc/rc.conf.local`

### Actualización de servidor de desarrollo :arrows_clockwise:

* Detenga el servidor de desarrollo (teclas Control-C)
* Actualice fuentes: `git pull`
* Instale nuevas versiones de gemas requeridas: 
` sh
  bundle install
`
* Aplique cambios a base de datos: `bin/rails db:migrate`
* Actualice tablas básicas: `bin/rails sivel:actbasicas`
* Actualice índices: `bin/rails sip:indices`
* Lance nuevamente el servidor de desarrollo: `bin/rails s -p 2300 -b 0.0.0.0`

### Actualización de servidor de producción :arrows_clockwise:

Son practicamente los mismos pasos que emplea para actualizar servidor 
de desarrollo, excepto que `unicorn` se detiene con pkill y se inica
como se describió en Despliegue y que debe preceder cada rake con 
```
RAILS_ENV=production
```

### Respaldos :thumbsup:

En el sitio de producción se recomienda agregar una tarea cron con:

``` sh
cd /var/www/htdocs/jn635_pdJ/; RAILS_ENV=production bin/rake sip:vuelca 
```

## Desarrollo y documentación para desarrolladores :abc:

El desarrollo debe centrarse en esta aplicación y los motores
`sip`, `mr519_gen` y `heb412_gen`.

La documentación general para desarrolladores que mantenemos está en:
<https://github.com/pasosdeJesus/sip/blob/master/doc/README.md>

## Términos de reproducción, código abierto

Pasos de Jesús típicamente ha usado como términos de reproducción
el dominio público de acuerdo a la legislación colombiana que 
sólo exige crédito a autores. Sin embargo hemos notado modificaciones 
recientes a la legislación de derechos de autor en Colombia en lo 
relacionado a dominio público.

Para evitar confusiones, estamos usando ahora la licencia ISC
que es internacional y equivalente, es decir:
* Permite uso comercial
* Permite modificaciones
* Permite distribución
* Permite uso privado
* No ofrece garantías
* Sólo requiere que se mantengan crédito

## Créditos ✒️

Ver [contribuyentes](https://github.com/pasosdeJesus/jn635_pdJ/graphs/contributors) y 
<https://github.com/pasosdeJesus/jn635_pdJ/blob/master/CREDITOS.md>
