module Hershey
  class Character
    def initialize(character)
      @char = character.to_s
    end

    def to_s
      char
    end

    def char
      @char
    end
  end
end
