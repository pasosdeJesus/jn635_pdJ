Rails.application.routes.draw do
  
  scope 'mercadocampesino' do
    devise_scope :usuario do
      get 'sign_out' => 'devise/sessions#destroy', as: 'sign_out'

      # El siguiente para superar mala generación del action en el formulario
      # cuando se autentica mal (genera 
      # /puntomontaje/puntomontaje/usuarios/sign_in )
      if (Rails.configuration.relative_url_root != '/') 
        ruta = File.join(Rails.configuration.relative_url_root, 
                         'usuarios/sign_in')
        post ruta, to: 'devise/sessions#create'
        get  ruta, to: 'devise/sessions#new'
      end
      get 'sign_up' => 'registrations#new', as: :sign_up
    end

    devise_for :usuarios, module: :devise, 
      controllers: { registrations: "registrations" }
    #devise_for :usuarios, :skip => [:registrations], module: :devise
    as :usuario do
      get 'usuarios/edit' => 'devise/registrations#edit', 
        :as => 'editar_registro_usuario'    
      put 'usuarios/:id' => 'devise/registrations#update', 
        :as => 'registro_usuario'            
    end
    resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' } 
        
    post 'usuarios/crea' => 'usuarios#create', :as => 'crea_usuario'           
    patch 'usuarios/:id/actualiza' => 'usuarios#update', 
      :as => 'actualiza_usuario'           
    get 'usuarios/reconfirma' => 'usuarios#reconfirma'

    root 'sip/hogar#index'
  end

  get 'usuarios/datosextra' => 'usuarios#datosextra'
  mount Sip::Engine, at: "/mercadocampesino"
  
end
