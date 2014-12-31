module Hershey
  class Document
    BUFFER = 20.freeze
    SIDE = 10.freeze
    HEIGHT_STRING = "jfdsklahfdjksjhaljfdskahj".freeze

    def initialize(width: 500, height: 500, spacing: 3, vertical: 20, font: :futural)
      @words = []
      @pages = []
      @width = width
      @height = height
      @spacing = spacing
      @line = BUFFER
      @vertical = vertical
      @closed = false
      @font = font
      @svg = <<-HEADER
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="#{@width}" height="#{HEIGHT_STRING}" version="1.1"
  xmlns="http://www.w3.org/2000/svg">
      HEADER
    end

    def <<(text)
      word = ""
      text.each_char do |c|
        if c == " "
          @words << Word.new(word, font: @font)
          word = ''
          @words << :space
        elsif c == "\n"
          @words << Word.new(word, font: @font)
          word = ''
          @words << :break
        else
          word << c
        end
      end
      @words << Word.new(word, font: @font) unless word == ''
    end

    alias_method :write, :<<

    def svg
      write_out unless @closed
      @svg
    end

    private

    def write_out
      # new_page
      space = Character.new(' ').spacing
      current_offset = SIDE
      @svg << %Q{<g transform="translate(#{SIDE},#{@line})">}
      @words.each do |word|
        if word.is_a?(Word)
          if word.spacing + current_offset > @width
            @line += BUFFER * 2
            current_offset = SIDE
            @svg << %Q{</g><g transform="translate(#{SIDE},#{@line})">}
          end
          @svg << word.to_path(current_offset)
          current_offset += word.spacing
        elsif word == :space
          current_offset += space
        elsif word == :break
          @line += BUFFER * 2
          current_offset = SIDE
          @svg << %Q{</g><g transform="translate(#{SIDE},#{@line})">}
        end
      end
      @svg << "</g></svg>"
      @svg.gsub!(HEIGHT_STRING, (@line + BUFFER).to_s)
      @closed = true
    end

    def new_page
      @pages << Page.new(width: @width, height: @height)
      @line = BUFFER
    end
  end
end
