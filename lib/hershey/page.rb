module Hershey
  class Page
    def initialize(width: 400, heigth: 400)
      @text = "<g>"
      @close = false
    end

    def <<(word)

    end
    alias_method :write, :<<

    def write_out
      close
      @text
    end

    def close
      @text << "</g>" unless @close
    end
  end

  class PageFullError < StandardError
  end
end