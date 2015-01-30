require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sinatra'

require 'sass/plugin/rack'
require 'compass'
require './application'


root = ::File.dirname(__FILE__)

#set :app_file, __FILE__
#set :root, File.dirname(__FILE__)
#set :views, "views"

# Compass
Compass.add_project_configuration(root + '/config/compass.rb')
Compass.configure_sass_plugin!

# Middleware
use Rack::ShowStatus      # Nice looking 404s and other messages
use Rack::ShowExceptions  # Nice looking errors
use Sass::Plugin::Rack    # Compile Sass on the fly

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# use coffeescript for javascript
use Rack::Coffee, root: 'public', urls: '/javascripts'


run Sinatra::Application

