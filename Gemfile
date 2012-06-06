source 'http://rubygems.org'

gem 'rails', '3.2.1'
gem 'mysql'
gem 'rake', '0.9.2.2'
gem 'jquery-rails'
gem 'sass-rails', '~> 3.1'
gem 'bootstrap-sass', '~> 2.0.3'
gem 'simple_form'
gem 'rockstar'
gem 'pg' # heroku doesn't use mysql
gem 'thin'
gem 'librmpd'

group :development, :test do
  gem 'annotate'

  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'spork-rails'
  gem 'simplecov'

  gem 'debugger'

  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-spork'

  gem 'rb-inotify', '>= 0.5.1'
  gem 'libnotify'
  # console
  gem 'awesome_print'
  gem 'interactive_editor'
  gem 'wirble'
  gem 'pry-rails'
end

# Gems used only for assets and not required
# # in production environments by default.
group :assets do
  gem 'jquery-rails'
  gem 'haml-rails'
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', ">= 1.0.3"
  gem 'node'
end


#gem  'metrical'
#gem 'cancan' #authorization
#gem 'kaminari' #pagination
#gem 'simple_form'
#gem 'autotest-rails-pure' -- make sure to add autotest:/autotest-all: to cucumber.yml (and just copy options from default profile)
#gem 'factory_girl_rails' -- see bottom post https://github.com/timcharper/spork/issues/83
#gem 'shoulda' (or 'remarkable')
#gem 'guard-spork' #must be before cuc/rspec guard gems
#gem 'rspec-instafail' # use with --fail-fast -- note: for some utterly strange reason rails can't see this (i.e. in plain irb 'require "rspec/instafail" returns true, while in rails console, returns nil, and when used with rspec it causes a stacktrace.. (and note that according to the docs, No require is used in this gemfile, rspec handles that...but rspec can't find it either..


# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
