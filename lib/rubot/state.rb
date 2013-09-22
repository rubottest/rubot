
module Rubot

  Directions = [:north, :east, :south, :west]

  module Movement
    NS = { :north => 1, :south => -1 }.freeze
    EW = { :east => 1, :west => -1 }.freeze
  end

  # Class state represents the position of a toy robot
  # at a point in time.
  class State

    attr_reader :ew, :ns, :face

    def initialize(ew, ns, face)
      @ew, @ns, @face = clamp(ew), clamp(ns), face
      freeze # States are immutable.
    end

    def ==(other)
      [:ew, :ns, :face].all? {|m| self.send(m) == other.send(m)}
    end

    def move
      State.new(move_ew, move_ns, face)
    end

    def left
      State.new(ew, ns, left_dir)
    end

    def right
      State.new(ew, ns, right_dir)
    end

    def to_s
      "#{ew},#{ns},#{face.to_s.upcase}"
    end

  private

    def clamp(num)
      return 0 if num < 0
      return max if num > max
      num
    end

    def max
      4
    end

    def left_dir
      Directions[(Directions.index(face) - 1) % Directions.length]
    end

    def right_dir
      Directions[(Directions.index(face) + 1) % Directions.length]
    end

    def move_ew
      ew + Movement::EW[face].to_i
    end

    def move_ns
      ns + Movement::NS[face].to_i
    end

  end

end
