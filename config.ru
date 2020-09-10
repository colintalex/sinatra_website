require 'bundler'
Bundler.require
require 'active_record'


$LOAD_PATH.unshift(File.expand_path('app', __dir__))

require File.expand_path('../config/environment', __FILE__)

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

run SinatraWebsite::Application
