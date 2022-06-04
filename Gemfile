source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'bcrypt'

gem 'babel-transpiler'

gem 'bootsnap', '>=1.1.0', require: false

gem 'cancancan'

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax' # Formularios anidados (algunos con ajax)

gem 'coffee-rails' # Use CoffeeScript for .coffee assets and views

gem 'devise'

gem 'devise-i18n'

gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'jsbundling-rails'

gem 'kt-paperclip'

gem 'lazybox' # Dialogo modal

gem 'libxml-ruby'

gem 'matrix'

gem 'nokogiri', '>=1.11.1'

gem 'odf-report' # Genera ODT

gem 'prawn' # Para generar PDF

gem 'prawnto_2',  :require => 'prawnto'

gem 'prawn-table'

gem 'pg'  # Use postgresql as the database for Active Record

gem 'rails' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'rails-i18n'

gem 'redcarpet'

gem 'react-rails'

gem 'rubyzip', '>= 2.0'

gem 'rspreadsheet'

gem 'sassc-rails' # Use SCSS for stylesheets

gem 'simple_form'

gem 'sprockets-rails'

gem 'stimulus-rails'

gem 'turbo-rails'

gem 'twitter_cldr' 

gem 'tzinfo'


gem 'will_paginate'


#####
# Motores que se sobrecargan vistas (deben ponerse en orden de apilamiento 
# lógico y no alfabetico como las gemas anteriores) 


gem 'sip', # Motor generico
  git: 'https://github.com/pasosdeJesus/sip.git', branch: :main
  #path: '../sip'

gem 'mr519_gen', # Motor de gestion de formularios y encuestas
  git: 'https://github.com/pasosdeJesus/mr519_gen.git', branch: :main
  #path: '../mr519_gen'

gem 'heb412_gen',  # Motor de nube y llenado de plantillas
  git: 'https://github.com/pasosdeJesus/heb412_gen.git', branch: :main
  #path: '../heb412_gen'


group :development, :test do
  #gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem 'colorize' # Colores en terminal 

  gem 'dotenv-rails'
end

group :development do

  gem 'puma' # Use Puma as the app server

  gem 'web-console', '>= 3.3.0'

  gem 'spring'
end

group :test do
  gem 'rails-controller-testing'

  gem 'simplecov'
end

group :production do

  gem 'unicorn'

end

