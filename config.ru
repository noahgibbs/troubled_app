# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

if ENV['USE_RUBY_PROF']
  use Rack::RubyProf, :path => 'tmp/ruby-prof'
end


run Rails.application
