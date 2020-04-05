# encoding: UTF-8

require 'devise/registrations_controller'
require 'mail'

class ::RegistrationsController < Devise::RegistrationsController 

  # Ver SessionsController
  skip_before_action :require_no_authentication

  def new
    if current_usuario 
        sign_out(current_usuario)
    end
    build_resource({})
    respond_with self.resource
  end

  def create
    d = ::Mail::Address.new(params[:usuario][:email]).domain
    params[:usuario][:nusuario] = 
      params[:usuario][:email].gsub(/[@.]/,"_")
    params[:usuario][:fechacreacion] = Date.today
    super
      #set_flash_message :error, :correo_desconocido
      #clean_up_passwords resource
      #respond_with self.resource, location: '/'
    #byebug
  end

  private

  def sign_up_params
    allow = [:email, :nusuario, :password, :password_confirmation, 
             :fechacreacion]
    params.require(resource_name).permit(allow)
  end

end
