module Basic

  class Line

    def initialize(source_line)
      @source_line = source_line
    end


    #TODO: User-friendly handling of parslet errors
    def statements
      parser = Parser.new
      transform = ParserTransform.new
      tree = parser.parse(@source_line.chomp)
      transform.apply(tree)
    end

  end

end
