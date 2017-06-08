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
      Hershey::FONTS[@font][@char.to_s.ord - OFFSET]
    end

    def path_handler(path)
      path || (p `node /Users/wmd/tmp/smooth.js '#{path}'`.strip)
    end
  end
end
