require 'rubot/state'

module Rubot

  # Class DSL implements the toy robot control language
  # E.G. Dsl.new.run("PLACE 0,0,NORTH \n MOVE \n REPORT").output
  class Dsl
    attr_reader :status, :output

    def initialize
      @status = nil
      @output = []
    end

    def run(script)
      self.instance_eval(script.downcase)
      self
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
