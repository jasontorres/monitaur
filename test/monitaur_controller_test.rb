require 'test_helper'

require 'monitaur/routes'
require 'monitaur/monitaur_controller'
 
unless defined?(ApplicationController)
class ApplicationController; end; 
end

class Monitaur::MonitaurController; def rescue_action(e) raise e end; end
 
class Monitaur::MonitaurControllerTest < ActionController::TestCase
  
  def setup 
    Rails.application.routes.draw do 
      monitaur
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end

end

