require 'rasem'

module Hershey
  class Document
    BUFFER = 20.freeze

    def initialize(width: 400, height: 400, spacing: 3, vertical: 20)
      @words = []
      @pages = []
      @width = width
      @height = height
      @spacing = spacing
      @line = BUFFER
      @vertical = vertical
      @svg = <<-HEADER
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="#{width}" height="#{height}" version="1.1"
  xmlns="http://www.w3.org/2000/svg">
      HEADER
    end

    def <<(text)
      text.split(' ') do |word|
        @words << Words.new(word)
      end
    end

    alias_method :write, :<<

    def write_out
      # new_page
      str
      current_offset = BUFFER
      @words.each do |word|
        if word.spacing + current_offset > width
          @line += BUFFER * 3
          current_offset = BUFFER
        end
        @svg << word.to_path
      end
      @svg << "</svg>"
      @svg
    end

    private

    def new_page
      @pages << Page.new(width: @width, height: @height)
      @line = BUFFER
    end
  end
end
