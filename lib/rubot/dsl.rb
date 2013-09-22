require 'rubot/state'

module Rubot
  # Rather than build a parser, take
  # advantage of the fact that the robot
  # scripts are valid (although not idiomatic) ruby.

  # Converting the script to lowercase isn't great,
  # but it makes for far more idiomatic code.
  # I tried using method constants instead but it was harder to understand.

  class Dsl
    attr_reader :status, :output

    def initialize
      @status = nil
      @output = []
    end

    def run(script)
      self.instance_eval(script.downcase)
    end

    def self.status_method(name)
      define_method(name) do |*args|
        @status = status.send(name, *args) if status
      end
    end

    status_method :move
    status_method :left
    status_method :right

    # Define methods for each direction, turning
    # barewords like 'north' into calls returning :north
    Directions.each {|d| define_method(d) { d }}

    def place(ew, ns, direction)
      @status = Rubot::State.new(ew, ns, direction)
    end

    def report
      output << @status.to_s
    end

  end
end
