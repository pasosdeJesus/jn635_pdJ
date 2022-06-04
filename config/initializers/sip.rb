require 'sip/version'

Sip.setup do |config|
  config.ruta_anexos = ENV.fetch('SIP_RUTA_ANEXOS', 
                                 "#{Rails.root}/archivos/anexos")
  config.ruta_volcados = ENV.fetch('SIP_RUTA_VOLCADOS',
                                   "#{Rails.root}/archivos/bd")
  # En heroku los anexos son super-temporales
  if !ENV["HEROKU_POSTGRESQL_GREEN_URL"].nil?
    config.ruta_anexos = "#{Rails.root}/tmp/"
  end
  config.titulo = "Jn635 0.2"
  config.descripcion = "Ejemplo de aplicación web con autenticación y registro de usuarios"
  config.codigofuente = "https://github.com/pasosdeJesus/jn635_pdJ"
  config.urlcontribuyentes = "https://github.com/pasosdeJesus/jn635_pdJ"
  config.urlcreditos = "https://github.com/pasosdeJesus/jn635_pdJ/blob/main/CREDITOS.md"
  config.agradecimientoDios = "<p>
  Agradecimientos a Jesús que es Dios y es perdonador.
</p>
<blockquote>
De Jehová nuestro Dios es el tener misericordia y el perdonar, aunque
contra él nos hemos rebelado
<br>
Daniel 9:9
</blockquote>
</p>".html_safe

  config.longitud_nusuario = 255
end

