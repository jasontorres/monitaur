module Monitaur

  class Configuration
    cattr_accessor :hooks

    @@hooks = [] # initialize an empty array
  end

  class Monitor

    @@config = Monitaur::Configuration

    attr_accessor :output
    attr_accessor :hooks

    def initialize
      @hooks ||= @@config.hooks 
    end

    ##
    # Returns a hash of the sysinfo values including values from hooks
    def render
      @output ||= {}

      @output.merge!(system_info)
      @output.merge!(active_record_connection)

      apply_hooks

      @output
    end

    ##
    # Apply hooks. Hooks are methods that gets executed after all the other info has been collected.
    # The hooks collection accepts a Proc, a method name (Symbol) or a Hash. Symbols has to be a special case 
    # because the method has to be visible on the Monitaur::Monitor class. Methods should return a Hash object 
    # that gets merged in the global output hash
    #
    def apply_hooks

      @hooks.each do |hook|
        
        hook_output = nil

        if hook.is_a?(Proc)
          hook_output = hook.call
        elsif hook.is_a?(Symbol)
          hook_output = eval(hook.to_s) # run the symbol
        elsif hook.is_a?(Hash)
          hook_output = hook # hash already? assign to output
        end

        @output.merge!(hook_output) if hook_output && hook_output.is_a?(Hash)


      end unless @hooks.empty?

    end

    def self.config

      if block_given?
        yield(@@config)
      end

    end



  protected

    # TODO: Refactor this and move this to another module
    def system_info
      si = SysInfo.new
      si.to_hash
    rescue 
      {}
    end

    def active_record_connection
      running = false

      if defined?(ActiveRecord)
        begin
          if ActiveRecord::Base.connection.execute("select 1")
            running = true
          end
       end

      
      end
        
      {:database => running}
    end

  end



end
