require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'

task :environment do
  Sinatra::Application.environment = ENV['RACK_ENV']
end
