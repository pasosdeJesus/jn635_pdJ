# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)
Sip::carga_semillas_sql(conexion, nil, :cambios)

conexion.execute("INSERT INTO public.usuario 
                 (nusuario, email, encrypted_password, password, 
                  fechacreacion, created_at, updated_at, rol) 
                 VALUES ('sip', 'sip@localhost', 
  '$2a$10$DjawRiYaz.1zY43Mi3vyPumgvgyiRtXcXdqJ5redFjb0YyB2ofVVm',
                         '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
