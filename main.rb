module Basic

  class Main

    def initialize(argv)
      @args = Arguments.new(argv)
      @program = Program.load(ARGF)
      @runtime = Runtime.new(:program => @program)
    end

    def run
      @runtime.run
    end

  end

end
