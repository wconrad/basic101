module Basic101

  class RndFunction

    def initialize
      @rand = 0
    end

    def name
      'RND'
    end

    def call(runtime, args)
      raise IllegalFunctionCall unless args.size == 1
      new_number = args.first.eval(runtime).to_f > 0
      if new_number
        @rand = runtime.rand
      end
      BasicFloat.new(@rand)
    end

  end

end
