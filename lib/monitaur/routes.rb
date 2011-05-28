require 'action_dispatch'

module ActionDispatch::Routing
  class Mapper
    def monitaur
      match "/monitaur" =>  "monitaur/monitaur#index", :as => :monitaur
    end
  end
end
