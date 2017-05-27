module Hershey
  class Character
    OFFSET = ' '.ord
    MATCHER = /\A(?<midpoint>[\d-]+) +(?<width>[\d-]+) ?(?<path>[\w -]*)\Z/.freeze

    def initialize(character, font: :futural)
      @char = I18n.transliterate(character.to_s[0] || ' ').to_sym
      @font = font
    end

    def to_path(offset)
      %Q{<path stroke="black" fill="none" d="#{info[:path]}" transform="translate(#{offset - info[:midpoint]},0)"></path>}
    end

    def spacing
      info[:spacing]
    end

    def char
      @char
    end

    alias_method :to_s, :char

    private

    def info
      @@chars ||= {}
      unless @@chars[@char]
        match = Hershey::FONTS[@font][@char.to_s.ord - OFFSET].match(MATCHER)
        @@chars[@char] = {
          path: path_handler(match['path']),
          midpoint: match['midpoint'].to_i,
          spacing: match['width'].to_i - match['midpoint'].to_i,
        }
      end
      @@chars[@char]
    end

    def path_handler(path)
      n = `node /Users/wmd/tmp/smooth.js '#{path}'`.strip
      puts n
      n
    end
  end
end
