rails new QrCode -d postgresql
remove gem 'jbuilder', '~> 2.7' if you dont need to render json responses
bundle add 'dotenv-rails'
touch .env
add db connection details to .env and setup database.yml file
bundle exec rake db:create
rails g scaffold user first_name:string last_name:string role:belongs_to
rails g scaffold role name:string description:string
rails g scaffold product name:string description:text 'price:decimal{5,2}', user:belongs_to
bundle exec rake db:migrate
bundle add devise
bundle exec rails g devise:install
rails generate devise:views users
set config.scoped_views = true if you want to customise devise views
add following to config/environments/development.rb
	config.action_mailer.default_url_options = { host: ENV.fetch('SITE_HOST') }
setup SITE_HOST in .env file
	SITE_HOST='localhost:3000'
set default routes
  root to: 'products#index'

rails g devise User
bundle exec rake db:migrate
add the following in controllers - before_action :authenticate_user!
generate some seed data in db/seeds.rb
  bundle exec rake db:seed
setup bootstrap
yarn add bootstrap@4.3.1 jquery popper.js

add following to config/webpack/environment.js
  environment.plugins.append("Provide", new webpack.ProvidePlugin({
	$: 'jquery',
	jQuery: 'jquery',
	Popper: ['popper.js', 'default']
  }))

add following to app/assets/stylesheets/application.css
  *= require bootstrap
bundle add cancancan
rails g cancan:ability

bundle add aasm
rails generate aasm Product
bundle add will_paginate
to add jquery
  yarn add jquery
  	add following to environment.js
  	environment.plugins.prepend('Provide',
  	new webpack.ProvidePlugin({
    	$: 'jquery/src/jquery',
    	jQuery: 'jquery/src/jquery'
  	})
	)
	add following to application.js
	require('jquery')

for datepicker
   yarn add moment
   yarn add tempusdominus-bootstrap-4

   add following to environment.js
     moment: 'moment/moment'
   add following to application.js
     require("tempusdominus-bootstrap-4")

bundle add rqrcode
bundle add rqrcode_png
