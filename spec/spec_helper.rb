require 'webmock/rspec'
require File.expand_path '../../application.rb', __FILE__

ENV['RACK_ENV'] = 'test'