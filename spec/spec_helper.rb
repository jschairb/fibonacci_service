require File.join(File.dirname(__FILE__), '../application')

require 'rspec'
require 'rack/test'

# Sinatra::Base.set :environment, :test
# Sinatra::Base.set :run, false
# Sinatra::Base.set :raise_errors, true
# Sinatra::Base.set :logging, false
Sinatra::Base.set :show_exceptions, false
