# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)

conexion.execute("INSERT INTO public.usuario 
                 (nusuario, email, encrypted_password, password, 
                  fechacreacion, created_at, updated_at, rol) 
                 VALUES ('sip', 'sip@localhost', 
                         '$2a$04$uLWQzmlDYEaegYs4brFVYeLN9FeIE6vAPQqp9HgbQDGLKOV9dXTK6',
                         '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
