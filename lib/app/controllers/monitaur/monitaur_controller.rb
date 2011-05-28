module Monitaur

  class MonitaurController < ApplicationController
    
    unloadable

    def index
      @monitaur = Monitaur::Monitor.new
     
      @output = @monitaur.render

      render :json => @output.to_hash, :layout => false
    end

  end

end
