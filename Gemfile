source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'bcrypt'

gem 'bootsnap', '>=1.1.0', require: false

gem 'cancancan'

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax' # Formularios anidados (algunos con ajax)

gem 'coffee-rails' # Use CoffeeScript for .coffee assets and views

gem 'devise'

gem 'devise-i18n'

gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'paperclip'

gem 'pg'  # Use postgresql as the database for Active Record

gem 'puma' # Use Puma as the app server

gem 'rails' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'rails-i18n'

gem 'react-rails'

gem 'sassc-rails' # Use SCSS for stylesheets

gem 'simple_form'

gem 'twitter_cldr' 

gem 'tzinfo'

gem 'webpacker'

gem 'webpacker-react', "~> 1.0.0.beta.1"

gem 'will_paginate'


group :development, :test do
  #gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem 'colorize' # Colores en terminal 
end

group :development do
  gem 'web-console', '>= 3.3.0'

  gem 'spring'
end

group :test do

  gem 'simplecov'

end


gem 'sip', 
  github: 'pasosdeJesus/sip'
  #path: '../sip/'


gem 'mr519_gen', github: 'pasosdeJesus/mr519_gen'

gem 'heb412_gen', github: 'pasosdeJesus/heb412_gen'


