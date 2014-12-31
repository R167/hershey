module Hershey
  class Word
    attr_reader :characters

    def initialize(text, options = {})
      @spacing = 0

      @characters = text.each_char.map do |c|
        char = Character.new(c, options)
        @spacing += char.spacing

        char
      end
    end

    def spacing
      @spacing ||= @characters.inject(0) {|memo, c| memo + c.spacing}
    end

    def to_path(current_offset)
      offset = 0
      letters = []
      @characters.each do |c|
        letters << c.to_path(offset)
        offset += c.spacing
      end

      %Q{<g transform="translate(#{current_offset},0)">#{letters.join}</g>}
    end
  end
end