module Basic

  class RndFunction

    def initialize
      @rand = 0
    end

    def call(program, args)
      raise IllegalFunctionCall unless args.size == 1
      new_number = args.first.eval(program).to_f > 0
      if new_number
        @rand = rand
      end
      BasicFloat.new(@rand)
    end

  end

end
