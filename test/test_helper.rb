require 'rubygems'
require 'test/unit'
require 'active_support'

require 'monitaur'

ENV['RAILS_ENV'] = 'test'

ENV['RAILS_ROOT'] ||= "/Users/Jason/Sites/rubyrumble/monitaur_sample" #File.dirname(__FILE__) + '/../../..' 

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))
require 'rails/test_help'



