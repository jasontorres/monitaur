require 'rails'
require 'action_controller'
require 'active_support'
require 'active_support/dependencies'

require 'monitaur/monitor' 
require 'monitaur/routes'

require 'sysinfo'

module Monitaur

  %w{ controllers }.each do |dir|
    path = File.join(File.dirname(__FILE__), 'app', dir)
    $LOAD_PATH << path
    ActiveSupport::Dependencies.autoload_paths << path
    ActiveSupport::Dependencies.autoload_once_paths.delete(path)
  end

end

