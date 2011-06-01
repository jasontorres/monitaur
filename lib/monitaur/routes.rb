require 'action_dispatch'

module Monitaur
  module Routing
    module MapperExtensions
      def monitaur
        match "/monitaur" =>  "monitaur/monitaur#index", :as => :monitaur
      end
    end
  end
end

ActionDispatch::Routing::Mapper.send :include, Monitaur::Routing::MapperExtensions

