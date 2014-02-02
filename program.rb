module Basic

  class Program

    def initialize
      @lines = Lines.new
    end

    def load(file)
      file.each_line do |line|
        @lines << Line.parse(line)
      end
    end

  end

end
