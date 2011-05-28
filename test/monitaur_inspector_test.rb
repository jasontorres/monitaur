require 'test_helper'

require 'monitaur/monitor'

class Monitaur::MonitorTest < ActiveSupport::TestCase

  def test_monitor_render
    monitor = Monitaur::Monitor.new

    output = monitor.render

    assert_equal output.class, Hash
  end

  def test_monitor_hooks
    monitor = Monitaur::Monitor.new

    test_hook = Proc.new do
      {'test'=> 'hook'}
    end

    monitor.hooks.push test_hook 
    
    output = monitor.render
 
    assert output['test'], 'hook'
  end

  def test_global_monitor_hooks

    test_hook = Proc.new do
      {'test'=> 'hook'}
    end

    another_hook = Proc.new do 
      {'disk' => `df`}
    end
 
    Monitaur::Monitor.config do |config|
      config.hooks << test_hook
    end

    monitor = Monitaur::Monitor.new
    assert_equal monitor.hooks, [test_hook]

  end

end


