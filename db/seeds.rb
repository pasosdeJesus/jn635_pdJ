conexion = ActiveRecord::Base.connection();

# De motores
Sip::carga_semillas_sql(conexion, 'sip', :datos)
motor = ['heb412_gen', './']
motor.each do |m|
    Sip::carga_semillas_sql(conexion, m, :cambios)
    Sip::carga_semillas_sql(conexion, m, :datos)
end


conexion.execute("INSERT INTO public.usuario 
                 (nusuario, email, encrypted_password, password, 
                  fechacreacion, created_at, updated_at, rol) 
                 VALUES ('sip', 'sip@localhost', 
  '$2a$10$DjawRiYaz.1zY43Mi3vyPumgvgyiRtXcXdqJ5redFjb0YyB2ofVVm',
                         '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
