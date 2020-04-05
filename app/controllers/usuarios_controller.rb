# encoding: UTF-8

require 'sip/concerns/controllers/usuarios_controller'

class UsuariosController < Heb412Gen::ModelosController
  include Sip::Concerns::Controllers::UsuariosController

  def atributos_index
    [ "id",
      "nusuario",
      "nombres",
      "apellidos",
      "email",
      "sip_grupo_ids",
      "habilitado",
    ]
  end

 
  def atributos_form
    r = []
    if can?(:create, ::Usuario)
      r += [ 
        "nusuario",
        "nombres",
        "apellidos",
        "descripcion"
      ]
    end
    if can?(:manage, ::Usuario)
      r += ["rol"]
    end
    if can?(:edit, ::Usuario)
      r += [
        "telefonos",
      ]
    end
    if can?(:create, ::Usuario)
      r += [
        "telefono",
        "telefono_con_whatsapp",
        "email",
        "tema",
        "sip_grupo",
        "departamento",
        "municipio",
        "clase",
        "barrio_vereda",
        "fechacreacion_localizada",
        "fechadeshabilitacion_localizada",
      ]
    end
    if can?(:manage, ::Usuario)
      r += [
        "encrypted_password",
        "failed_attempts",
        "unlock_token",
        "locked_at_localizada",
        "unconfirmed_email",
        "confirmation_token",
        "confirmed_at_localizada"
      ]
    end
    return r
  end

  def atributos_show
    r = []
    if can?(:read, ::Usuario)
      r += [ 
        "nusuario",
        "id",
        "nombres",
        "apellidos",
        "grupos",
        "email",
        "telefono",
        "telefono_con_whatsapp",
        "departamento",
        "municipio",
        "clase",
        "barrio_vereda",
      ]
    end
    if can?(:manage, ::Usuario)
      r += [
        "rol",
        "idioma",
        "encrypted_password",
        "fechacreacion_localizada",
        "fechadeshabilitacion_localizada",
        "failed_attempts",
        "unlock_token",
        "locked_at"
      ]
    end
    return r
  end
 
  def index_reordenar(c)
    if !params || !params[:filtro] || !params[:filtro][:bushabilitado]
      c = c.where("usuario.fechadeshabilitacion IS NULL")
    end
    c = c.reorder([:apellidos])
    return c
  end

  def medio_create(usuario)
    usuario.nombres = params[:usuario][:persona_attributes][:nombres]
    usuario.apellidos = params[:usuario][:persona_attributes][:apellidos]
  end

  def medio_update(usuario)
    medio_create(usuario)
  end

  def vistas_manejadas
    ['Usuario']
  end


  def new
    @miurl = crea_usuario_url 
    super
  end

  def create
    sip_pre_create
    super
    @registro.confirmed_at = Date.today
    @registro.save
  end

  def edit
    @miurl = actualiza_usuario_url 
    super
  end

  def devise_registrations_edit
    authorize! :read, Sip::Grupo
    render 'devise/registrations/edit'
  end

  def reconfirma
  end

  private

  def usuario_params
    p = params.require(:usuario).permit(
      :clase_id, 
      :confirmation_token,
      :confirmed_at_localizada,
      :current_sign_in_at, 
      :current_sign_in_ip, 
      :departamento_id, 
      :descripcion, 
      :email, 
      :encrypted_password, 
      :facebook, 
      :failed_attempts, 
      :fechacreacion_localizada, 
      :fechadeshabilitacion_localizada, 
      :id, 
      :last_sign_in_at, 
      :last_sign_in_ip, 
      :locked_at_localizada,
      :municipio_id, 
      :nusuario, 
      :password, 
      :reset_password_token, 
      :reset_password_sent_at, 
      :remember_created_at, 
      :rol, 
      :sign_in_count, 
      :telefono, 
      :telefono_con_whatsapp, 
      :tema_id, 
      :twitter, 
      :unconfirmed_email,
      :unlock_token, 
      :web, 
      :sip_grupo_ids => []
    )
    return p
  end

end
