# What Are The Six Unwelcome Hosts?
#
# http://thecodelesscode.com/case/71
#
# Not every Unwelcome Host lives here, but your profiler will see them all in time.

class DelaysController < ApplicationController
  def idle
    sleep 1
    render :text => "Oh, hey, are you still here?"
  end

  def justfine
    render :text => "Lovely day for it!"
  end

  def busy_ruby
    my_var = 3.71453234
    10_000.times do
      my_var = Math.log(my_var * 100)
    end
    render :text => "Eventually, you get #{my_var.inspect} for sure!"
  end

  def database
    
  end

  def occasional_delay
    if rand() > 0.99
      sleep 10
    end
    render :text => "My median response time is simply amazing! My AppDex numbers are impeccable!"
  end

  def garbage
    10_000.times do
      "I am a new gratuitous string!" * 5_000
    end
    render :text => "Hello!"
  end

  def exception
    raise "Oh $DEITY no!"
  end
end
