1. crear archivo gemfile
2. ejecutar 'bundle install' en el directorio correspondiente --> esto genera el gemfile.lock
3. crear archivo routing.rb con el enrutamiento del site
4. crear archivo class_declaration con la l�gica de proceso --> incluir require_relative en routing.rb
5. crear directorio public
    - crear archivos HTML est�ticos que el servidor devuelve ante peticiones GET
    - crear archivos CSS para almacenar formatos
6. crear directorio views para los archivos .erb
    - crear archivos .erb con la construcci�n de la respuesta HTML que debe devolver el servidor
