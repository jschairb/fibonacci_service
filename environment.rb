require 'bundler/setup'

require 'sinatra'
require 'json'

lib_dir = File.expand_path(File.join(File.dirname(__FILE__), "lib"))
$LOAD_PATH.unshift(lib_dir)

Dir.glob(File.join(lib_dir, '*.rb')) { |lib| require File.basename(lib, '.*') }
