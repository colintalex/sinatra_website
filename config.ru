require 'bundler'
Bundler.require

require './config/environment'

$LOAD_PATH.unshift(File.expand_path('app', __dir__))

run SinatraWebsite
