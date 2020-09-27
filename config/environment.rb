require 'bundler'
Bundler.require

APP_ROOT = File.expand_path("..", __dir__)

Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }

Dir.glob(File.join(APP_ROOT, 'app', 'views', '*.rb')).each { |file| require file }

Dir.glob(File.join(APP_ROOT, 'app', 'helpers', '*.rb')).each { |file| require file }

require File.join(APP_ROOT, 'config', 'database')
