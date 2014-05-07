source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.1'
gem 'pg'
gem 'foreigner'
gem 'rails_12factor', group: :production
gem 'unicorn'

gem "omniauth"
gem "omniauth-github"

gem "pundit"

gem 'simple_form'
gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use debugger
group :development, :test do
  gem 'dotenv-rails'
  gem 'rails-footnotes'
  gem 'debugger'
  gem 'sqlite3'
  gem 'coveralls', require: false
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'm'
end
