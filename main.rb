module Basic

  class Main

    def initialize(argv)
      @args = Arguments.new(argv)
      @program = Program.new
    end

    def run
      @program.load(ARGF)
    end

  end

end
